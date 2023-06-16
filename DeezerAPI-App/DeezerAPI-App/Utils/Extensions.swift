//
//  Extensions.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation
import UIKit
import JGProgressHUD

extension UIViewController {
    
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show: Bool) {
        view.endEditing(true)
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }

}

extension String {
    func chanceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self) ?? Date()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let convertedDateString = dateFormatter.string(from: date)
            return (convertedDateString)
        
    }
}

extension Int {
    func timeString() -> String {
        let minute = Int(self) / 60 % 60
        let second = Int(self) % 60
        
        // return formated string
        return String(format: "%02i:%02i", minute, second)
    }
}
