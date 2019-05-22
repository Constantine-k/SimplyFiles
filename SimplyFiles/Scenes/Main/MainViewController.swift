//
//  ViewController.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import AppKit

class MainViewController: ModelViewController<MainViewModel>, MainView, NSWindowDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        setUpWindow()
    }
    
    private func setUpWindow() {
        view.window?.delegate = self
        view.window?.minSize = NSSize(width: 360, height: 200)
    }

}

