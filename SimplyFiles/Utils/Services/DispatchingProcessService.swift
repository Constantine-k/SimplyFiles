//
//  DispatchingProcessService.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/23/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

class DispatchingProcessService {
    
    private lazy var connection: NSXPCConnection = {
        let connection = NSXPCConnection(serviceName: FileOperationService.serviceName)
        connection.remoteObjectInterface = NSXPCInterface(with: FileOperationServiceProtocol.self)
        connection.resume()
        
        return connection
    }()
    
    deinit {
        connection.invalidate()
    }
    
    func execute(completion: @escaping () -> Void) {
        let service = connection.remoteObjectProxyWithErrorHandler { error in
            print("Received error:", error)
            } as? FileOperationServiceProtocol
        
        service?.execute(completion: completion)
    }
    
}
