//
//  Errors.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

class Errors : Error {
    var message : String?
    
    var localizedDescription: String? {
        return self.message
    }
    
    init(message : String?) {
        self.message    =   message
    }
}
