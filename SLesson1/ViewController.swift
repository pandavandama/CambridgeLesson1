//
//  ViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var touchLabel: UILabel!
    
    @IBOutlet var buttonsBigCollection: [UIButton]!
    
    var enableButtons = true
    let emojiList = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
    var bigEmojiList: [String] = []
    var buttonsIndex: [Int] = []
    
    let tapticFeedback = UINotificationFeedbackGenerator()
    
    var pairButtons: [UIButton] = []{
        
        didSet{
            
            
            if pairButtons.count == 2{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    
                    if !self.checkExact(buttons: self.pairButtons){
                        self.clearButtons(buttons: self.pairButtons)
                    }
                    
                    
                    self.enableButtons = true
                    self.pairButtons = []
                }
            }
            
            if pairButtons.count>=2{
                enableButtons = false
            }
        }
    }
    
    var touches = 0{
        didSet{
            touchLabel.text = "Points: \(touches)"
        }
    }
    
    func checkExact(buttons: [UIButton]) -> Bool{
        if buttons[0].currentTitle! == buttons[1].currentTitle!{
            touches+=1
            return true
        }
        return false
    }
    
    func clearButtons(buttons: [UIButton]){
        for button in buttons{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.07922752947, green: 0.4794213772, blue: 1, alpha: 1)
        }
    }
    
    func flipButton(emoji: String, button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.07922752947, green: 0.4794213772, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }

    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {

        if enableButtons{
            tapticFeedback.notificationOccurred(.success)
            if let buttonIndex = buttonsBigCollection.firstIndex(of: sender) {
                
                flipButton(emoji: bigEmojiList[buttonIndex], button: sender)
                
                pairButtons.append(sender)
            }
        }
        
        
        
    }
    
    
    func buttonsRandom(emojiList: [String]){
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigEmojiList.append(contentsOf: emojiList)
        bigEmojiList.append(contentsOf: emojiList)
        
        print(bigEmojiList)
        
        for i in 0...bigEmojiList.count-1{
            bigEmojiList.swapAt(i, Int.random(in: 0..<bigEmojiList.count))
        }
        
        print(bigEmojiList)
        // Do any additional setup after loading the view.
    }

}

