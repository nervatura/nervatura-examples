<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 *RequestUpdate Key->ID keys:
 *- ```id```: Trans and Item *transnumber~rownumber*
 *- ```trans_id```: Trans *transnumber*
 *- ```product_id```: Product *partnumber*
 *- ```tax_id```: Tax *taxcode*
 *
 * Generated from protobuf message <code>nervatura.Item</code>
 */
class Item extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Reference to [trans](#trans).id
     *
     * Generated from protobuf field <code>int64 trans_id = 2;</code>
     */
    protected $trans_id = 0;
    /**
     * Reference to [product](#product).id
     *
     * Generated from protobuf field <code>int64 product_id = 3;</code>
     */
    protected $product_id = 0;
    /**
     * Generated from protobuf field <code>string unit = 4;</code>
     */
    protected $unit = '';
    /**
     * Generated from protobuf field <code>double qty = 5;</code>
     */
    protected $qty = 0.0;
    /**
     * Generated from protobuf field <code>double fxprice = 6;</code>
     */
    protected $fxprice = 0.0;
    /**
     * Generated from protobuf field <code>double netamount = 7;</code>
     */
    protected $netamount = 0.0;
    /**
     * Generated from protobuf field <code>double discount = 8;</code>
     */
    protected $discount = 0.0;
    /**
     * Reference to [Tax](#tax).id
     *
     * Generated from protobuf field <code>int64 tax_id = 9;</code>
     */
    protected $tax_id = 0;
    /**
     * Generated from protobuf field <code>double vatamount = 10;</code>
     */
    protected $vatamount = 0.0;
    /**
     * Generated from protobuf field <code>double amount = 11;</code>
     */
    protected $amount = 0.0;
    /**
     * Generated from protobuf field <code>string description = 12;</code>
     */
    protected $description = '';
    /**
     * Generated from protobuf field <code>bool deposit = 13;</code>
     */
    protected $deposit = false;
    /**
     * Generated from protobuf field <code>double ownstock = 14;</code>
     */
    protected $ownstock = 0.0;
    /**
     * Generated from protobuf field <code>bool actionprice = 15;</code>
     */
    protected $actionprice = false;
    /**
     * Item meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 16;</code>
     */
    private $metadata;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type int|string $id
     *     @type int|string $trans_id
     *           Reference to [trans](#trans).id
     *     @type int|string $product_id
     *           Reference to [product](#product).id
     *     @type string $unit
     *     @type float $qty
     *     @type float $fxprice
     *     @type float $netamount
     *     @type float $discount
     *     @type int|string $tax_id
     *           Reference to [Tax](#tax).id
     *     @type float $vatamount
     *     @type float $amount
     *     @type string $description
     *     @type bool $deposit
     *     @type float $ownstock
     *     @type bool $actionprice
     *     @type \Nervatura\MetaData[]|\Google\Protobuf\Internal\RepeatedField $metadata
     *           Item meta data
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
     * Reference to [trans](#trans).id
     *
     * Generated from protobuf field <code>int64 trans_id = 2;</code>
     * @return int|string
     */
    public function getTransId()
    {
        return $this->trans_id;
    }

    /**
     * Reference to [trans](#trans).id
     *
     * Generated from protobuf field <code>int64 trans_id = 2;</code>
     * @param int|string $var
     * @return $this
     */
    public function setTransId($var)
    {
        GPBUtil::checkInt64($var);
        $this->trans_id = $var;

        return $this;
    }

    /**
     * Reference to [product](#product).id
     *
     * Generated from protobuf field <code>int64 product_id = 3;</code>
     * @return int|string
     */
    public function getProductId()
    {
        return $this->product_id;
    }

    /**
     * Reference to [product](#product).id
     *
     * Generated from protobuf field <code>int64 product_id = 3;</code>
     * @param int|string $var
     * @return $this
     */
    public function setProductId($var)
    {
        GPBUtil::checkInt64($var);
        $this->product_id = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string unit = 4;</code>
     * @return string
     */
    public function getUnit()
    {
        return $this->unit;
    }

    /**
     * Generated from protobuf field <code>string unit = 4;</code>
     * @param string $var
     * @return $this
     */
    public function setUnit($var)
    {
        GPBUtil::checkString($var, True);
        $this->unit = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double qty = 5;</code>
     * @return float
     */
    public function getQty()
    {
        return $this->qty;
    }

    /**
     * Generated from protobuf field <code>double qty = 5;</code>
     * @param float $var
     * @return $this
     */
    public function setQty($var)
    {
        GPBUtil::checkDouble($var);
        $this->qty = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double fxprice = 6;</code>
     * @return float
     */
    public function getFxprice()
    {
        return $this->fxprice;
    }

    /**
     * Generated from protobuf field <code>double fxprice = 6;</code>
     * @param float $var
     * @return $this
     */
    public function setFxprice($var)
    {
        GPBUtil::checkDouble($var);
        $this->fxprice = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double netamount = 7;</code>
     * @return float
     */
    public function getNetamount()
    {
        return $this->netamount;
    }

    /**
     * Generated from protobuf field <code>double netamount = 7;</code>
     * @param float $var
     * @return $this
     */
    public function setNetamount($var)
    {
        GPBUtil::checkDouble($var);
        $this->netamount = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double discount = 8;</code>
     * @return float
     */
    public function getDiscount()
    {
        return $this->discount;
    }

    /**
     * Generated from protobuf field <code>double discount = 8;</code>
     * @param float $var
     * @return $this
     */
    public function setDiscount($var)
    {
        GPBUtil::checkDouble($var);
        $this->discount = $var;

        return $this;
    }

    /**
     * Reference to [Tax](#tax).id
     *
     * Generated from protobuf field <code>int64 tax_id = 9;</code>
     * @return int|string
     */
    public function getTaxId()
    {
        return $this->tax_id;
    }

    /**
     * Reference to [Tax](#tax).id
     *
     * Generated from protobuf field <code>int64 tax_id = 9;</code>
     * @param int|string $var
     * @return $this
     */
    public function setTaxId($var)
    {
        GPBUtil::checkInt64($var);
        $this->tax_id = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double vatamount = 10;</code>
     * @return float
     */
    public function getVatamount()
    {
        return $this->vatamount;
    }

    /**
     * Generated from protobuf field <code>double vatamount = 10;</code>
     * @param float $var
     * @return $this
     */
    public function setVatamount($var)
    {
        GPBUtil::checkDouble($var);
        $this->vatamount = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double amount = 11;</code>
     * @return float
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     * Generated from protobuf field <code>double amount = 11;</code>
     * @param float $var
     * @return $this
     */
    public function setAmount($var)
    {
        GPBUtil::checkDouble($var);
        $this->amount = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string description = 12;</code>
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Generated from protobuf field <code>string description = 12;</code>
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
     * Generated from protobuf field <code>bool deposit = 13;</code>
     * @return bool
     */
    public function getDeposit()
    {
        return $this->deposit;
    }

    /**
     * Generated from protobuf field <code>bool deposit = 13;</code>
     * @param bool $var
     * @return $this
     */
    public function setDeposit($var)
    {
        GPBUtil::checkBool($var);
        $this->deposit = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>double ownstock = 14;</code>
     * @return float
     */
    public function getOwnstock()
    {
        return $this->ownstock;
    }

    /**
     * Generated from protobuf field <code>double ownstock = 14;</code>
     * @param float $var
     * @return $this
     */
    public function setOwnstock($var)
    {
        GPBUtil::checkDouble($var);
        $this->ownstock = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>bool actionprice = 15;</code>
     * @return bool
     */
    public function getActionprice()
    {
        return $this->actionprice;
    }

    /**
     * Generated from protobuf field <code>bool actionprice = 15;</code>
     * @param bool $var
     * @return $this
     */
    public function setActionprice($var)
    {
        GPBUtil::checkBool($var);
        $this->actionprice = $var;

        return $this;
    }

    /**
     * Item meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 16;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getMetadata()
    {
        return $this->metadata;
    }

    /**
     * Item meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 16;</code>
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

