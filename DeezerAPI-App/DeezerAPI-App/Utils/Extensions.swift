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
    
    func removeDuplicateElements(arr: [String]) -> [String] {
       var uniqueElements: [String] = []
       for x in arr {
          if !uniqueElements.contains(x) {
             uniqueElements.append(x)
          }
       }
       return uniqueElements
    }
}


extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
