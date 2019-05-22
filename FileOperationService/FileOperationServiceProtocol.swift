//
//  FileOperationServiceProtocol.swift
//  FileOperationService
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

@objc(FileOperationServiceProtocol) protocol FileOperationServiceProtocol {
    func execute(completion: @escaping () -> Void)
}
