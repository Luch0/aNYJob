//
//  BaseSalary.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

struct BaseSalary: Codable {
    let agency_name: String
    let agency_start_date: String
    let base_salary: String
    let first_name: String?
    let fiscal_year: String
    let last_name: String?
    let leave_status_as_of_july_31: String
    let mid_init: String?
    let ot_hours: String
    let pay_basis: String
    let regular_gross_paid: String
    let regular_hours: String
    let title_description: String
    let total_ot_paid: String
    let total_other_pay: String
    let work_location_borough: String
}
