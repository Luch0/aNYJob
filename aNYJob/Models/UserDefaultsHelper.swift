//
//  UserDefaultsHelper.swift
//  aNYJob
//
//  Created by Luis Calle on 3/4/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

struct UserDefaultsHelper {
    static let manager = UserDefaultsHelper()
    private init() {}
    
    private let addressKey = "addressKey"
    
    //Getting
    public func getAddress() -> String? {
        return UserDefaults.standard.string(forKey: addressKey)
    }
    
    //Saving
    public func saveAddress(named: String){
        UserDefaults.standard.setValue(named, forKey: addressKey)
    }
    
    
}

