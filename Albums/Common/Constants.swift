//
//  Constants.swift
//  Albums
//
//  Created by Nitish.kumar on 28/03/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Colors {
        static let appStandardColor     =   UIColor(red: 200.0/255.0, green: 227.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        static let headerColor     =   UIColor(red: 180.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        static let primaryColor     =   UIColor(red: 18.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
    }
    
    struct NetworkError {
        static let inValidURLError      =   "URL is not valid."
        static let internetConnectionError   =   "you are offline, please connect to the internet."
        static let genericError         =   "something went wrong, please try after some time."
    }
    
    struct DateFormat {
        static let serverDateFormat     =   "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }
}

var keyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
}

