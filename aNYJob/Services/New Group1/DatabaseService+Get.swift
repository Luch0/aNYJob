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
    
    /*
 TODO: Edit for getting saved jobs
 
    func getAllPosts(fromUserID userID: String, completion: @escaping ([Post]?) -> Void) {
        let allPostsRef = postsRef.child(userID)
        allPostsRef.observeSingleEvent(of: .value) { (dataSnapshot) in
            guard let arrayOfAllPostsSnapshot = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                print("could not get children snapshots")
                completion(nil)
                return
            }
            var postsArrayToReturn: [Post] = [] // This is the empty post array that will be filled by the completion handler
            for postSnapshot in arrayOfAllPostsSnapshot {
                guard let postDictionary = postSnapshot.value as? [String : Any] else {
                    print("could not get post dict")
                    completion(nil)
                    return
                }
                guard let downcastedUserID = postDictionary["userID"] as? String else {
                    completion(nil)
                    return
                }
                guard let downcastedComment = postDictionary["comment"] as? String else {
                    completion(nil)
                    return
                }
                guard let downcastedImageURL = postDictionary["imageURL"] as? String else {
                    completion(nil)
                    return
                }
                guard let downcastedPostID = postDictionary["postID"] as? String else {
                    completion(nil)
                    return
                }
                let post = Post(postID: downcastedPostID, imageURL: downcastedImageURL, comment: downcastedComment, userID: downcastedUserID)
                postsArrayToReturn.append(post)
            }
            completion(postsArrayToReturn)
        }
    }
 */
}
