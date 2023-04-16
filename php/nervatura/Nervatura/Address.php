<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 *RequestUpdate Key->ID keys:
 *- ```id```: Value is a generated unique key identifier: *{nervatype}/{refnumber}~{rownumber}*. The *rownumber* is the order of multiple *{nervatype}/{refnumber}* keys. For example: ```customer/DMCUST/00001~1```
 *- ```nervatype```: Valid values: *customer, employee, event, place, product, project, tool, trans*
 *- ```ref_id```: Valid values: *customer/{custnumber}, employee/{empnumber}, event/{calnumber}, place/{planumber}, product/{partnumber}, 
 *project/{pronumber}, tool/{serial}, trans/{transnumber}*
 *
 * Generated from protobuf message <code>nervatura.Address</code>
 */
class Address extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 2;</code>
     */
    protected $nervatype = 0;
    /**
     * Reference to [Customer](#customer).id, [Employee](#employee).id, [Event](#event).id, [Place](#place).id, [Product](#product).id, [Project](#project).id, [Tool](#tool).id, [Trans](#trans).id
     *
     * Generated from protobuf field <code>int64 ref_id = 3;</code>
     */
    protected $ref_id = 0;
    /**
     * Generated from protobuf field <code>string country = 4;</code>
     */
    protected $country = '';
    /**
     * Generated from protobuf field <code>string state = 5;</code>
     */
    protected $state = '';
    /**
     * Generated from protobuf field <code>string zipcode = 6;</code>
     */
    protected $zipcode = '';
    /**
     * Generated from protobuf field <code>string city = 7;</code>
     */
    protected $city = '';
    /**
     * Generated from protobuf field <code>string street = 8;</code>
     */
    protected $street = '';
    /**
     * Generated from protobuf field <code>string notes = 9;</code>
     */
    protected $notes = '';
    /**
     * Address meta data
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
     *     @type int|string $nervatype
     *           Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *     @type int|string $ref_id
     *           Reference to [Customer](#customer).id, [Employee](#employee).id, [Event](#event).id, [Place](#place).id, [Product](#product).id, [Project](#project).id, [Tool](#tool).id, [Trans](#trans).id
     *     @type string $country
     *     @type string $state
     *     @type string $zipcode
     *     @type string $city
     *     @type string $street
     *     @type string $notes
     *     @type \Nervatura\MetaData[]|\Google\Protobuf\Internal\RepeatedField $metadata
     *           Address meta data
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
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 2;</code>
     * @return int|string
     */
    public function getNervatype()
    {
        return $this->nervatype;
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 2;</code>
     * @param int|string $var
     * @return $this
     */
    public function setNervatype($var)
    {
        GPBUtil::checkInt64($var);
        $this->nervatype = $var;

        return $this;
    }

    /**
     * Reference to [Customer](#customer).id, [Employee](#employee).id, [Event](#event).id, [Place](#place).id, [Product](#product).id, [Project](#project).id, [Tool](#tool).id, [Trans](#trans).id
     *
     * Generated from protobuf field <code>int64 ref_id = 3;</code>
     * @return int|string
     */
    public function getRefId()
    {
        return $this->ref_id;
    }

    /**
     * Reference to [Customer](#customer).id, [Employee](#employee).id, [Event](#event).id, [Place](#place).id, [Product](#product).id, [Project](#project).id, [Tool](#tool).id, [Trans](#trans).id
     *
     * Generated from protobuf field <code>int64 ref_id = 3;</code>
     * @param int|string $var
     * @return $this
     */
    public function setRefId($var)
    {
        GPBUtil::checkInt64($var);
        $this->ref_id = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string country = 4;</code>
     * @return string
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Generated from protobuf field <code>string country = 4;</code>
     * @param string $var
     * @return $this
     */
    public function setCountry($var)
    {
        GPBUtil::checkString($var, True);
        $this->country = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string state = 5;</code>
     * @return string
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Generated from protobuf field <code>string state = 5;</code>
     * @param string $var
     * @return $this
     */
    public function setState($var)
    {
        GPBUtil::checkString($var, True);
        $this->state = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string zipcode = 6;</code>
     * @return string
     */
    public function getZipcode()
    {
        return $this->zipcode;
    }

    /**
     * Generated from protobuf field <code>string zipcode = 6;</code>
     * @param string $var
     * @return $this
     */
    public function setZipcode($var)
    {
        GPBUtil::checkString($var, True);
        $this->zipcode = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string city = 7;</code>
     * @return string
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Generated from protobuf field <code>string city = 7;</code>
     * @param string $var
     * @return $this
     */
    public function setCity($var)
    {
        GPBUtil::checkString($var, True);
        $this->city = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string street = 8;</code>
     * @return string
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * Generated from protobuf field <code>string street = 8;</code>
     * @param string $var
     * @return $this
     */
    public function setStreet($var)
    {
        GPBUtil::checkString($var, True);
        $this->street = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string notes = 9;</code>
     * @return string
     */
    public function getNotes()
    {
        return $this->notes;
    }

    /**
     * Generated from protobuf field <code>string notes = 9;</code>
     * @param string $var
     * @return $this
     */
    public function setNotes($var)
    {
        GPBUtil::checkString($var, True);
        $this->notes = $var;

        return $this;
    }

    /**
     * Address meta data
     *
     * Generated from protobuf field <code>repeated .nervatura.MetaData metadata = 10;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getMetadata()
    {
        return $this->metadata;
    }

    /**
     * Address meta data
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

