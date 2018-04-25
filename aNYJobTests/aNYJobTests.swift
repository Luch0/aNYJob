//
//  aNYJobTests.swift
//  aNYJobTests
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import XCTest
@testable import aNYJob

class aNYJobTests: XCTestCase {
    
    func testJobAPIConnection() {
        let jobResultsExpectation = XCTestExpectation(description: "Jobs results exist")
        //start network request
        var jobs = [Job]()
        JobsAPIClient.manager.getAllOnlineJobs(completionHandler: { jobs = $0 ; jobResultsExpectation.fulfill()}, errorHandler: {print($0)})
        //wait 10 seconds for results because it's async
        wait(for: [jobResultsExpectation], timeout: 10)
        XCTAssertGreaterThan(jobs.count, 0, "Jobs are coming back from NYC Open Data")
    }
    
    func testBaseSalaryAPIConnection() {
        let salaryResultsExpectation = XCTestExpectation(description: "Salary results exist")
        var salaries = [BaseSalary]()
        BaseSalaryAPIClient.manager.getOnlineBaseSlalaries(with: "Police", completionHandler: { salaries = $0 ; salaryResultsExpectation.fulfill()}, errorHandler: {print($0)})
        wait(for: [salaryResultsExpectation], timeout: 10)
        XCTAssertGreaterThan(salaries.count, 0, "Salaries are coming back from NYC Open Data")
    }
}
