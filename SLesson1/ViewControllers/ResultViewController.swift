//
//  ResultViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 21.05.2022.
//

import UIKit

class ResultViewController:
                                
                                
                                
    UIViewController {
    
    @IBOutlet weak var resultSymbol: UILabel!
    
    @IBOutlet weak var resultHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dataApp.result{
            resultSymbol.text = "❤️"
            resultHeader.text = "You win!"
        }else{
            resultSymbol.text = "💔"
            resultHeader.text = "Try again..."
        }

    }
    
    
    
    @IBAction func quitAction(_ sender: UIButton) {
        print("Quit")
        exit(0)
    }
    @IBAction func showMainView(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
