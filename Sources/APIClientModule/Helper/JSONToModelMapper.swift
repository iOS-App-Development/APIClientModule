//
//  JSONToModelMapper.swift
//  
//
//  Created by Muzammil Peer on 27/01/2022.
//

import Foundation

public final class JSONToModelMapper<T:Decodable> {

  
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
//    public static func validate<T:Decodable>(decodable:T, _ data: Data, from response: HTTPURLResponse) throws -> T{
    public static func validate(_ data: Data, from response: HTTPURLResponse) throws -> T{
        guard response.isOK, let root = try? JSONDecoder().decode(T.self, from: data) else {
            throw Error.invalidData
        }
        return root
    }
    
//    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [StubFruitImage] {
//        
//        do {
//            let decoder = JSONDecoder()
//            let messages = try decoder.decode(Root.self, from: data)
//            print(messages as Any)
//        } catch DecodingError.dataCorrupted(let context) {
//            print(context)
//        } catch DecodingError.keyNotFound(let key, let context) {
//            print("Key '\(key)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch DecodingError.valueNotFound(let value, let context) {
//            print("Value '\(value)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch DecodingError.typeMismatch(let type, let context) {
//            print("Type '\(type)' mismatch:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch {
//            print("error: ", error)
//        }
//        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
//            throw Error.invalidData
//        }
//        
//        return root.fruits
//    }
}
