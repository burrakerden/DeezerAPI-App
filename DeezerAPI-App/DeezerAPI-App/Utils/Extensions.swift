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


//
//
//
//extension ListenReadViewController {
//    
//    @objc func playButtonTapped(_ sender: UIButton) {
//        let previouslySelectedIndex = selectedButtonIndex
//        let newSelectedIndex = sender.tag
//
//        if previouslySelectedIndex != newSelectedIndex {
//            if lastSelectedButtonIndex != newSelectedIndex {
//                stopAudio()
//                print("STOP")
//            }
//            if let music = podcastList?[newSelectedIndex].music {
//                if isPaused {
//                    print("RESUME")
//                    resumeAudio()
//                }else {
//                    print("PLAY")
//                    lastSelectedButtonIndex = newSelectedIndex
//                    playAudio(url: music)
//                    sliderImage.setUrl(string: podcastList?[newSelectedIndex].image)
//                }
//            }else{
//                print("-----")
//            }
//            selectedButtonIndex = newSelectedIndex
//            let indexPathsToUpdate = [IndexPath(row: newSelectedIndex, section: 0), IndexPath(row: previouslySelectedIndex ?? -1, section: 0)].filter { $0.row >= 0 }
//            listenTableView.reloadRows(at: indexPathsToUpdate, with: .none)
//        } else {
//            print("PAUSE")
//            pauseAudio()
//            selectedButtonIndex = nil
//            listenTableView.reloadRows(at: [IndexPath(row: newSelectedIndex, section: 0)], with: .none)
//        }
//        sender.isSelected = selectedButtonIndex == sender.tag
//
//    }
//
//    @objc func resetButtons(sender: UIButton) {
//        stopAudio()
//        if let selectedIndexPath = listenTableView.indexPathForSelectedRow {
//            selectedButtonIndex = nil
//            listenTableView.reloadRows(at: [selectedIndexPath], with: .none)
//        }
//    }
//  
//}
//
//extension ListenReadViewController: PodcastTableViewCellOutput {
//    func didPlayButton(index: IndexPath) {
//        print("")
//    }
//    
//    func didStopButton(index: IndexPath) {
//        print("")
//    }
//    
//    
//}
