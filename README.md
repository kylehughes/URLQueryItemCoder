# URLQueryItemCoder

[![Platform Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkylehughes%2FURLQueryItemCoder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/kylehughes/URLQueryItemCoder)
[![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkylehughes%2FURLQueryItemCoder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/kylehughes/URLQueryItemCoder)
[![Test](https://github.com/kylehughes/URLQueryItemCoder/actions/workflows/test.yml/badge.svg)](https://github.com/kylehughes/URLQueryItemCoder/actions/workflows/test.yml)

*Encoder & decoder for working with `Codable` types as `URLQueryItem`s.*

## About

URLQueryItemCoder provides an implementation of Swift's `Encoder` protocol suitable for encoding an `Encodable` type as 
an array of `URLQueryItem`s, and an implementation of Swift's `Decoder` protocol suitable for decoding a `Decodable`
type from an array of `URLQueryItem`s.

This allows us to lift `URLQueryItem` requirements into the type system (e.g. modeling an `HTTP GET` API).

### Capabilities

URLQueryItemCoder is an exhaustive implementation with an exhaustive test suite.

#### Standard

All standard features expected by the protocols are supported.

- [x] Single-value containers
- [x] Keyed containers
- [x] Unkeyed containers
- [x] Nested containers
- [x] Inheritance

#### Extra

All extra features offered by Swift's JSON implementations are supported.

- [x] `Data` special treatment
- [x] `Date` special treatment
- [x] `Double` & `Float` special treatment
- [x] Key conversions
- [x] Sorted keys

## Usage

### Encoding

`URLQueryItemEncoder` can be configured through its initializer or `strategies` and `outputFormatting` properties.

For example, given…

```swift
import URLQueryItemCoder

struct Interval: Codable {
    let start: Date
    let end: Date
}

struct GetPostsQuery: Codable {    
    let interval: Interval
    let userID: String
}

let interval = Interval(start: .now.addingTimeInterval(-1_000), end: .now)
let query = GetPostsQuery(interval: interval, userID: "123abc")
```

Then…

```swift
let encoder = URLQueryItemEncoder(dateStrategy: .secondsSince1970)
let queryItems = try! encoder.encode(query)
// [
//     URLQueryItem(name: "interval.end", value: "1681256918.240762"),
//     URLQueryItem(name: "interval.start", value: "1681255918.240762"),
//     URLQueryItem(name: "userID", value: "123abc"),
// ]
```

### Decoding

`URLQueryItemDecoder` can be configured through its initializer or `strategy` property.

For example, given…

```swift
import URLQueryItemCoder

struct GetPostsQuery: Codable {
    struct Interval: Codable {
        let start: Date
        let end: Date
    }
    
    let interval: Interval
    let userID: String
}

let queryItems = [
    URLQueryItem(name: "interval.start", value: "1681255918.240762"),
    URLQueryItem(name: "interval.end", value: "1681256918.240762"),
    URLQueryItem(name: "userID", value: "123abc"),
]
```

Then…

```swift
let decoder = URLQueryItemDecoder(dateStrategy: .secondsSince1970)
let query = try! decoder.decode(GetPostsQuery.self, from: queryItems)
// GetPostsQuery(
//     interval: Interval(start: 1681255918.240762, end: 1681256918.240762),
//     userID: "123abc"
// )
```

## Supported Platforms

- iOS
- macOS
- tvOS
- watchOS

## Requirements

- Swift 5.7+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/kylehughes/URLQueryItemCoder.git", .upToNextMajor(from: "1.0.0")),
]
```

## Documentation

[Documentation is available on GitHub Pages](https://kylehughes.github.io/URLQueryItemCoder).

## Contributions

URLQueryItemCoder is not accepting source contributions at this time. Bug reports will be considered.

## Author

[Kyle Hughes](https://kylehugh.es)

[![my Mastodon][social_image]][social_url]

[social_image]: https://img.shields.io/mastodon/follow/109356914477272810?domain=https%3A%2F%2Fmister.computer&style=social
[social_url]: https://mister.computer/@kyle

## License

URLQueryItemCoder is available under the MIT license. 

See `LICENSE` for details.
