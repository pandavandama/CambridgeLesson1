//
//  DifficultyViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 23.05.2022.
//

import UIKit

class DifficultyViewController: UIViewController {
    
    
    @IBOutlet weak var myExitButton: UIButton!
    

    @IBAction func exitButtonClick(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func difficultySet(_ sender: UIButton) {
        
        switch sender.restorationIdentifier{
        case "buttonEasy":
            dataApp.triesMax = 25
        case "buttonMedium":
            dataApp.triesMax = 16
        case "buttonHard":
            dataApp.triesMax = 8
        default:
            return
        }
        showNextViewController()
    }
    
    @IBAction func showPersonsView(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "personsView")
//        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    func showNextViewController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "gameView")
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
}
