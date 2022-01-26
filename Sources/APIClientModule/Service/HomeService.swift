//
//  HomeService.swift
//  
//
//  Created by Muzammil Peer on 27/01/2022.
//

import Foundation
import APIClient
import HTTPClientModule

public struct HomeService
{
    let httpClient:HTTPClient
    let baseURL:URL

    init(httpClient:HTTPClient,baseURL:URL) {
        self.httpClient = httpClient
        self.baseURL = baseURL
    }
    
    func absoluteServerURL(uri:String) -> URL {
        return URL(string: "\(baseURL.absoluteString)\(uri)")!
    }

}

extension HomeService : HomeServiceProtocol
{
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
    

//    public func getMoviePopularList() -> Swift.Result<[RootResult], Error>? {
//        var receivedResult: Swift.Result<[RootResult], Error>?
//        httpClient.get(from: absoluteServerURL(uri: "movie/popular?api_key=a9dfed6dd4d408d46105886b9064d3f9")) { result in
//            receivedResult = result.flatMap { (data, response) in
//                do {
//                    return .success((try JSONToModelMapper<RootDetail>.validate(data, from: response)).results ?? [])
//                } catch {
//                    return .failure(error)
//                }
//            }
//        }
//        return receivedResult
//    }
    
    public func getTrendingMovieList(byFilter: String) -> Swift.Result<[RootResult], Error>? {
        return nil
    }
    
    public func getMovieDetail(id: String) -> Swift.Result<MovieDetail, Error>? {
        return nil
    }
    
    public func searchMovie(byFilter: String) -> Swift.Result<[RootResult], Error>? {
        return nil
    }
    
    public func getMovieKeywords(byFilter: String) -> Swift.Result<[Keyword], Error>? {
        return nil
    }
    
    public func getMovieCast(byFilter: String) -> Swift.Result<[Cast], Error>? {
        return nil
    }
    
    public func getMovieRecommendations(byFilter: String) -> Swift.Result<[RootResult], Error>? {
        return nil
    }
    
    public func getMovieMedia(byFilter: String) -> Swift.Result<[Backdrop], Error>? {
        return nil
    }
    
    public func getTVPopularList() -> Swift.Result<[String], Error>? {
        return nil
    }
    
    public func getTVMovieList(byFilter: String) ->Swift.Result<[String], Error>? {
        return nil
    }
    
    public func getTVDetail(id: String) -> Swift.Result<[String], Error>? {
        return nil
    }
    
    public func searchTV(byFilter: String) -> Swift.Result<[String], Error>? {
        return nil
    }
    
    
}
