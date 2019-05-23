//
//  FileOperations.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/22/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

struct FileOperation {
    var name: String
    var action: (URL, ((String?) -> Void)?) -> Void
    var shouldBeOnMainThread = false
    
    init(name: String, shouldBeOnMainThread: Bool = false, action: @escaping (URL, ((String?) -> Void)?) -> Void) {
        self.name = name
        self.action = action
        self.shouldBeOnMainThread = shouldBeOnMainThread
    }
}

class FileOperations {
    
    var list: [FileOperation]
    
    private let hashOperationAction: (URL, ((String?) -> Void)?) -> Void = { fileURL, completion in
        guard let fileData = NSData(contentsOfFile: fileURL.path) else {
            assert(false)
            completion?(nil)
            
            return
        }
        
        let md5 = (fileData as Data).md5
        
        completion?(md5)
    }
    
    init() {
        list = [
            FileOperation(name: NSLocalizedString("Calculate MD5", comment: ""), action: hashOperationAction)
        ]
    }
    
}
