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
    
    var fileOperations = [FileOperation]()
    
    var selectedFiles = [File]()
    
    private(set) var addedFiles = [File]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    private var activeOperation: FileOperation?
    
    private var view: MainView? { return baseView as? MainView }
    
    override init() {
        super.init()
        
        setUpFileOperations()
    }
    
    func setActiveOperation(withIndex activeOperationIndex: Int) {
        guard fileOperations.count > activeOperationIndex else { assert(false); return }
        
        activeOperation = fileOperations[activeOperationIndex]
    }
    
    func executeActiveOperation() {
        for file in selectedFiles {
            file.status = NSLocalizedString("Processing...", comment: "")
            view?.updateTableView()
            
            activeOperation?.action(file.url) { [weak self] (responseString) in
                // Delay for demonstration purposes
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    file.status = responseString
                    
                    self?.view?.updateTableView()
                })
            
            }
        }
    }
    
    func addFile(withURL fileURL: URL) {
        addedFiles.append(File(url: fileURL))
    }
    
    // MARK: - Private
    
    @discardableResult
    func removeFile(withURL fileURL: URL) -> Bool {
        for (fileIndex, addedFile) in addedFiles.enumerated() {
            if addedFile.url == fileURL {
                addedFiles.remove(at: fileIndex)
                
                return true
            }
        }
        
        return false
    }
    
    private func setUpFileOperations() {
        let removeFileOperation = FileOperation(name: NSLocalizedString("Remove", comment: "")) { [weak self] (url, completion) in
            self?.removeFile(withURL: url)
        }
        
        fileOperations = [removeFileOperation] + FileOperations().list
        
        activeOperation = fileOperations[0]
    }
    
}
