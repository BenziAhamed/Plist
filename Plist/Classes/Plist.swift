//
//  Plist.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Benzi Ahamed
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


import Foundation


public enum Plist {
    
    case dictionary(NSDictionary)
    case Array(NSArray)
    case Value(AnyObject)
    case none
    
    public init(_ dict: NSDictionary) {
        self = .dictionary(dict)
    }
    
    public init(_ array: NSArray) {
        self = .Array(array)
    }
    
    public init(_ value: AnyObject?) {
        self = Plist.wrap(value)
    }
    
}


// MARK:- initialize from a path

extension Plist {
    
    public init(path: String) {
        if let dict = NSDictionary(contentsOfFile: path) {
            self = .dictionary(dict)
        } else if let array = NSArray(contentsOfFile: path) {
            self = .Array(array)
        } else {
            self = .none
        }
    }
    
}


// MARK:- private helpers

extension Plist {
    
    /// wraps a given object to a Plist
    fileprivate static func wrap(_ object: Any?) -> Plist {
        
        if let dict = object as? NSDictionary {
            return .dictionary(dict)
        }
        if let array = object as? NSArray {
            return .Array(array)
        }
        if let value = object {
            return .Value(value as AnyObject)
        }
        return .none
    }
    
    /// tries to cast to an optional T
    fileprivate func cast<T>() -> T? {
        switch self {
        case let .Value(value):
            return value as? T
        default:
            return nil
        }
    }
}

// MARK:- subscripting

extension Plist {
    
    /// index a dictionary
    public subscript(key: String) -> Plist {
        switch self {
            
        case let .dictionary(dict):
            let v = dict.object(forKey: key)
            return Plist.wrap(v)
            
        default:
            return .none
        }
    }
    
    /// index an array
    public subscript(index: Int) -> Plist {
        switch self {
        case let .Array(array):
            if index >= 0 && index < array.count {
                return Plist.wrap(array[index])
            }
            return .none
            
        default:
            return .none
        }
    }
    
}


// MARK:- Value extraction

extension Plist {
    public var string: String? { return cast() }
    public var int: Int? { return cast() }
    public var double: Double? { return cast() }
    public var float: Float? { return cast() }
    public var date: Date? { return cast() }
    public var data: Data? { return cast() }
    public var number: NSNumber? { return cast() }
    public var bool: Bool? { return cast() }
    
    
    // unwraps and returns the underlying value
    public var value: Any? {
        switch self {
        case let .Value(value):
            return value
        case let .dictionary(dict):
            return dict
        case let .Array(array):
            return array
        case .none:
            return nil
        }
    }
    
    // returns the underlying array
    public var array: NSArray? {
        switch self {
        case let .Array(array):
            return array
        default:
            return nil
        }
    }
    
    // returns the underlying dictionary
    public var dict: NSDictionary? {
        switch self {
        case let .dictionary(dict):
            return dict
        default:
            return nil
        }
    }
    
}


// MARK:- CustomStringConvertible

extension Plist : CustomStringConvertible {
    public var description: String {
        switch self {
        case let .Array(array): return "(array \(array))"
        case let .dictionary(dict): return "(dict \(dict))"
        case let .Value(value): return "(value \(value))"
        case .none: return "(none)"
        }
    }
}
