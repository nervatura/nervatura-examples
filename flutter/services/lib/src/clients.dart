/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart'
    show
        JWT,
        JWTAlgorithm,
        JWTKey,
        RSAPrivateKey,
        ECPrivateKey,
        EdDSAPrivateKey;

import '../services.dart';

Map<String, ServiceClient Function(Map<String, String> conf)> clients = {
  'rpc': (Map<String, String> conf) =>
      RpcClient(conf['host'].toString(), int.parse(conf['rpcPort'].toString())),
  'cli': (Map<String, String> conf) =>
      CliClient(conf['servPath'].toString(), conf),
  'cgo': (Map<String, String> conf) => CgoClient(conf['servLib'].toString()),
  'http': (Map<String, String> conf) => HttpClient(
      conf['host'].toString(), int.parse(conf['httpPort'].toString()))
};

String createToken(Map<String, String> params) {
  final jwt = JWT(
      {
        'username': params['username'],
        'database': params['database'],
      },
      issuer: params['issuer'],
      header: {
        'kid': params['kid'],
      });
  Map<String, JWTKey Function(String keyValue)> keyMap = {
    'RS256': (String keyValue) => RSAPrivateKey(keyValue),
    'RS384': (String keyValue) => RSAPrivateKey(keyValue),
    'RS512': (String keyValue) => RSAPrivateKey(keyValue),
    'ES256': (String keyValue) => ECPrivateKey(keyValue),
    'ES384': (String keyValue) => ECPrivateKey(keyValue),
    'ES512': (String keyValue) => ECPrivateKey(keyValue),
    'EdDSA': (String keyValue) => EdDSAPrivateKey(utf8.encode(keyValue)),
  };
  final privateKey =
      keyMap[params['algorithm'].toString()]!(params['privateKey'].toString());
  return jwt.sign(
    privateKey,
    algorithm: JWTAlgorithm.fromName(params['algorithm'].toString()),
    expiresIn: Duration(hours: int.parse(params['tokenExp'].toString())),
  );
}
