<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Generated from protobuf message <code>nervatura.UiPrintqueue</code>
 */
class UiPrintqueue extends \Google\Protobuf\Internal\Message
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
    protected $nervatype = null;
    /**
     * Reference to {nervatype}.id
     *
     * Generated from protobuf field <code>int64 ref_id = 3;</code>
     */
    protected $ref_id = 0;
    /**
     * Generated from protobuf field <code>double qty = 4;</code>
     */
    protected $qty = 0.0;
    /**
     * Reference to [Employee](#employee).id
     *
     * Generated from protobuf field <code>int64 employee_id = 5;</code>
     */
    protected $employee_id = null;
    /**
     * Reference to [UiReport](#UiReport).id
     *
     * Generated from protobuf field <code>int64 report_id = 6;</code>
     */
    protected $report_id = 0;
    /**
     * Date-time
     *
     * Generated from protobuf field <code>string crdate = 7;</code>
     */
    protected $crdate = '';

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
     *           Reference to {nervatype}.id
     *     @type float $qty
     *     @type int|string $employee_id
     *           Reference to [Employee](#employee).id
     *     @type int|string $report_id
     *           Reference to [UiReport](#UiReport).id
     *     @type string $crdate
     *           Date-time
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
        return isset($this->nervatype) ? $this->nervatype : 0;
    }

    public function hasNervatype()
    {
        return isset($this->nervatype);
    }

    public function clearNervatype()
    {
        unset($this->nervatype);
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
     * Reference to {nervatype}.id
     *
     * Generated from protobuf field <code>int64 ref_id = 3;</code>
     * @return int|string
     */
    public function getRefId()
    {
        return $this->ref_id;
    }

    /**
     * Reference to {nervatype}.id
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
     * Generated from protobuf field <code>double qty = 4;</code>
     * @return float
     */
    public function getQty()
    {
        return $this->qty;
    }

    /**
     * Generated from protobuf field <code>double qty = 4;</code>
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
     * Reference to [Employee](#employee).id
     *
     * Generated from protobuf field <code>int64 employee_id = 5;</code>
     * @return int|string
     */
    public function getEmployeeId()
    {
        return isset($this->employee_id) ? $this->employee_id : 0;
    }

    public function hasEmployeeId()
    {
        return isset($this->employee_id);
    }

    public function clearEmployeeId()
    {
        unset($this->employee_id);
    }

    /**
     * Reference to [Employee](#employee).id
     *
     * Generated from protobuf field <code>int64 employee_id = 5;</code>
     * @param int|string $var
     * @return $this
     */
    public function setEmployeeId($var)
    {
        GPBUtil::checkInt64($var);
        $this->employee_id = $var;

        return $this;
    }

    /**
     * Reference to [UiReport](#UiReport).id
     *
     * Generated from protobuf field <code>int64 report_id = 6;</code>
     * @return int|string
     */
    public function getReportId()
    {
        return $this->report_id;
    }

    /**
     * Reference to [UiReport](#UiReport).id
     *
     * Generated from protobuf field <code>int64 report_id = 6;</code>
     * @param int|string $var
     * @return $this
     */
    public function setReportId($var)
    {
        GPBUtil::checkInt64($var);
        $this->report_id = $var;

        return $this;
    }

    /**
     * Date-time
     *
     * Generated from protobuf field <code>string crdate = 7;</code>
     * @return string
     */
    public function getCrdate()
    {
        return $this->crdate;
    }

    /**
     * Date-time
     *
     * Generated from protobuf field <code>string crdate = 7;</code>
     * @param string $var
     * @return $this
     */
    public function setCrdate($var)
    {
        GPBUtil::checkString($var, True);
        $this->crdate = $var;

        return $this;
    }

}

