//
//  ViewController.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import AppKit

class MainViewController: ModelViewController<MainViewModel>, MainView, NSWindowDelegate {
    
    @IBOutlet private var tableView: NSTableView!
    @IBOutlet private var operationsPopUpButton: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpOperationsPopUpButton()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        setUpWindow()
    }
    
    @IBAction func addFiles(_ sender: NSButton) {
        guard let window = view.window else { return }
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = true
        
        panel.beginSheetModal(for: window) { [weak self] (result) in
            switch result {
            case .OK:
                for fileURL in panel.urls {
                    self?.viewModel.addFile(withURL: fileURL)
                }
            default:
                break
            }
        }
    }
    
    @IBAction func executeOperation(_ sender: NSButton) {
        viewModel.executeActiveOperation()
    }
    
    @IBAction func changeActiveOperation(_ sender: NSPopUpButtonCell) {
        viewModel.setActiveOperation(withIndex: sender.indexOfSelectedItem)
    }
    
    // MARK: - ViewModelView
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Private
    
    private func setUpWindow() {
        view.window?.delegate = self
        view.window?.minSize = NSSize(width: 360, height: 200)
    }
    
    private func setUpOperationsPopUpButton() {
        operationsPopUpButton.removeAllItems()
        operationsPopUpButton.addItems(withTitles: viewModel.fileOperations.map({$0.name}))
    }

}

// MARK: - TableView DataSource & Delegate

extension MainViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    private enum CellIdentifier {
        static let fileName = NSUserInterfaceItemIdentifier(rawValue: "FileNameCell")
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.addedFiles.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: CellIdentifier.fileName, owner: nil) as? NSTableCellView {
            if tableColumn == tableView.tableColumns[0] {
                cell.textField?.stringValue = viewModel.addedFiles[row].name
            } else if tableColumn == tableView.tableColumns[1] {
                cell.textField?.stringValue = viewModel.addedFiles[row].status ?? ""
            }

            return cell
        }
        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        viewModel.selectedFiles = []
        
        for selectedRow in tableView.selectedRowIndexes {
            viewModel.selectedFiles.append(viewModel.addedFiles[selectedRow])
        }
    }
    
}

