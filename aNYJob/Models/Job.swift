//
//  Job.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

struct Job: Codable {
    let additional_information: String
    let agency: String
    let business_title: String
    let civil_service_title: String
    let division_work_unit: String
    let full_time_part_time_indicator: String
    let hours_shift: String
    let job_category: String
    let job_description: String
    let job_id: String
    let minimum_qual_requirements: String?
    let post_until: String?
    let posting_date: String
    let posting_type: String
    let posting_updated: String
    let preferred_skills: String
    let process_date: String
    let residency_requirement: String?
    let salary_frequency: String
    let salary_range_from: String
    let salary_range_to: String
    let title_code_no: String
    let to_apply: String
    let work_location: String
    let work_location_1: String
}
