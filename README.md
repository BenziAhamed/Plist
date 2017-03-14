# Plist

[![CI Status](http://img.shields.io/travis/BenziAhamed/Plist.svg?style=flat)](https://travis-ci.org/BenziAhamed/Plist)
[![Version](https://img.shields.io/cocoapods/v/Plist.svg?style=flat)](http://cocoapods.org/pods/Plist)
[![License](https://img.shields.io/cocoapods/l/Plist.svg?style=flat)](http://cocoapods.org/pods/Plist)
[![Platform](https://img.shields.io/cocoapods/p/Plist.svg?style=flat)](http://cocoapods.org/pods/Plist)

A simple Swift library to work with plist files and data. Inspired by SwitfyJSON.

## Usage

```swift
import Plist

// initialize using an NSDictionary
// and retrieve keyed values

let info = Plist(dict)
let name = info["name"].string ?? ""
let age = info["age"].int ?? 0


// initialize using an NSArray
// and retrieve indexed values

let info = Plist(array)
let itemAtIndex0 = info[0].value

// load an applications info.plist data

let info = Plist(NSBundle.mainBundle().infoDictionary)
let identifier = info["CFBundleIndentifier"].string!

// utility initiaizer to load a plist file at specified path
let info = Plist(path: "path_to_plist_file")

// we support index chaining - you can get to a dictionary from an array via
// a dictionary and so on
// don't worry, the following will not fail with errors in case
// the index path is invalid
if let complicatedAccessOfSomeStringValueOfInterest = info["dictKey"][10]["anotherKey"].string {
  // do something
}
else {
  // data cannot be indexed
}

// you can also re-use parts of a plist data structure

let info = Plist(...)
let firstSection = info["Sections"][0]["SectionData"]
let sectionKey = firstSection["key"].string!
let sectionSecret = firstSection["secret"].int!


```

NOTE: To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8+, Swift 3.0

## Installation

Plist is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Plist"
```

### Manual Install

Copy over Plist.swift and place in a project of your choice, including it in your build.

## Author

Benzi Ahamed, [Twitter](https://twitter.com/BenziAhamed)

## License

Plist is available under the MIT license. See the LICENSE file for more info.

Contributions encouraged and welcome!
