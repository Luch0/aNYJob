//
//  DatabaseService+Get.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseService {
    
    public func getUserProfile(withUID uid: String, completion: @escaping (_ userProfile: UserProfile) -> Void) {
        let ref = usersRef.child(uid)
        ref.observe(.value) { (dataSnapshot) in
            guard let email = dataSnapshot.childSnapshot(forPath: "email").value as? String else {
                return
            }
            guard let address = dataSnapshot.childSnapshot(forPath: "address").value as? String else {
                return
            }
            guard (dataSnapshot.childSnapshot(forPath: "address").value as? String) != nil else {
                return
            }
            
            let currentUserProfile = UserProfile(email: email, userID: uid, address: address)
            completion(currentUserProfile)
        }
    }
 
    func getSavedJobs(completion: @escaping ([Job]?) -> Void) {
        savedJobsRef.child((AuthUserService.manager.getCurrentUser()?.uid)!).observeSingleEvent(of: .value) { (dataSnapshot) in
            guard let arrayOfAllSavedJobsSnapshot = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                print("could not get children snapshots")
                completion(nil)
                return
            }
            var savedJobsArrayToReturn: [Job] = [] // This is the empty saved jobs array that will be filled by the completion handler
            for postSnapshot in arrayOfAllSavedJobsSnapshot {
                guard let savedJobDictionary = postSnapshot.value as? [String : Any] else {
                    print("could not get saved jobs dict")
                    completion(nil)
                    return
                }
                guard let additionalInformation = savedJobDictionary["additional_information"] as? String else {
                    completion(nil)
                    return
                }
                guard let agency = savedJobDictionary["agency"] as? String else {
                    completion(nil)
                    return
                }
                guard let businessTitle = savedJobDictionary["business_title"] as? String else {
                    completion(nil)
                    return
                }
                guard let civilServiceTitle = savedJobDictionary["civil_service_title"] as? String else {
                    completion(nil)
                    return
                }
                guard let divisionWorkUnit = savedJobDictionary["division_work_unit"] as? String else {
                    completion(nil)
                    return
                }
                guard let fullTimePartTimeIndicator = savedJobDictionary["full_time_part_time_indicator"] as? String else {
                    completion(nil)
                    return
                }
                guard let hoursShift = savedJobDictionary["hours_shift"] as? String else {
                    completion(nil)
                    return
                }
                guard let jobCategory = savedJobDictionary["job_category"] as? String else {
                    completion(nil)
                    return
                }
                guard let jobDescription = savedJobDictionary["job_description"] as? String else {
                    completion(nil)
                    return
                }
                guard let jobId = savedJobDictionary["job_id"] as? String else {
                    completion(nil)
                    return
                }
                guard let minimumQualRequirements = savedJobDictionary["minimum_qual_requirements"] as? String else {
                    completion(nil)
                    return
                }
                guard let postUntil = savedJobDictionary["post_until"] as? String else {
                    completion(nil)
                    return
                }
                guard let postingDate = savedJobDictionary["posting_date"] as? String else {
                    completion(nil)
                    return
                }
                guard let postingType = savedJobDictionary["posting_type"] as? String else {
                    completion(nil)
                    return
                }
                guard let postingUpdated = savedJobDictionary["posting_updated"] as? String else {
                    completion(nil)
                    return
                }
                guard let preferredSkills = savedJobDictionary["preferred_skills"] as? String else {
                    completion(nil)
                    return
                }
                guard let processDate = savedJobDictionary["process_date"] as? String else {
                    completion(nil)
                    return
                }
                guard let residencyRequirement = savedJobDictionary["residency_requirement"] as? String else {
                    completion(nil)
                    return
                }
                guard let salaryFrequency = savedJobDictionary["salary_frequency"] as? String else {
                    completion(nil)
                    return
                }
                guard let salaryRangeFrom = savedJobDictionary["salary_range_from"] as? String else {
                    completion(nil)
                    return
                }
                guard let salaryRangeTo = savedJobDictionary["salary_range_to"] as? String else {
                    completion(nil)
                    return
                }
                guard let titleCodeNo = savedJobDictionary["title_code_no"] as? String else {
                    completion(nil)
                    return
                }
                guard let toApply = savedJobDictionary["to_apply"] as? String else {
                    completion(nil)
                    return
                }
                guard let workLocation = savedJobDictionary["work_location"] as? String else {
                    completion(nil)
                    return
                }
                guard let workLocation1 = savedJobDictionary["work_location_1"] as? String else {
                    completion(nil)
                    return
                }
                let savedJob = Job(additional_information: additionalInformation, agency: agency, business_title: businessTitle, civil_service_title: civilServiceTitle, division_work_unit: divisionWorkUnit, full_time_part_time_indicator: fullTimePartTimeIndicator, hours_shift: hoursShift, job_category: jobCategory, job_description: jobDescription, job_id: jobId, minimum_qual_requirements: minimumQualRequirements, post_until: postUntil, posting_date: postingDate, posting_type: postingType, posting_updated: postingUpdated, preferred_skills: preferredSkills, process_date: processDate, residency_requirement: residencyRequirement, salary_frequency: salaryFrequency, salary_range_from: salaryRangeFrom, salary_range_to: salaryRangeTo, title_code_no: titleCodeNo, to_apply: toApply, work_location: workLocation, work_location_1: workLocation1)
                savedJobsArrayToReturn.append(savedJob)
            }
            completion(savedJobsArrayToReturn)
        }
    }
 
}
