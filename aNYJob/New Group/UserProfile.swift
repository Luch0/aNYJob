//
//  UserProfile.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseAuth

class UserProfile: NSObject{
    let email: String
    let userID: String //should be from firebase
    var address: String?
    
    override var description: String {
        return """
        - email: \(self.email)
        - userID: \(self.userID)
        - address: \(self.address)
        """
    }
    
    static func ==(lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.userID == rhs.userID
    }
    
    init(email: String, userID: String, address: String) {
        self.email = email
        self.userID = userID
        self.address = address
    }
}
