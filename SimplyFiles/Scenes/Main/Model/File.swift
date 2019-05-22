//
//  File.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/22/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

class File {
    
    var url: URL
    var md5: String?
    var status: String?
    var name: String {
        return url.lastPathComponent
    }
    
    init(url: URL) {
        self.url = url
    }
    
}
