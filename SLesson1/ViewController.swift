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
    
    let emojiList = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
    var bigEmojiList: [String] = []
    var buttonsIndex: [Int] = []
    
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
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
        touches += 1
        if let buttonIndex = buttonsBigCollection.firstIndex(of: sender) {
            flipButton(emoji: bigEmojiList[buttonIndex], button: sender)
            
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

