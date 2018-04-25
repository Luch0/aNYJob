//
//  DatabaseService+Add.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

extension DatabaseService {
    
    /**
     Stores a UserProfile object in the database after account creation.
     
     - Parameter userProfile: The UserProfile object passed in.
     */
    public func addUserProfile(_ userProfile: UserProfile) {
        
        let ref = usersRef.child(userProfile.userID)
        
        ref.setValue(["email": userProfile.email,
                      "userID": userProfile.userID,
                      "address" : userProfile.address
            
        ]) { (error, _) in
            if let error = error {
                self.delegate?.didFailAddingUserProfile?(self, error: error.localizedDescription)
                print("\(userProfile) not added to firebase")
            } else {
                print("new user added to database!!")
            }
        }
    }
    
    public func addSavedJob(_ jobToSave: Job) {
        //1. find ref
        let ref = savedJobsRef.child((AuthUserService.manager.getCurrentUser()?.uid)!).child(jobToSave.job_id)
        
        //2. call set value with completion handler
        ref.setValue(["additional_information": jobToSave.additional_information,
        "agency": jobToSave.agency,
        "business_title": jobToSave.business_title,
        "civil_service_title": jobToSave.civil_service_title,
        "division_work_unit": jobToSave.division_work_unit,
        "full_time_part_time_indicator": jobToSave.full_time_part_time_indicator,
        "hours_shift": jobToSave.hours_shift,
        "job_category": jobToSave.job_category,
        "job_description": jobToSave.job_description,
        "job_id": jobToSave.job_id,
        "minimum_qual_requirements": jobToSave.minimum_qual_requirements ?? "",
        "post_until": jobToSave.post_until ?? "",
        "posting_date": jobToSave.posting_date,
        "posting_type": jobToSave.posting_type,
        "posting_updated": jobToSave.posting_updated,
        "preferred_skills": jobToSave.preferred_skills,
        "process_date": jobToSave.process_date,
        "residency_requirement": jobToSave.residency_requirement ?? "",
        "salary_frequency": jobToSave.salary_frequency,
        "salary_range_from": jobToSave.salary_range_from,
        "salary_range_to": jobToSave.salary_range_to,
        "title_code_no": jobToSave.title_code_no,
        "to_apply": jobToSave.to_apply,
        "work_location": jobToSave.work_location,
        "work_location_1": jobToSave.work_location_1,
                      ]) { (error, nil) in
                        if let error = error {
                            print(error)
                        } else {
                            print("Job Saved")
                            self.refreshDelegate?.refreshTableView()
                            self.showAlertDelegate?.showAlertDelegate(nameOfWhatYoureSaving: "Job")
                        }
        }
    }
 
}
