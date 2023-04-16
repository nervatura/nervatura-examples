<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Generated from protobuf message <code>nervatura.Value</code>
 */
class Value extends \Google\Protobuf\Internal\Message
{
    protected $value;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type bool $boolean
     *     @type float $number
     *     @type string $text
     *          google.protobuf.NullValue null = 4;
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * Generated from protobuf field <code>bool boolean = 1;</code>
     * @return bool
     */
    public function getBoolean()
    {
        return $this->readOneof(1);
    }

    public function hasBoolean()
    {
        return $this->hasOneof(1);
    }

    /**
     * Generated from protobuf field <code>bool boolean = 1;</code>
     * @param bool $var
     * @return $this
     */
    public function setBoolean($var)
    {
        GPBUtil::checkBool($var);
        $this->writeOneof(1, $var);

        return $this;
    }

    /**
     * Generated from protobuf field <code>double number = 2;</code>
     * @return float
     */
    public function getNumber()
    {
        return $this->readOneof(2);
    }

    public function hasNumber()
    {
        return $this->hasOneof(2);
    }

    /**
     * Generated from protobuf field <code>double number = 2;</code>
     * @param float $var
     * @return $this
     */
    public function setNumber($var)
    {
        GPBUtil::checkDouble($var);
        $this->writeOneof(2, $var);

        return $this;
    }

    /**
     *google.protobuf.NullValue null = 4;
     *
     * Generated from protobuf field <code>string text = 3;</code>
     * @return string
     */
    public function getText()
    {
        return $this->readOneof(3);
    }

    public function hasText()
    {
        return $this->hasOneof(3);
    }

    /**
     *google.protobuf.NullValue null = 4;
     *
     * Generated from protobuf field <code>string text = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setText($var)
    {
        GPBUtil::checkString($var, True);
        $this->writeOneof(3, $var);

        return $this;
    }

    /**
     * @return string
     */
    public function getValue()
    {
        return $this->whichOneof("value");
    }

}

