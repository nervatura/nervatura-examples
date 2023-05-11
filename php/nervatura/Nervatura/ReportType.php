<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use UnexpectedValueException;

/**
 * Protobuf type <code>nervatura.ReportType</code>
 */
class ReportType
{
    /**
     * Generated from protobuf enum <code>report_none = 0;</code>
     */
    const report_none = 0;
    /**
     * Generated from protobuf enum <code>report_customer = 1;</code>
     */
    const report_customer = 1;
    /**
     * Generated from protobuf enum <code>report_employee = 2;</code>
     */
    const report_employee = 2;
    /**
     * Generated from protobuf enum <code>report_event = 3;</code>
     */
    const report_event = 3;
    /**
     * Generated from protobuf enum <code>report_place = 4;</code>
     */
    const report_place = 4;
    /**
     * Generated from protobuf enum <code>report_product = 5;</code>
     */
    const report_product = 5;
    /**
     * Generated from protobuf enum <code>report_project = 6;</code>
     */
    const report_project = 6;
    /**
     * Generated from protobuf enum <code>report_tool = 7;</code>
     */
    const report_tool = 7;
    /**
     * Generated from protobuf enum <code>report_trans = 8;</code>
     */
    const report_trans = 8;

    private static $valueToName = [
        self::report_none => 'report_none',
        self::report_customer => 'report_customer',
        self::report_employee => 'report_employee',
        self::report_event => 'report_event',
        self::report_place => 'report_place',
        self::report_product => 'report_product',
        self::report_project => 'report_project',
        self::report_tool => 'report_tool',
        self::report_trans => 'report_trans',
    ];

    public static function name($value)
    {
        if (!isset(self::$valueToName[$value])) {
            throw new UnexpectedValueException(sprintf(
                    'Enum %s has no name defined for value %s', __CLASS__, $value));
        }
        return self::$valueToName[$value];
    }


    public static function value($name)
    {
        $const = __CLASS__ . '::' . strtolower($name);
        if (!defined($const)) {
            throw new UnexpectedValueException(sprintf(
                    'Enum %s has no value defined for name %s', __CLASS__, $name));
        }
        return constant($const);
    }
}
