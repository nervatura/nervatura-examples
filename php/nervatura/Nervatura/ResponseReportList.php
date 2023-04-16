<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Returns all installable files from the NT_REPORT_DIR directory (empty value: all available built-in Nervatura Reports)
 *
 * Generated from protobuf message <code>nervatura.ResponseReportList</code>
 */
class ResponseReportList extends \Google\Protobuf\Internal\Message
{
    /**
     * Generated from protobuf field <code>repeated .nervatura.ResponseReportList.Info items = 1;</code>
     */
    private $items;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type \Nervatura\ResponseReportList\Info[]|\Google\Protobuf\Internal\RepeatedField $items
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Api::initOnce();
        parent::__construct($data);
    }

    /**
     * Generated from protobuf field <code>repeated .nervatura.ResponseReportList.Info items = 1;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getItems()
    {
        return $this->items;
    }

    /**
     * Generated from protobuf field <code>repeated .nervatura.ResponseReportList.Info items = 1;</code>
     * @param \Nervatura\ResponseReportList\Info[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setItems($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Nervatura\ResponseReportList\Info::class);
        $this->items = $arr;

        return $this;
    }

}

