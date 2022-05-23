//
//  DifficultyViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 23.05.2022.
//

import UIKit

class DifficultyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let nextViewController: ViewController = ViewController()


    @IBAction func difficultySet(_ sender: UIButton) {
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.present(nextViewController, animated: true, completion: nil)
        
        print(sender.titleLabel!.text!)
        switch sender.titleLabel!.text!{
        case "Easy":
            
            print("Easy")
        
        case "Medium":
            print("Medium")
        
        case "Hard":
            print("Hard")
        
        default:
            break
        }
    }
    
}
