//
//  Extension.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = self
        return formatter
    }
    
    func toDate() -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}

extension Date {
    func toString() -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let strDate = formatter1.string(from: self)
        return strDate
    }
}

extension UIImageView {
    func setImage(with imageUrl : String) {
        imageDownloader.downloadImage(imageURL: imageUrl) { (image, error) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

var isTestingEnvEnabled : Bool {
    return (ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil)
}

extension UIViewController {
    func showAlert(_ message: String?){
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "Ok", style: .default, handler: { (alertAction) in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}


extension Encodable {
    func encode()  -> Data? {
        let encoder =   JSONEncoder()
        let format  =   Constants.DateFormat.serverDateFormat
        JSONEncoder().dateEncodingStrategy = .formatted(format.dateFormatter())
        
        var data : Data?
        do {
             data = try encoder.encode(self)
        } catch {
            assertionFailure(error.localizedDescription)
        }
        return data
    }
}

extension UIView {
    func setGradient(with startColor : UIColor, endColor : UIColor) {
        let gradientColor = CAGradientLayer()
        gradientColor.colors = [startColor.cgColor, endColor.cgColor]
        gradientColor.locations = [0.0 , 1.0]
        gradientColor.frame = self.bounds
        self.layer.insertSublayer(gradientColor, at: 0)
    }
}


