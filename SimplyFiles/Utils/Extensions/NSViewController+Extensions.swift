//
//  NSViewController+Extensions.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import AppKit

extension NSViewController {
    
    static func instantiateFromStoryboard<T: NSViewController>(type: T.Type, storyboardName: String? = nil) -> T? {
        let storyboardName = storyboardName ?? String(describing: type).replacingOccurrences(of: "Controller", with: "")
        let storyboard = NSStoryboard(name: storyboardName, bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateInitialController() as? T else {
            Log("Failed to initialize \(type)")
            return nil
        }
        
        return viewController
    }
    
}
