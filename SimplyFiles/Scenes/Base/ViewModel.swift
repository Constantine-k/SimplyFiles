//
//  ViewModel.swift
//  SimplyFiles
//
//  Created by Konstantin Konstantinov on 5/21/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

protocol ViewModelView: class {}

class ViewModel {
    
    weak var baseView: ViewModelView?
    
}
