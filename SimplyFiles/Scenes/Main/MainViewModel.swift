//
//  MainViewModel.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

protocol MainView: ViewModelView {
    func updateTableView()
}

class MainViewModel: ViewModel {
    
    let fileOperations = FileOperations().list
    
    private(set) var addedFileURLs = [URL]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    private var activeOperation: FileOperation
    
    private var view: MainView? { return baseView as? MainView }
    
    override init() {
        guard fileOperations.count > 0 else { fatalError() }
        activeOperation = fileOperations[0]
        
        super.init()
    }
    
    @discardableResult
    func setActiveOperation(withName activeOperationName: String) -> Bool {
        for fileOperation in fileOperations {
            if fileOperation.name == activeOperationName {
                activeOperation = fileOperation
                
                return true
            }
        }
        
        return false
    }
    
    func executeActiveOperation() {
        for fileURL in addedFileURLs {
            activeOperation.action(fileURL)
        }
    }
    
    func addFileURL(_ fileURL: URL) {
        addedFileURLs.append(fileURL)
    }
    
}
