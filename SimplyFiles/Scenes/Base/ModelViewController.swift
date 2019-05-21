//
//  ModelViewController.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import AppKit

class ModelViewController<T: ViewModel>: NSViewController, ViewModelView {
    
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.baseView = self
    }
    
}

extension ModelViewController {
    
    class func instantiateFromStoryboard(viewModel: T) -> Self {
        guard let viewController = NSViewController.instantiateFromStoryboard(type: self) else {
            fatalError()
        }
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}
