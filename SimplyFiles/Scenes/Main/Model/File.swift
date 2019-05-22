//
//  File.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/22/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

struct File {
    var url: URL
    var name: String {
        return url.lastPathComponent
    }
}
