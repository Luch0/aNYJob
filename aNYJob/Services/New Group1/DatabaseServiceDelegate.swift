//
//  DatabaseServiceDelegate.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
@objc protocol DatabaseServiceDelegate: class {
    //change
    /** This method returns when the displayName for the current user has been successfully changed.
     
     - Parameters:
     - databaseService: The Firebase/Database API client.
     - oldName: The previous displayName.
     - newName: The new displayName.
     */
    @objc optional func didChangeDisplayName(_ databaseService: DatabaseService, oldName: String, newName: String)
    
    /** This method returns when the displayName could not be changed.
     
     - Parameters:
     - databaseService: The Firebase/Database API client.
     - error: The error message that occurred when attempting to change the displayName.
     */
    @objc optional func didFailChangingDisplayName(_ databaseService: DatabaseService, error: String)
    
    //get
    /** This method returns the all posts from the current, authenticated user, sorted from newest to oldest.
     
     - Parameters:
     - databaseService: The Firebase/Database API client.
     - posts: An array of posts from the current user, sorted from newest to oldest.
     */
    
    /**
     */
    @objc optional func didFailAddingUserProfile(_ databaseService: DatabaseService, error: String)
}

