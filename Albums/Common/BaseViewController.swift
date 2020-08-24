//
//  BaseViewController.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, StoryboardProtocol {
     override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    func bindViewModel() {
        
    }
    
    func configureUI() {
        
    }

}
