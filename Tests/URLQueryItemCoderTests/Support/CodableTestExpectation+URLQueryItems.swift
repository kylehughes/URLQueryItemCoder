//
//  CodableTestExpectation+URLQueryItems.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/12/23.
//

import Foundation

extension CodableTestExpectation where Value == [URLQueryItem] {
    // MARK: Public Static Interface
    
    public static var urlQueryItems: Self {
        CodableTestExpectation {
            $0.sorted { $0.name < $1.name }
        } singleValueBool: { _, _ in
            [
                URLQueryItem(name: "", value: "true")
            ]
        } singleValueInt: { _, _ in
            [
                URLQueryItem(name: "", value: "10")
            ]
        } singleValueInt8: { _, _ in
            [
                URLQueryItem(name: "", value: "20")
            ]
        } singleValueInt16: { _, _ in
            [
                URLQueryItem(name: "", value: "30")
            ]
        } singleValueInt32: { _, _ in
            [
                URLQueryItem(name: "", value: "40")
            ]
        } singleValueInt64: { _, _ in
            [
                URLQueryItem(name: "", value: "50")
            ]
        } singleValueNil: { _, _ in
            []
        } singleValueString: { _, _ in
            [
                URLQueryItem(name: "", value: "DEFAULT CONSTANT")
            ]
        } singleValueUInt: { _, _ in
            [
                URLQueryItem(name: "", value: "60")
            ]
        } singleValueUInt8: { _, _ in
            [
                URLQueryItem(name: "", value: "70")
            ]
        } singleValueUInt16: { _, _ in
            [
                URLQueryItem(name: "", value: "80")
            ]
        } singleValueUInt32: { _, _ in
            [
                URLQueryItem(name: "", value: "90")
            ]
        } singleValueUInt64: { _, _ in
            [
                URLQueryItem(name: "", value: "100")
            ]
        } singleValueDataBase64: { _, _ in
            [
                URLQueryItem(name: "", value: "3q2+7w=="),
            ]
        } singleValueDataCustom: { _, _ in
            [
                URLQueryItem(name: "", value: "42"),
            ]
        } singleValueDataDeferredToData: { _, _ in
            [
                URLQueryItem(name: "0", value: "222"),
                URLQueryItem(name: "1", value: "173"),
                URLQueryItem(name: "2", value: "190"),
                URLQueryItem(name: "3", value: "239"),
            ]
        } singleValueDateCustom: { _, _ in
            [
                URLQueryItem(name: "", value: "42")
            ]
        } singleValueDateDeferredToDate: { _, _ in
            [
                URLQueryItem(name: "", value: "-978306200")
            ]
        } singleValueDateFormatted: { _, _ in
            [
                URLQueryItem(name: "", value: "Thursday, January 1, 1970 at 12:16:40 AM Greenwich Mean Time")
            ]
        } singleValueDateISO8601: { _, _ in
            [
                URLQueryItem(name: "", value: "1970-01-01T00:16:40Z")
            ]
        } singleValueDateMillisecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "", value: "1000000")
            ]
        } singleValueDateSecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "", value: "1000")
            ]
        } singleValueDouble: { _, _ in
            [
                URLQueryItem(name: "", value: "100")
            ]
        } singleValueDoubleConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "", value: "notANumber")
            ]
        } singleValueDoubleConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "", value: "negativeInfinity")
            ]
        } singleValueDoubleConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "", value: "positiveInfinity")
            ]
        } singleValueFloat: { _, _ in
            [
                URLQueryItem(name: "", value: "100")
            ]
        } singleValueFloatConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "", value: "notANumber")
            ]
        } singleValueFloatConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "", value: "negativeInfinity")
            ]
        } singleValueFloatConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "", value: "positiveInfinity")
            ]
        } keyedValueDefault: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueEmpty: { _, _ in
            []
        } keyedValuePartial: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } inheritanceKeyedValueDefault: { _, _ in
            [
                URLQueryItem(name: "string", value: "SUB DEFAULT CONSTANT"),
                URLQueryItem(name: "super.bool", value: "true"),
                URLQueryItem(name: "super.data", value: "3q2+7w=="),
                URLQueryItem(name: "super.date", value: "-978306200"),
                URLQueryItem(name: "super.double", value: "1"),
                URLQueryItem(name: "super.float", value: "2"),
                URLQueryItem(name: "super.int", value: "3"),
                URLQueryItem(name: "super.int8", value: "4"),
                URLQueryItem(name: "super.int16", value: "5"),
                URLQueryItem(name: "super.int32", value: "6"),
                URLQueryItem(name: "super.int64", value: "7"),
                URLQueryItem(name: "uint", value: "8"),
                URLQueryItem(name: "uint8", value: "9"),
                URLQueryItem(name: "uint16", value: "10"),
                URLQueryItem(name: "uint32", value: "11"),
                URLQueryItem(name: "uint64", value: "12"),
            ]
        } inheritanceKeyedValueEmpty: { _, _ in
            [
                URLQueryItem(name: "super", value: ""),
            ]
        } inheritanceKeyedValuePartial: { _, _ in
            [
                URLQueryItem(name: "string", value: "SUB DEFAULT CONSTANT"),
                URLQueryItem(name: "super.bool", value: "true"),
                URLQueryItem(name: "super.date", value: "-978306200"),
                URLQueryItem(name: "super.float", value: "2"),
                URLQueryItem(name: "super.int8", value: "4"),
                URLQueryItem(name: "super.int32", value: "6"),
                URLQueryItem(name: "uint8", value: "9"),
                URLQueryItem(name: "uint32", value: "11"),
            ]
        } keyedValueDataBase64: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDataCustom: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "42"),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDataDeferredToData: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data.0", value: "222"),
                URLQueryItem(name: "data.1", value: "173"),
                URLQueryItem(name: "data.2", value: "190"),
                URLQueryItem(name: "data.3", value: "239"),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDateCustom: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "42"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDateDeferredToDate: { _, _ in
            // TODO: condense to a simpler type; ditch int64 etc maybe? not nillable?
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDateFormatted: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "Thursday, January 1, 1970 at 12:16:40 AM Greenwich Mean Time"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDateISO8601: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "1970-01-01T00:16:40Z"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDateMillisecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "1000000"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDateSecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "date", value: "1000"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "int8", value: "20"),
                URLQueryItem(name: "int16", value: "30"),
                URLQueryItem(name: "int32", value: "40"),
                URLQueryItem(name: "int64", value: "50"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "60"),
                URLQueryItem(name: "uint8", value: "70"),
                URLQueryItem(name: "uint16", value: "80"),
                URLQueryItem(name: "uint32", value: "90"),
                URLQueryItem(name: "uint64", value: "100"),
            ]
        } keyedValueDouble: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDoubleConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "notANumber"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDoubleConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "negativeInfinity"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueDoubleConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "positiveInfinity"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueFloat: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueFloatConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "notANumber"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueFloatConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "negativeInfinity"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueFloatConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "positiveInfinity"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } keyedValueKeyCustom: { _, _ in
            [
                URLQueryItem(name: "THISISABOOL", value: "true"),
                URLQueryItem(name: "THISISADATA", value: "3q2+7w=="),
                URLQueryItem(name: "THISISADATE", value: "-978307200"),
                URLQueryItem(name: "THISISADOUBLE", value: "1"),
                URLQueryItem(name: "THISISAFLOAT", value: "2"),
                URLQueryItem(name: "THISISANINT", value: "3"),
                URLQueryItem(name: "THISISANINT8", value: "4"),
                URLQueryItem(name: "THISISANINT16", value: "5"),
                URLQueryItem(name: "THISISANINT32", value: "6"),
                URLQueryItem(name: "THISISANINT64", value: "7"),
                URLQueryItem(name: "THISISASTRING", value: "String"),
                URLQueryItem(name: "THISISAUINT", value: "8"),
                URLQueryItem(name: "THISISAUINT8", value: "9"),
                URLQueryItem(name: "THISISAUINT16", value: "10"),
                URLQueryItem(name: "THISISAUINT32", value: "11"),
                URLQueryItem(name: "THISISAUINT64", value: "12"),
            ]
        } keyedValueKeySnakeCase: { _, _ in
            [
                URLQueryItem(name: "this_is_a_bool", value: "true"),
                URLQueryItem(name: "this_is_a_data", value: "3q2+7w=="),
                URLQueryItem(name: "this_is_a_date", value: "-978307200"),
                URLQueryItem(name: "this_is_a_double", value: "1"),
                URLQueryItem(name: "this_is_a_float", value: "2"),
                URLQueryItem(name: "this_is_an_int", value: "3"),
                URLQueryItem(name: "this_is_an_int8", value: "4"),
                URLQueryItem(name: "this_is_an_int16", value: "5"),
                URLQueryItem(name: "this_is_an_int32", value: "6"),
                URLQueryItem(name: "this_is_an_int64", value: "7"),
                URLQueryItem(name: "this_is_a_string", value: "String"),
                URLQueryItem(name: "this_is_a_uint", value: "8"),
                URLQueryItem(name: "this_is_a_uint8", value: "9"),
                URLQueryItem(name: "this_is_a_uint16", value: "10"),
                URLQueryItem(name: "this_is_a_uint32", value: "11"),
                URLQueryItem(name: "this_is_a_uint64", value: "12"),
            ]
        } keyedValueKeyUseDefaultKeys: { _, _ in
            [
                URLQueryItem(name: "thisIsABool", value: "true"),
                URLQueryItem(name: "thisIsAData", value: "3q2+7w=="),
                URLQueryItem(name: "thisIsADate", value: "-978307200"),
                URLQueryItem(name: "thisIsADouble", value: "1"),
                URLQueryItem(name: "thisIsAFloat", value: "2"),
                URLQueryItem(name: "thisIsAnInt", value: "3"),
                URLQueryItem(name: "thisIsAnInt8", value: "4"),
                URLQueryItem(name: "thisIsAnInt16", value: "5"),
                URLQueryItem(name: "thisIsAnInt32", value: "6"),
                URLQueryItem(name: "thisIsAnInt64", value: "7"),
                URLQueryItem(name: "thisIsAString", value: "String"),
                URLQueryItem(name: "thisIsAUint", value: "8"),
                URLQueryItem(name: "thisIsAUint8", value: "9"),
                URLQueryItem(name: "thisIsAUint16", value: "10"),
                URLQueryItem(name: "thisIsAUint32", value: "11"),
                URLQueryItem(name: "thisIsAUint64", value: "12"),
            ]
        } keyedValueSortedKeys: { _, _ in
            [
                URLQueryItem(name: "bool", value: "true"),
                URLQueryItem(name: "data", value: "3q2+7w=="),
                URLQueryItem(name: "date", value: "-978306200"),
                URLQueryItem(name: "double", value: "123.45"),
                URLQueryItem(name: "float", value: "543.21"),
                URLQueryItem(name: "int", value: "10"),
                URLQueryItem(name: "string", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "uint", value: "20"),
            ]
        } unkeyedValueBool: { _, _ in
            [
                URLQueryItem(name: "0", value: "true"),
                URLQueryItem(name: "1", value: "false"),
            ]
        } unkeyedValueInt: { _, _ in
            [
                URLQueryItem(name: "0", value: "-2147483648"),
                URLQueryItem(name: "1", value: "2147483647"),
            ]
        } unkeyedValueInt8: { _, _ in
            [
                URLQueryItem(name: "0", value: "-128"),
                URLQueryItem(name: "1", value: "127"),
            ]
        } unkeyedValueInt16: { _, _ in
            [
                URLQueryItem(name: "0", value: "-32768"),
                URLQueryItem(name: "1", value: "32767"),
            ]
        } unkeyedValueInt32: { _, _ in
            [
                URLQueryItem(name: "0", value: "-2147483648"),
                URLQueryItem(name: "1", value: "2147483647"),
            ]
        } unkeyedValueInt64: { _, _ in
            [
                URLQueryItem(name: "0", value: "-9223372036854775808"),
                URLQueryItem(name: "1", value: "9223372036854775807"),
            ]
        } unkeyedValueNil: { _, _ in
            [
                URLQueryItem(name: "0", value: nil),
                URLQueryItem(name: "1", value: nil),
            ]
        } unkeyedValueString: { _, _ in
            [
                URLQueryItem(name: "0", value: "DEFAULT CONSTANT"),
                URLQueryItem(name: "1", value: "DEFAULT CONSTANT"),
            ]
        } unkeyedValueUInt: { _, _ in
            [
                URLQueryItem(name: "0", value: "0"),
                URLQueryItem(name: "1", value: "4294967295"),
            ]
        } unkeyedValueUInt8: { _, _ in
            [
                URLQueryItem(name: "0", value: "0"),
                URLQueryItem(name: "1", value: "255"),
            ]
        } unkeyedValueUInt16: { _, _ in
            [
                URLQueryItem(name: "0", value: "0"),
                URLQueryItem(name: "1", value: "65535"),
            ]
        } unkeyedValueUInt32: { _, _ in
            [
                URLQueryItem(name: "0", value: "0"),
                URLQueryItem(name: "1", value: "4294967295"),
            ]
        } unkeyedValueUInt64: { _, _ in
            [
                URLQueryItem(name: "0", value: "0"),
                URLQueryItem(name: "1", value: "18446744073709551615"),
            ]
        } unkeyedValueDataBase64: { _, _ in
            [
                URLQueryItem(name: "0", value: "3q2+7w=="),
                URLQueryItem(name: "1", value: "q83vAA=="),
            ]
        } unkeyedValueDataCustom: { _, _ in
            [
                URLQueryItem(name: "0", value: "42"),
                URLQueryItem(name: "1", value: "42"),
            ]
        } unkeyedValueDataDeferredToData: { _, _ in
            [
                URLQueryItem(name: "0.0", value: "222"),
                URLQueryItem(name: "0.1", value: "173"),
                URLQueryItem(name: "0.2", value: "190"),
                URLQueryItem(name: "0.3", value: "239"),
                URLQueryItem(name: "1.0", value: "171"),
                URLQueryItem(name: "1.1", value: "205"),
                URLQueryItem(name: "1.2", value: "239"),
                URLQueryItem(name: "1.3", value: "0"),
            ]
        } unkeyedValueDateCustom: { _, _ in
            [
                URLQueryItem(name: "0", value: "42"),
                URLQueryItem(name: "1", value: "42"),
            ]
        } unkeyedValueDateDeferredToDate: { _, _ in
            [
                URLQueryItem(name: "0", value: "-978306200"),
                URLQueryItem(name: "1", value: "-977307200"),
            ]
        } unkeyedValueDateFormatted: { _, _ in
            [
                URLQueryItem(name: "0", value: "Thursday, January 1, 1970 at 12:16:40 AM Greenwich Mean Time"),
                URLQueryItem(name: "1", value: "Monday, January 12, 1970 at 1:46:40 PM Greenwich Mean Time"),
            ]
        } unkeyedValueDateISO8601: { _, _ in
            [
                URLQueryItem(name: "0", value: "1970-01-01T00:16:40Z"),
                URLQueryItem(name: "1", value: "1970-01-12T13:46:40Z"),
            ]
        } unkeyedValueDateMillisecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "0", value: "1000000"),
                URLQueryItem(name: "1", value: "1000000000"),
            ]
        } unkeyedValueDateSecondsSince1970: { _, _ in
            [
                URLQueryItem(name: "0", value: "1000"),
                URLQueryItem(name: "1", value: "1000000"),
            ]
        } unkeyedValueDouble: { _, _ in
            [
                URLQueryItem(name: "0", value: "123.45"),
                URLQueryItem(name: "1", value: "678910.11"),
            ]
        } unkeyedValueDoubleConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "0", value: "notANumber"),
                URLQueryItem(name: "1", value: "678910.11"),
            ]
        } unkeyedValueDoubleConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "0", value: "negativeInfinity"),
                URLQueryItem(name: "1", value: "678910.11"),
            ]
        } unkeyedValueDoubleConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "0", value: "positiveInfinity"),
                URLQueryItem(name: "1", value: "678910.11"),
            ]
        } unkeyedValueFloat: { _, _ in
            [
                URLQueryItem(name: "0", value: "123.45"),
                URLQueryItem(name: "1", value: "678910.1"),
            ]
        } unkeyedValueFloatConvertToStringNaN: { _, _ in
            [
                URLQueryItem(name: "0", value: "notANumber"),
                URLQueryItem(name: "1", value: "678910.1"),
            ]
        } unkeyedValueFloatConvertToStringNegativeInfinity: { _, _ in
            [
                URLQueryItem(name: "0", value: "negativeInfinity"),
                URLQueryItem(name: "1", value: "678910.1"),
            ]
        } unkeyedValueFloatConvertToStringPositiveInfinity: { _, _ in
            [
                URLQueryItem(name: "0", value: "positiveInfinity"),
                URLQueryItem(name: "1", value: "678910.1"),
            ]
        }
    }
}
