package utils

import (
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"io"
	"math/big"
	"strconv"
	"strings"
	"time"

	"github.com/golang-jwt/jwt/v4"
)

var tokenAlg = map[string]string{
	"RS256": "RSA", "RS384": "RSA", "RS512": "RSA",
	"ES256": "ECDSA", "ES384": "ECDSA", "ES512": "ECDSA",
	"EdDSA": "EdDSA",
	"PS256": "PSS", "PS384": "PSS", "PS512": "PSS",
	"HS256": "HMAC", "HS384": "HMAC", "HS512": "HMAC",
}

func GetHash(text string) string {
	hasher := sha256.New()
	_, err := hasher.Write([]byte(text))
	if err != nil {
		return text
	}
	return hex.EncodeToString(hasher.Sum(nil))
}

// ToString - safe string conversion
func ToString(value interface{}, defValue string) string {
	if stringValue, valid := value.(string); valid {
		if stringValue == "" {
			return defValue
		}
		return stringValue
	}
	if boolValue, valid := value.(bool); valid {
		return strconv.FormatBool(boolValue)
	}
	if intValue, valid := value.(int); valid {
		return strconv.Itoa(intValue)
	}
	if intValue, valid := value.(int32); valid {
		return strconv.Itoa(int(intValue))
	}
	if intValue, valid := value.(int64); valid {
		return strconv.FormatInt(intValue, 10)
	}
	if floatValue, valid := value.(float32); valid {
		return strconv.FormatFloat(float64(floatValue), 'f', -1, 64)
	}
	if floatValue, valid := value.(float64); valid {
		return strconv.FormatFloat(floatValue, 'f', -1, 64)
	}
	if timeValue, valid := value.(time.Time); valid {
		return timeValue.Format("2006-01-02T15:04:05-07:00")
	}
	return defValue
}

// ToFloat - safe float64 conversion
func ToFloat(value interface{}, defValue float64) float64 {
	if floatValue, valid := value.(float64); valid {
		if floatValue == 0 {
			return defValue
		}
		return floatValue
	}
	if boolValue, valid := value.(bool); valid {
		if boolValue {
			return 1
		}
	}
	if intValue, valid := value.(int); valid {
		return float64(intValue)
	}
	if intValue, valid := value.(int32); valid {
		return float64(intValue)
	}
	if intValue, valid := value.(int64); valid {
		return float64(intValue)
	}
	if floatValue, valid := value.(float32); valid {
		return float64(floatValue)
	}
	if stringValue, valid := value.(string); valid {
		floatValue, err := strconv.ParseFloat(stringValue, 64)
		if err == nil {
			return float64(floatValue)
		}
	}
	return defValue
}

// ToInteger - safe int64 conversion
func ToInteger(value interface{}, defValue int64) int64 {
	if intValue, valid := value.(int64); valid {
		if intValue == 0 {
			return defValue
		}
		return intValue
	}
	if boolValue, valid := value.(bool); valid {
		if boolValue {
			return 1
		}
	}
	if intValue, valid := value.(int); valid {
		return int64(intValue)
	}
	if intValue, valid := value.(int32); valid {
		return int64(intValue)
	}
	if floatValue, valid := value.(float32); valid {
		return int64(floatValue)
	}
	if floatValue, valid := value.(float64); valid {
		return int64(floatValue)
	}
	if stringValue, valid := value.(string); valid {
		intValue, err := strconv.ParseInt(stringValue, 10, 64)
		if err == nil {
			return int64(intValue)
		}
	}
	return defValue
}

// ToBoolean - safe bool conversion
func ToBoolean(value interface{}, defValue bool) bool {
	if boolValue, valid := value.(bool); valid {
		return boolValue
	}
	if intValue, valid := value.(int); valid {
		if intValue == 1 {
			return true
		}
	}
	if intValue, valid := value.(int32); valid {
		if intValue == 1 {
			return true
		}
	}
	if intValue, valid := value.(int64); valid {
		if intValue == 1 {
			return true
		}
	}
	if floatValue, valid := value.(float32); valid {
		if floatValue == 1 {
			return true
		}
	}
	if floatValue, valid := value.(float64); valid {
		if floatValue == 1 {
			return true
		}
	}
	if stringValue, valid := value.(string); valid {
		boolValue, err := strconv.ParseBool(stringValue)
		if err == nil {
			return boolValue
		}
	}
	return defValue
}

func ConvertToByte(data interface{}) ([]byte, error) {
	//var json = jsoniter.ConfigCompatibleWithStandardLibrary
	return json.Marshal(data)
}

func ConvertFromByte(data []byte, result interface{}) error {
	//var json = jsoniter.ConfigCompatibleWithStandardLibrary
	return json.Unmarshal(data, result)
}

func ConvertFromReader(data io.Reader, result interface{}) error {
	return json.NewDecoder(data).Decode(&result)
}

/*
CreateToken - create/refresh a Nervatura JWT token
*/
func CreateToken(username, database string, config map[string]interface{}) (result string, err error) {
	// ntClaims is a custom Nervatura claims type
	type ntClaims struct {
		Username string `json:"username"`
		Database string `json:"database"`
		jwt.RegisteredClaims
	}

	expirationTime := time.Now().Add(time.Duration(ToFloat(config["NT_TOKEN_EXP"], 1)) * time.Hour)
	claims := ntClaims{
		username,
		database,
		jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(expirationTime),
			Issuer:    ToString(config["NT_TOKEN_ISS"], "nervatura"),
		},
	}
	alg := ToString(config["NT_TOKEN_ALG"], "HS256")
	token := jwt.NewWithClaims(jwt.GetSigningMethod(alg), claims)
	token.Header["kid"] = ToString(config["NT_TOKEN_PRIVATE_KID"], GetHash("nervatura"))
	var key interface{} = []byte(ToString(config["NT_TOKEN_PRIVATE_KEY"], GetHash(time.Now().Format("20060102"))))
	key, err = parsePEM(tokenAlg[alg], "private", key.([]byte))
	if err != nil {
		return "", err
	}
	return token.SignedString(key)
}

func parsePEM(method, stype string, value []byte) (interface{}, error) {
	if method == "RSA" && stype == "private" {
		return jwt.ParseRSAPrivateKeyFromPEM(value)
	}
	if method == "ECDSA" && stype == "private" {
		return jwt.ParseECPrivateKeyFromPEM(value)
	}
	if method == "EdDSA" && stype == "private" {
		return jwt.ParseEdPrivateKeyFromPEM(value)
	}
	if method == "RSA" && stype == "public" {
		return jwt.ParseRSAPublicKeyFromPEM(value)
	}
	if method == "ECDSA" && stype == "public" {
		return jwt.ParseECPublicKeyFromPEM(value)
	}
	if method == "EdDSA" && stype == "public" {
		return jwt.ParseEdPublicKeyFromPEM(value)
	}
	return value, nil
}

func RandString(length int) string {
	chars := []rune("ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
		"abcdefghijklmnopqrstuvwxyz" +
		"0123456789")
	var b strings.Builder
	for i := 0; i < length; i++ {
		var n = big.NewInt(int64(i))
		n, _ = rand.Int(rand.Reader, big.NewInt(int64(len(chars))))
		b.WriteRune(chars[n.Int64()])
	}
	return b.String()
}
