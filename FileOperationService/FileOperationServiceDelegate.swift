//
//  FileOperationServiceDelegate.swift
//  FileOperationService
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

class FileOperationServiceDelegate: NSObject, NSXPCListenerDelegate {
    
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let exportedObject = FileOperationService()
        newConnection.exportedInterface = NSXPCInterface(with: FileOperationServiceProtocol.self)
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        
        return true
    }
    
}
