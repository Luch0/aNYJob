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
 
}
