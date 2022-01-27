//
//  AccountService.swift
//  
//
//  Created by Muzammil Peer on 27/01/2022.
//

import Foundation
import APIClient
import HTTPClientModule

public struct AccountService
{
    let httpClient:HTTPClient
    let baseURL:URL

    public init(httpClient:HTTPClient,baseURL:URL) {
        self.httpClient = httpClient
        self.baseURL = baseURL
    }
    
    func absoluteServerURL(uri:String) -> URL {
        return URL(string: "\(baseURL.absoluteString)\(uri)")!
    }

}

extension AccountService : AccountServiceProtocol
{
    public func getAccountProfile() -> [String]? {
        return nil
    }
    
    
    public func getMoviePopularList(completion: @escaping (_ resultObjects:Result<[RootResult],Error>?) -> Void) {
        var receivedResult: Swift.Result<[RootResult], Error>?
        httpClient.get(from: absoluteServerURL(uri: "movie/popular?api_key=a9dfed6dd4d408d46105886b9064d3f9")) { result in
            receivedResult = result.flatMap { (data, response) in
                do {
                    return .success((try JSONToModelMapper<RootDetail>.validate(data, from: response)).results ?? [])
                } catch {
                    return .failure(error)
                }
            }
            completion(receivedResult)
        }
    }
    

    
}
