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
                print("Unable to read json file: \(error.localizedDescription)")
            }
        }
        return baseSalaries
    }
}
