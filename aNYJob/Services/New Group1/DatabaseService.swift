//
//  DatabaseService.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase

/** This API client is responsible for fetching/pushing data from/to the Firebase database.
 */

protocol RefreshDelegate {
    func refreshTableView()
}

protocol ShowAlertDelegate {
    func showAlertDelegate(nameOfWhatYoureSaving: String)
}

class DatabaseService: NSObject {
    
    var refreshDelegate: RefreshDelegate?
    var showAlertDelegate: ShowAlertDelegate?
    
    /// The singleton object for the DatabaseService API client.
    static let manager = DatabaseService()
    public weak var delegate: DatabaseServiceDelegate?
    var rootRef: DatabaseReference!
    var usersRef: DatabaseReference!
    //var postsRef: DatabaseReference!
    var savedJobsRef: DatabaseReference!
    
    private override init() {
        self.rootRef = Database.database().reference()
        self.usersRef = self.rootRef.child("users")
        //self.postsRef = self.rootRef.child("posts")
        self.savedJobsRef = self.rootRef.child("savedJobs")
        super.init()
    }
    
    /**
     Removes all observers from all references.
     */
    public func stopObserving() {
        rootRef.removeAllObservers()
        usersRef.removeAllObservers()
        //postsRef.removeAllObservers()
        savedJobsRef.removeAllObservers()
    }
    
    /** This method checks if the given displayName is already in use by another user.
     
     - Parameters:
     - newName: The new name to change to.
     - currentUserID: The ID of the current, authorized user.
     - completion: A closure that passes back a Bool (whether the name is in use or not), the oldName, and the newName.
     - isTaken: If the name is taken or not.
     - oldName: The previous displayName of the current user.
     - newName: The new displayName of the current user.
     */
    public func checkIfDisplayNameIsTaken(_ newName: String, currentUserID: String?, completion: @escaping (_ isTaken: Bool, _ oldName: String, _ newName: String) -> Void) {
        usersRef.observeSingleEvent(of: .value) { (dataSnapshot) in
            var oldName: String!
            for childSnapShot in dataSnapshot.children.allObjects as! [DataSnapshot] {
                guard let userDict = childSnapShot.value as? [String : Any] else {
                    return
                }
                guard
                    let displayName = userDict["displayName"] as? String,
                    let userID = userDict["userID"] as? String
                    else {
                        return
                }
                if let currentUserID = currentUserID {
                    if userID == currentUserID {
                        oldName = displayName
                    }
                    if newName == displayName && currentUserID != userID {
                        completion(true, oldName, newName)
                        return
                    }
                } else {
                    if newName == displayName {
                        completion(true, oldName, newName)
                        return
                    }
                }
            }
            if let oldName = oldName {
                completion(false, oldName, newName)
                if let currentUserID = currentUserID {
                    self.usersRef.child(currentUserID).child("displayName").setValue(newName, withCompletionBlock: { (error, _) in
                        if let error = error {
                            self.delegate?.didFailChangingDisplayName?(self, error: error.localizedDescription)
                        } else {
                            self.delegate?.didChangeDisplayName?(self, oldName: oldName, newName: newName)
                        }
                    })
                }
                return
            } else {
                completion(false, newName, newName)
                return
            }
        }
    }
}

