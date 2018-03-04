//
//  BaseSalaryAPIClient.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

class BaseSalaryAPIClient {
    
    private init() { }
    static let manager = BaseSalaryAPIClient()
    
    func getBaseSalaries(filename: String, type: String) -> [BaseSalary]? {
        var baseSalaries: [BaseSalary]? = nil
        if let pathname = Bundle.main.path(forResource: filename, ofType: type) {
            guard let jsonData = FileManager.default.contents(atPath: pathname) else { return nil }
            do {
                let decoder = JSONDecoder()
                baseSalaries = try decoder.decode([BaseSalary].self, from: jsonData)
            } catch {
                print("Unable to read json file: \(error)")
            }
        }
        return baseSalaries
    }
    
    func getOnlineBaseSlalaries(with keyword: String, completionHandler: @escaping ([BaseSalary]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let fullUrl = "https://data.cityofnewyork.us/resource/4qxi-jgbe.json?$where=title_description%20like%20%27%25\(keyword.uppercased())%25%27"
        guard let url = URL(string: fullUrl) else {
            errorHandler(AppError.badUrl(str: fullUrl))
            return
        }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let baseSalaries = try JSONDecoder().decode([BaseSalary].self, from: data)
                completionHandler(baseSalaries)
            }
            catch {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}
