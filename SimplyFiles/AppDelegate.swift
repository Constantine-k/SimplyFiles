//
//  AppDelegate.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSStoryboard(name : "MainWindow", bundle: nil).instantiateInitialController() as? NSWindowController
        window.contentViewController = MainViewController.instantiateFromStoryboard(viewModel: MainViewModel())
        window.showWindow(self)
    }
    
}
