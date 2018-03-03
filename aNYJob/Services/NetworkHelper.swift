//
//  NetworkHelper.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noData
    case badUrl(str: String)
    case noInternet
    case codingError(rawError: Error)
    case urlError(rawError: Error)
    case couldNotParseJSON(rawError: Error)
    case otherError(rawError: Error)
}

class NetworkHelper {
    private init() {
        urlSession.configuration.requestCachePolicy = .returnCacheDataElseLoad
    }
    static let manager = NetworkHelper()
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with request: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        if let response = URLCache.shared.cachedResponse(for: request) {
            completionHandler(response.data)
            return
        }
        self.urlSession.dataTask(with: request){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.noData); return}
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
                
            }
            }.resume()
    }
}

