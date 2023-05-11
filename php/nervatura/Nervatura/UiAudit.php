<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 *RequestUpdate Key->ID keys:
 *- ```id```: UiAudit *{usergroup}~{nervatype}~{transtype}*
 *- ```usergroup```: all groupvalue from Groups, where groupname equal usergroup
 *- ```nervatype```: all groupvalue from Groups, where groupname equal nervatype
 *- ```subtype```: all groupvalue from Groups, where groupname equal transtype, movetype, protype, custtype, placetype
 *- ```inputfilter```: Valid values *disabled, readonly, update, all*
 *
 * Generated from protobuf message <code>nervatura.UiAudit</code>
 */
class UiAudit extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>int64 id = 1;</code>
     */
    protected $id = 0;
    /**
     * Reference to [Groups](#groups).id (only where groupname = 'usergroup')
     *
     * Generated from protobuf field <code>int64 usergroup = 2;</code>
     */
    protected $usergroup = 0;
    /**
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 3;</code>
     */
    protected $nervatype = 0;
    /**
     * Reference to [Groups](#groups).id (only where groupname = 'movetype')
     *
     * Generated from protobuf field <code>int64 subtype = 4;</code>
     */
    protected $subtype = null;
    /**
     * Reference to [Groups](#groups).id (only where groupname = 'inputfilter')
     *
     * Generated from protobuf field <code>int64 inputfilter = 5;</code>
     */
    protected $inputfilter = 0;
    /**
     * Generated from protobuf field <code>bool supervisor = 6;</code>
     */
    protected $supervisor = false;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type int|string $id
     *     @type int|string $usergroup
     *           Reference to [Groups](#groups).id (only where groupname = 'usergroup')
     *     @type int|string $nervatype
     *           Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *     @type int|string $subtype
     *           Reference to [Groups](#groups).id (only where groupname = 'movetype')
     *     @type int|string $inputfilter
     *           Reference to [Groups](#groups).id (only where groupname = 'inputfilter')
     *     @type bool $supervisor
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
     * Reference to [Groups](#groups).id (only where groupname = 'usergroup')
     *
     * Generated from protobuf field <code>int64 usergroup = 2;</code>
     * @return int|string
     */
    public function getUsergroup()
    {
        return $this->usergroup;
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'usergroup')
     *
     * Generated from protobuf field <code>int64 usergroup = 2;</code>
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
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 3;</code>
     * @return int|string
     */
    public function getNervatype()
    {
        return $this->nervatype;
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'nervatype')
     *
     * Generated from protobuf field <code>int64 nervatype = 3;</code>
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
     * Reference to [Groups](#groups).id (only where groupname = 'movetype')
     *
     * Generated from protobuf field <code>int64 subtype = 4;</code>
     * @return int|string
     */
    public function getSubtype()
    {
        return isset($this->subtype) ? $this->subtype : 0;
    }

    public function hasSubtype()
    {
        return isset($this->subtype);
    }

    public function clearSubtype()
    {
        unset($this->subtype);
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'movetype')
     *
     * Generated from protobuf field <code>int64 subtype = 4;</code>
     * @param int|string $var
     * @return $this
     */
    public function setSubtype($var)
    {
        GPBUtil::checkInt64($var);
        $this->subtype = $var;

        return $this;
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'inputfilter')
     *
     * Generated from protobuf field <code>int64 inputfilter = 5;</code>
     * @return int|string
     */
    public function getInputfilter()
    {
        return $this->inputfilter;
    }

    /**
     * Reference to [Groups](#groups).id (only where groupname = 'inputfilter')
     *
     * Generated from protobuf field <code>int64 inputfilter = 5;</code>
     * @param int|string $var
     * @return $this
     */
    public function setInputfilter($var)
    {
        GPBUtil::checkInt64($var);
        $this->inputfilter = $var;

        return $this;
    }

    /**
     * Generated from protobuf field <code>bool supervisor = 6;</code>
     * @return bool
     */
    public function getSupervisor()
    {
        return $this->supervisor;
    }

    /**
     * Generated from protobuf field <code>bool supervisor = 6;</code>
     * @param bool $var
     * @return $this
     */
    public function setSupervisor($var)
    {
        GPBUtil::checkBool($var);
        $this->supervisor = $var;

        return $this;
    }

}
