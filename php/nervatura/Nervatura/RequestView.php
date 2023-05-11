<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Only "select" queries and functions can be executed. Changes to the data are not saved in the database.
 *
 * Generated from protobuf message <code>nervatura.RequestView</code>
 */
class RequestView extends \Google\Protobuf\Internal\Message
{
    /**
     * The array of Query object
     *
     * Generated from protobuf field <code>repeated .nervatura.RequestView.Query options = 1;</code>
     */
    private $options;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type \Nervatura\RequestView\Query[]|\Google\Protobuf\Internal\RepeatedField $options
     *           The array of Query object
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * The array of Query object
     *
     * Generated from protobuf field <code>repeated .nervatura.RequestView.Query options = 1;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getOptions()
    {
        return $this->options;
    }

    /**
     * The array of Query object
     *
     * Generated from protobuf field <code>repeated .nervatura.RequestView.Query options = 1;</code>
     * @param \Nervatura\RequestView\Query[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setOptions($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Nervatura\RequestView\Query::class);
        $this->options = $arr;

        return $this;
    }

}
