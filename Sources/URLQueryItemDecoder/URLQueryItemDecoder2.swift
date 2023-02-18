//
//  URLQueryItemDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/17/23.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemDecoder2 {
    // TODO: map [URLQueryItem] to the `DecodingContainer<String>` tree structure
    private func decode(from queryItems: [URLQueryItem]) -> DecodingContainerType<String> {
        let multiValueContainer = DecodingContainer<String>(codingPath: [])
        
        for queryItem in queryItems {
            guard
                let keys = queryItem.name.removingPercentEncoding?.components(separatedBy: "."),
                let firstKey = keys.first,
                !firstKey.isEmpty
            else {
                let singleValue = DecodingContainer<String>.SingleValue(codingPath: [])
                
                if let value = queryItem.value?.removingPercentEncoding {
                    singleValue.store(value)
                }
                
                return .singleValue(singleValue)
            }
            
            // Once we're here we know that we, at the root, have a multiValue container
            
            var codingPath: [String] = []
            var currentMultiValueContainer = multiValueContainer
            
            for (index, key) in zip(keys.indices, keys) {
                codingPath.append(key)
                
                if index == keys.index(before: keys.endIndex) {
                    let singleValue = DecodingContainer<String>.SingleValue(codingPath: codingPath.map(StringCodingKey.init))
                    
                    if let value = queryItem.value?.removingPercentEncoding {
                        singleValue.store(value)
                    }
                    
                    currentMultiValueContainer.storage[key] = .singleValue(singleValue)
                } else if let nestedContainer = currentMultiValueContainer.storage[key] {
                    switch nestedContainer {
                    case let .multiValue(existingMultiValueContainer):
                        currentMultiValueContainer = existingMultiValueContainer
                    case .singleValue:
                        fatalError("bad I think")
                    }
                } else {
                    let newMultiValueContainer = DecodingContainer<String>(codingPath: codingPath.map(StringCodingKey.init))
                    currentMultiValueContainer.storage[key] = .multiValue(newMultiValueContainer)
                    currentMultiValueContainer = newMultiValueContainer
                }
            }
        }
        
        return .multiValue(multiValueContainer)
    }
    
    // the whole logic of this is that I drill into something like four.one.1 and eventually set that value to the primitive value
    // but not until I bottom out in futureCodingPath
    // and the og array I'm going through has a bunch of those
    
    // The below code was written 2 months apart and I really lost the plot
    
//    private func decode(
//        key: String?,
//        precededBy codingPath: [String],
//        followedBy futureCodingPath: [String],
//        as primitiveValue: String,
//        in parent: inout DecodingContainerType<String>?
//    ) {
//        guard let key else {
//            guard let parent else {
//                let container = DecodingContainer<String>.SingleValue(codingPath: codingPath.map(StringCodingKey.init))
//                container.store(primitiveValue)
//                parent = .singleValue(container)
//
//                // TODO: don't know if there's anything else to do…
//                return
//            }
//
//            switch parent {
//            case .multiValue:
//                // TODO: Throw error
//                fatalError("TODO: throw error")
//            case let .singleValue(container):
//                container.store(primitiveValue)
//            }
//
//            // TODO: don't know if there's anything else to do…
//            return
//        }
//
//        parent = parent ?? .multiValue(DecodingContainer<String>(codingPath: codingPath.map(StringCodingKey.init)))
//
//        guard let parent else {
//            fatalError("IMpossible?")
//        }
//
//        guard futureCodingPath.isEmpty else {
//            switch parent {
//            case let .multiValue(container):
//                guard var existing = Optional(container.storage[key]) else {
//                    let new = DecodingContainer<String>(codingPath: codingPath.appending(key).map(StringCodingKey.init))
//                    container.storage[key] = .multiValue(new)
//
//                    return
//                }
//
//                decode(
//                    key: futureCodingPath.first,
//                    precededBy: codingPath.appending(key),
//                    followedBy: Array(futureCodingPath.dropFirst()),
//                    as: primitiveValue,
//                    in: &existing
//                )
//            case .singleValue:
//                // TODO: Throw error
//                fatalError("TODO: throw error")
//            }
//
//            return
//        }
//
//        switch parent {
//        case let .multiValue(container):
//            let singleValue = DecodingContainer<String>.SingleValue(codingPath: codingPath.map(StringCodingKey.init))
//            singleValue.store(primitiveValue)
//            container.storage[key] = .singleValue(singleValue)
//        case .singleValue:
//            // TODO: Throw error
//            fatalError("TODO: throw error")
//        }
//
////        let container: DecodingContainer<String> = {
////            guard let existing = parent.storage[key] else {
////                let new = DecodingContainer<String>(codingPath: codingPath.appending(key).map(StringCodingKey.init))
////                parent.storage[key] = .multiValue(new)
////
////                return new
////            }
////
////            switch existing {
////            case let .multiValue(container):
////                return container
////            case .singleValue:
////                fatalError("TODO")
////            }
////        }()
////
////        // TODO: trying to get this to compile
////        decode(
////            key: futureCodingPath.first,
////            precededBy: codingPath.appending(key),
////            followedBy: Array(futureCodingPath.dropFirst()),
////            as: primitiveValue,
////            in: container
////        )
//    }
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder2: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        let container = decode(from: from)
        let lowLevelDecoder = LowLevelDecoder2(container: container)
        
        return try Value(from: lowLevelDecoder)
    }
}
