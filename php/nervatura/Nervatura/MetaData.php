<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Generated from protobuf message <code>nervatura.MetaData</code>
 */
class MetaData extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Reference to [Deffield](#deffield).fieldname.
     *
     * Generated from protobuf field <code>string fieldname = 2;</code>
     */
    protected $fieldname = '';
    /**
     * Reference to [Deffield](#deffield).fieldtype.
     *
     * Generated from protobuf field <code>string fieldtype = 3;</code>
     */
    protected $fieldtype = '';
    /**
     * Generated from protobuf field <code>string value = 4;</code>
     */
    protected $value = '';
    /**
     * Generated from protobuf field <code>string notes = 5;</code>
     */
    protected $notes = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type int|string $id
     *     @type string $fieldname
     *           Reference to [Deffield](#deffield).fieldname.
     *     @type string $fieldtype
     *           Reference to [Deffield](#deffield).fieldtype.
     *     @type string $value
     *     @type string $notes
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
     * Reference to [Deffield](#deffield).fieldname.
     *
     * Generated from protobuf field <code>string fieldname = 2;</code>
     * @return string
     */
    public function getFieldname()
    {
        return $this->fieldname;
    }

    /**
     * Reference to [Deffield](#deffield).fieldname.
     *
     * Generated from protobuf field <code>string fieldname = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setFieldname($var)
    {
        GPBUtil::checkString($var, True);
        $this->fieldname = $var;

        return $this;
    }

    /**
     * Reference to [Deffield](#deffield).fieldtype.
     *
     * Generated from protobuf field <code>string fieldtype = 3;</code>
     * @return string
     */
    public function getFieldtype()
    {
        return $this->fieldtype;
    }

    /**
     * Reference to [Deffield](#deffield).fieldtype.
     *
     * Generated from protobuf field <code>string fieldtype = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setFieldtype($var)
    {
        GPBUtil::checkString($var, True);
        $this->fieldtype = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string value = 4;</code>
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Generated from protobuf field <code>string value = 4;</code>
     * @param string $var
     * @return $this
     */
    public function setValue($var)
    {
        GPBUtil::checkString($var, True);
        $this->value = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string notes = 5;</code>
     * @return string
     */
    public function getNotes()
    {
        return $this->notes;
    }

    /**
     * Generated from protobuf field <code>string notes = 5;</code>
     * @param string $var
     * @return $this
     */
    public function setNotes($var)
    {
        GPBUtil::checkString($var, True);
        $this->notes = $var;

        return $this;
    }

}

