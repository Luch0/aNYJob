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
    
    static func getJobs(filename: String, type: String) -> [Job]? {
        var jobs: [Job]? = nil
        if let pathname = Bundle.main.path(forResource: filename, ofType: type) {
            guard let jsonData = FileManager.default.contents(atPath: pathname) else { return nil }
            do {
                let decoder = JSONDecoder()
                jobs = try decoder.decode([Job].self, from: jsonData)
            } catch {
                print("Unable to read json file: \(error.localizedDescription)")
            }
        }
        return jobs
    }
}
