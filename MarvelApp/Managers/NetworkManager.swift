//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import Foundation

class NetworkManager {
    
    func getSessionHeroes() -> URLRequest {
        guard let url = URL(string: "\(Constants.baseURL)\(Endpoints.characters)?\(Constants.TS)&apikey=\(Constants.PUBLIC_KEY)&limit=100&hash=\(Constants.HASH)&offset=0") else { return URLRequest(url: URL(string: "")!)}
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getSessionSeries(from id: String) -> URLRequest {
        guard let url = URL(string: "http://gateway.marvel.com/v1/public/characters/\(id)/series?ts=1&apikey=1fd4332f6de21fac3bfb0aa6e45cc355&hash=240fa162344b9b6910de22a52b7abc51") else { return URLRequest(url: URL(string: "")!)}
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
}

struct Constants {
    static let baseURL = "http://gateway.marvel.com/"
    static let TS = "ts=1"
    static let PUBLIC_KEY = "1fd4332f6de21fac3bfb0aa6e45cc355"
    static let HASH = "240fa162344b9b6910de22a52b7abc51"
}

struct Endpoints {
    static let characters = "v1/public/characters"
    static let comics = "v1/public/comics"
}

struct HTTPMethods {
    static let get = "GET"
    static let post = "POST"
}
