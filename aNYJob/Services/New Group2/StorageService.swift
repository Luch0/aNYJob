//
//  StorageService.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

// NOT STORING IMAGES - INGORE THIS ENTIRE FILE

protocol StorageServiceDelegate: class {
    /**
     This method is called when the image is successfully stored in Firebase Storage.
     
     - Parameters:
     - storageService: The Firebase/Storage API client.
     */
    func didStoreImage(_ storageService: StorageService)
    /**
     This method returns when the Firebase/Storage API client fails to store the given image.
     
     - Parameters:
     - storageService: The Firebase/Storage API client.
     - error: The error message received when the the Firebase/Storage API client fails to store the given image.
     */
    func didFailStoreImage(_ storageService: StorageService, error: String)
}

/** This API client is responsible for storing objects in the Firebase Cloud Storage.
 */
class StorageService {
    private init() {
        self.storageRef = Storage.storage().reference() // This is the reference for storage on Firebase
        self.imagesRef = storageRef.child("images")
    }
    
    /// The singleton object associated with the StorageService API client.
    static let manager = StorageService()
    private let storageRef: StorageReference!
    private let imagesRef: StorageReference!
    
    public weak var delegate: StorageServiceDelegate?
    
    // NOT STORING IMAGES - INGORE THIS
    /*
    public func storePostImage(image: UIImage?, withPostID postID: String, completion: @escaping (_ error: String?, _ imageURL: String?) -> Void) {
        
        guard let image = image else {
            print("no image submitted")
            return
        }
        
        guard let uploadTask = StorageService.manager.storeImage(image, withImageID: postID, completion: completion) else {
            completion("Could not convert image to toucan or data", nil)
            return
        }
        
        //if success
        uploadTask.observe(.success) { (snapshot) in
            guard let downloadURL = snapshot.metadata?.downloadURL() else {
                print("could not get image download url")
                return
            }
            print("uploaded image")
            let downloadURLString = downloadURL.absoluteString
            DatabaseService.manager.addImageURLToPost(url: downloadURLString, postID: postID)
            completion(nil, downloadURLString)
        }
        
        //if fail
        uploadTask.observe(.failure) { (snapshot) in
            if let error = snapshot.error {
                self.delegate?.didFailStoreImage(self, error: error.localizedDescription)
            }
        }
    }
    
    // NOT STORING IMAGES - INGORE THIS
    
    func storeImage(_ image: UIImage, withImageID imageID: String, completion: @escaping (_ error: String?, _ imageURL: String?) -> Void) -> StorageUploadTask? {
        let ref = imagesRef.child(imageID)
        
        guard let resizedImage = Toucan(image: image).resize(CGSize(width: 800, height: 800)).image, let imageData = UIImagePNGRepresentation(resizedImage) else {
            return nil
        }
        
        let metadata = StorageMetadata()
        
        metadata.contentType = "image/png"
        
        return ref.putData(imageData, metadata: metadata) { (_, error) in
            if let error = error {
                completion("Upload Task Error: \(error.localizedDescription)", nil)
            }
        }
    }
 */
}
