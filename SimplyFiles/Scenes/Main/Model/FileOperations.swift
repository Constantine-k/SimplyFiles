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
    var action: (URL) -> Void
}

class FileOperations {
    var list = [
        FileOperation(name: NSLocalizedString("Delete", comment: ""), action: deleteOperationAction),
        FileOperation(name: NSLocalizedString("Copy", comment: ""), action: deleteOperationAction)
    ]
}

// FileOperation functions

fileprivate func deleteOperationAction(fileURL: URL) {
    print(fileURL)
}
