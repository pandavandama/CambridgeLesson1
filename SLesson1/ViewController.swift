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
    
    func getResult()->Bool{
        return self.getResult()
    }
    
    var enableButtons = true
    let emojiList = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
    var bigEmojiList: [String] = []
    var buttonsIndex: [Int] = []
    public bvar result: Bool!
    
    var tries = 8{
        didSet{
            touchLabel.text = "Tries: \(tries)"
            if tries<=0{
                result = false
                clearAndShowResult()
            }
        }
    }
    let tapticFeedback = UINotificationFeedbackGenerator()
    
    var pairButtons: [UIButton] = []{
        
        didSet{
            
            
            if pairButtons.count == 2{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    
                    if !self.checkExact(buttons: self.pairButtons){
                        self.clearButtons(buttons: self.pairButtons)
                        self.tries-=1
                    }else{
                        
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
    
    func showViewController(){
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var secondVC = storyboard.instantiateViewController(identifier: "resultView")
     show(secondVC, sender: self)
    }
    
    var points = 0{
        didSet{
            
            if points>=emojiList.count{
                result = true
                clearAndShowResult()
            }
        }
    }
    
    func clearAndShowResult(){
       
        showViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.clearButtons(buttons: self.buttonsBigCollection)
            self.emojiRandomizer()
            self.points = 0
        }
    }
    
    func checkExact(buttons: [UIButton]) -> Bool{
        if buttons[0].currentTitle! == buttons[1].currentTitle!{
            points+=1
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
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if enableButtons{
            tapticFeedback.notificationOccurred(.success)
            if let buttonIndex = buttonsBigCollection.firstIndex(of: sender) {
                
                if sender.currentTitle == "" {
                    flipButton(emoji: bigEmojiList[buttonIndex], button: sender)
                    pairButtons.append(sender)
                }
                else{
                    
                }
                
                
                
            }
        }
//        showViewController()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bigEmojiList.append(contentsOf: emojiList)
        bigEmojiList.append(contentsOf: emojiList)
        
        
        
        for button in buttonsBigCollection{
            button.setTitle("", for: .normal)
        }
        
        
    }
    
    func emojiRandomizer(){
        for i in 0...bigEmojiList.count-1{
            bigEmojiList.swapAt(i, Int.random(in: 0..<bigEmojiList.count))
        }
    }
    
    

    
}

