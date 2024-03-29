<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Generated from protobuf message <code>nervatura.RequestFunction</code>
 */
class RequestFunction extends \Google\Protobuf\Internal\Message
{
    /**
     * Server function name
     *
     * Generated from protobuf field <code>string key = 1;</code>
     */
    protected $key = '';
    /**
     * The map of parameter values
     *
     * Generated from protobuf field <code>map<string, .nervatura.Value> values = 2;</code>
     */
    private $values;
    /**
     * Any json object. If it exists, the values are skip!
     *
     * Generated from protobuf field <code>bytes value = 3;</code>
     */
    protected $value = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type string $key
     *           Server function name
     *     @type array|\Google\Protobuf\Internal\MapField $values
     *           The map of parameter values
     *     @type string $value
     *           Any json object. If it exists, the values are skip!
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * Server function name
     *
     * Generated from protobuf field <code>string key = 1;</code>
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }

    /**
     * Server function name
     *
     * Generated from protobuf field <code>string key = 1;</code>
     * @param string $var
     * @return $this
     */
    public function setKey($var)
    {
        GPBUtil::checkString($var, True);
        $this->key = $var;

        return $this;
    }

    /**
     * The map of parameter values
     *
     * Generated from protobuf field <code>map<string, .nervatura.Value> values = 2;</code>
     * @return \Google\Protobuf\Internal\MapField
     */
    public function getValues()
    {
        return $this->values;
    }

    /**
     * The map of parameter values
     *
     * Generated from protobuf field <code>map<string, .nervatura.Value> values = 2;</code>
     * @param array|\Google\Protobuf\Internal\MapField $var
     * @return $this
     */
    public function setValues($var)
    {
        $arr = GPBUtil::checkMapField($var, \Google\Protobuf\Internal\GPBType::STRING, \Google\Protobuf\Internal\GPBType::MESSAGE, \Nervatura\Value::class);
        $this->values = $arr;

        return $this;
    }

    /**
     * Any json object. If it exists, the values are skip!
     *
     * Generated from protobuf field <code>bytes value = 3;</code>
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Any json object. If it exists, the values are skip!
     *
     * Generated from protobuf field <code>bytes value = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setValue($var)
    {
        GPBUtil::checkString($var, False);
        $this->value = $var;

        return $this;
    }

}

