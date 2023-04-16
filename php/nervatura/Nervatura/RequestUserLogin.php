<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Generated from protobuf message <code>nervatura.RequestUserLogin</code>
 */
class RequestUserLogin extends \Google\Protobuf\Internal\Message
{
    /**
     * Employee username or Customer custnumber (email or phone number)
     *
     * Generated from protobuf field <code>string username = 1;</code>
     */
    protected $username = '';
    /**
     * Generated from protobuf field <code>string password = 2;</code>
     */
    protected $password = '';
    /**
     * Optional. Default value: NT_DEFAULT_ALIAS
     *
     * Generated from protobuf field <code>string database = 3;</code>
     */
    protected $database = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type string $username
     *           Employee username or Customer custnumber (email or phone number)
     *     @type string $password
     *     @type string $database
     *           Optional. Default value: NT_DEFAULT_ALIAS
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * Employee username or Customer custnumber (email or phone number)
     *
     * Generated from protobuf field <code>string username = 1;</code>
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Employee username or Customer custnumber (email or phone number)
     *
     * Generated from protobuf field <code>string username = 1;</code>
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
     * Generated from protobuf field <code>string password = 2;</code>
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Generated from protobuf field <code>string password = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setPassword($var)
    {
        GPBUtil::checkString($var, True);
        $this->password = $var;

        return $this;
    }

    /**
     * Optional. Default value: NT_DEFAULT_ALIAS
     *
     * Generated from protobuf field <code>string database = 3;</code>
     * @return string
     */
    public function getDatabase()
    {
        return $this->database;
    }

    /**
     * Optional. Default value: NT_DEFAULT_ALIAS
     *
     * Generated from protobuf field <code>string database = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setDatabase($var)
    {
        GPBUtil::checkString($var, True);
        $this->database = $var;

        return $this;
    }

}

