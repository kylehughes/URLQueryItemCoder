//
//  Global+FatalError.swift
//  TestSupport
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

/// Unconditionally prints a predefined message and stops execution.
///
/// - Parameters:
///   - message: The string to print. The default is an empty string.
///   - file: The file name to print with `message`. The default is the file
///     where `fatalError(_:file:line:)` is called.
///   - line: The line number to print along with `message`. The default is the
///     line number where `fatalError(_:file:line:)` is called.
public func fatalErrorForUnimplementedAbstractInterface(file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("Must be implemented by subclass.")
}
