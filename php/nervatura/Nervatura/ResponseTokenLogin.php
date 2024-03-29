<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Token user properties
 *
 * Generated from protobuf message <code>nervatura.ResponseTokenLogin</code>
 */
class ResponseTokenLogin extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Generated from protobuf field <code>string username = 2;</code>
     */
    protected $username = '';
    /**
     * Generated from protobuf field <code>string empnumber = 3;</code>
     */
    protected $empnumber = '';
    /**
     * Generated from protobuf field <code>int64 usergroup = 4;</code>
     */
    protected $usergroup = 0;
    /**
     * Generated from protobuf field <code>string scope = 5;</code>
     */
    protected $scope = '';
    /**
     * Generated from protobuf field <code>string department = 6;</code>
     */
    protected $department = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type int|string $id
     *     @type string $username
     *     @type string $empnumber
     *     @type int|string $usergroup
     *     @type string $scope
     *     @type string $department
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
     * Generated from protobuf field <code>string username = 2;</code>
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Generated from protobuf field <code>string username = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setUsername($var)
    {
        GPBUtil::checkString($var, True);
        $this->username = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string empnumber = 3;</code>
     * @return string
     */
    public function getEmpnumber()
    {
        return $this->empnumber;
    }

    /**
     * Generated from protobuf field <code>string empnumber = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setEmpnumber($var)
    {
        GPBUtil::checkString($var, True);
        $this->empnumber = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>int64 usergroup = 4;</code>
     * @return int|string
     */
    public function getUsergroup()
    {
        return $this->usergroup;
    }

    /**
     * Generated from protobuf field <code>int64 usergroup = 4;</code>
     * @param int|string $var
     * @return $this
     */
    public function setUsergroup($var)
    {
        GPBUtil::checkInt64($var);
        $this->usergroup = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string scope = 5;</code>
     * @return string
     */
    public function getScope()
    {
        return $this->scope;
    }

    /**
     * Generated from protobuf field <code>string scope = 5;</code>
     * @param string $var
     * @return $this
     */
    public function setScope($var)
    {
        GPBUtil::checkString($var, True);
        $this->scope = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>string department = 6;</code>
     * @return string
     */
    public function getDepartment()
    {
        return $this->department;
    }

    /**
     * Generated from protobuf field <code>string department = 6;</code>
     * @param string $var
     * @return $this
     */
    public function setDepartment($var)
    {
        GPBUtil::checkString($var, True);
        $this->department = $var;

        return $this;
    }

}

