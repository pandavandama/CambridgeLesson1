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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if ViewController.getResult(ViewController) == true{
//            resultSymbol.text = "❤️"
//        }else{
//            resultSymbol.text = "❤️‍🩹"
//        }
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    @IBAction func quitAction(_ sender: UIButton) {
        print("Quit")
        exit(0)
    }
    @IBAction func showMainView(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
