<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

namespace Nervatura;

use UnexpectedValueException;

/**
 * Protobuf type <code>nervatura.ReportOutput</code>
 */
class ReportOutput
{
    /**
     * Generated from protobuf enum <code>auto = 0;</code>
     */
    const auto = 0;
    /**
     * Generated from protobuf enum <code>xml = 1;</code>
     */
    const xml = 1;
    /**
     * Generated from protobuf enum <code>data = 2;</code>
     */
    const data = 2;
    /**
     * Generated from protobuf enum <code>base64 = 3;</code>
     */
    const base64 = 3;

    private static $valueToName = [
        self::auto => 'auto',
        self::xml => 'xml',
        self::data => 'data',
        self::base64 => 'base64',
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
