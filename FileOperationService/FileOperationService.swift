//
//  FileOperationService.swift
//  FileOperationService
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

class FileOperationService: NSObject, FileOperationServiceProtocol {
    
    static let serviceName = "com.constantine-k.FileOperationService"
    
    func execute(completion: @escaping () -> Void) {
        completion()
    }
    
}
