//
//  String+Extension.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/4/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import Foundation

extension String {
    
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return ""
    }
    
    func utf8EncodedString()-> String {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8)
        return text ?? ""
    }
}
