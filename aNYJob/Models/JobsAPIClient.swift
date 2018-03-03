//
//  JobsAPIClient.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

class JobsAPIClient {
    
    private init() { }
    static let manager = JobsAPIClient()
    
    func getJobs(filename: String, type: String) -> [Job]? {
        var jobs: [Job]? = nil
        if let pathname = Bundle.main.path(forResource: filename, ofType: type) {
            guard let jsonData = FileManager.default.contents(atPath: pathname) else { return nil }
            do {
                let decoder = JSONDecoder()
                jobs = try decoder.decode([Job].self, from: jsonData)
            } catch {
                print("Unable to read json file: \(error)")
            }
        }
        return jobs
    }
    
    func getOnlineJobs(with keyword: String, completionHandler: @escaping ([Job]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let fullUrl = "https://data.cityofnewyork.us/resource/swhp-yxa4.json?$where=business_title%20like%20%27%25\(keyword)%25%27"
        guard let url = URL(string: fullUrl) else {
            errorHandler(AppError.badUrl(str: fullUrl))
            return
        }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let jobs = try JSONDecoder().decode([Job].self, from: data)
                completionHandler(jobs)
            }
            catch {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}
