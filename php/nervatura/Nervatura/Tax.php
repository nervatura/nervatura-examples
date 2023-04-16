<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 *RequestUpdate Key->ID keys:
 *- ```id```: Tax *taxcode*
 *
 * Generated from protobuf message <code>nervatura.Tax</code>
 */
class Tax extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Unique ID.
     *
     * Generated from protobuf field <code>string taxcode = 2;</code>
     */
    protected $taxcode = '';
    /**
     * Generated from protobuf field <code>string description = 3;</code>
     */
    protected $description = '';
    /**
     * Rate or interest value
     *
     * Generated from protobuf field <code>double rate = 4;</code>
     */
    protected $rate = 0.0;
    /**
     * Generated from protobuf field <code>bool inactive = 5;</code>
     */
    protected $inactive = false;
    /**
     * Tax meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 10;</code>
     */
    private $metadata;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type int|string $id
     *     @type string $taxcode
     *           Unique ID.
     *     @type string $description
     *     @type float $rate
     *           Rate or interest value
     *     @type bool $inactive
     *     @type \Nervatura\MetaData[]|\Google\Protobuf\Internal\RepeatedField $metadata
     *           Tax meta data
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     * @return int|string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     * @param int|string $var
     * @return $this
     */
    public function setId($var)
    {
        GPBUtil::checkInt64($var);
        $this->id = $var;

        return $this;
    }

    /**
     * Unique ID.
     *
     * Generated from protobuf field <code>string taxcode = 2;</code>
     * @return string
     */
    public function getTaxcode()
    {
        return $this->taxcode;
    }

    /**
     * Unique ID.
     *
     * Generated from protobuf field <code>string taxcode = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setTaxcode($var)
    {
        GPBUtil::checkString($var, True);
        $this->taxcode = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string description = 3;</code>
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Generated from protobuf field <code>string description = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setDescription($var)
    {
        GPBUtil::checkString($var, True);
        $this->description = $var;

        return $this;
    }

    /**
     * Rate or interest value
     *
     * Generated from protobuf field <code>double rate = 4;</code>
     * @return float
     */
    public function getRate()
    {
        return $this->rate;
    }

    /**
     * Rate or interest value
     *
     * Generated from protobuf field <code>double rate = 4;</code>
     * @param float $var
     * @return $this
     */
    public function setRate($var)
    {
        GPBUtil::checkDouble($var);
        $this->rate = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>bool inactive = 5;</code>
     * @return bool
     */
    public function getInactive()
    {
        return $this->inactive;
    }

    /**
     * Generated from protobuf field <code>bool inactive = 5;</code>
     * @param bool $var
     * @return $this
     */
    public function setInactive($var)
    {
        GPBUtil::checkBool($var);
        $this->inactive = $var;

        return $this;
    }

    /**
     * Tax meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 10;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getMetadata()
    {
        return $this->metadata;
    }

    /**
     * Tax meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 10;</code>
     * @param \Nervatura\MetaData[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setMetadata($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Nervatura\MetaData::class);
        $this->metadata = $arr;

        return $this;
    }

}

