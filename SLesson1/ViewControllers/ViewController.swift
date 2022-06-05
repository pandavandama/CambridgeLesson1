//
//  ViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 18.05.2022.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    var audioPlayer: AVAudioPlayer?
    var soundtrackPlayer: AVAudioPlayer?
    
    var soundsUrls: [URL?] = []
    
    @IBOutlet weak var touchLabel: UILabel!
    
    @IBOutlet var buttonsBigCollection: [UIButton]!
    
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    let tapticFeedback = UINotificationFeedbackGenerator()
    let emojiList = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
    var enableButtons = true
    var bigEmojiList: [String] = []
    var buttonsIndex: [Int] = []
    public var result: Bool!
    
    public var progressMax: Float = 0
    
    var tries: Int!{
        didSet{
            touchLabel.text = "Tries: \(tries!)"
            if tries<=0{
                lose()
            }
        }
    }
    
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
    
    var points = 0{
        didSet{
            if points>=emojiList.count{
                win()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soundsInit()
        
        do{
            soundtrackPlayer = try AVAudioPlayer(contentsOf: soundsUrls[5]!)
            soundtrackPlayer?.numberOfLoops = -1
            soundtrackPlayer!.play()
        }
        catch{
            
        }
        
        bigEmojiList.append(contentsOf: emojiList)
        bigEmojiList.append(contentsOf: emojiList)
        
        progressMax = Float(emojiList.count)
        myProgressView.progress = 0
        tries = dataApp.triesMax
        
        for button in buttonsBigCollection{
            button.setTitle("", for: .normal)
        }
        
    }
    
    func soundsInit(){
        
        var test1 = URL(fileURLWithPath: Bundle.main.path(forResource: "a1", ofType: "mp3")!)
        
        print(test1)
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "a1", ofType: "mp3")!))
        print(soundsUrls.count)
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "a2", ofType: "mp3")!))
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "a3", ofType: "mp3")!))
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "a4", ofType: "mp3")!))
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "a5", ofType: "mp3")!))
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "soundtrack", ofType: "mp3")!))
        soundsUrls.append(URL(fileURLWithPath: Bundle.main.path(forResource: "btn_click_sound", ofType: "mp3")!))
    }
    
    func playSoundtrack(){
        
    }
    
    func showNextViewController(){
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextViewController = storyboard.instantiateViewController(identifier: "resultView")
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    
    func clearAndShowResult(){
        showNextViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.clearButtons(buttons: self.buttonsBigCollection)
            self.emojiRandomizer()
            self.points = 0
            self.tries = 8
            self.soundtrackPlayer?.stop()
        }
    }
    
    func checkExact(buttons: [UIButton]) -> Bool{
        if buttons[0].currentTitle! == buttons[1].currentTitle!{
            points+=1
            myProgressView.progress += 1/Float(emojiList.count)
            print(myProgressView.progress)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundsUrls[0]!)
                audioPlayer!.play()
            }
            catch{
                
            }
            return true
        }else{
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundsUrls[Int.random(in: 1...2)]!)
                audioPlayer!.play()
            }
            catch{
                
            }
        }
        return false
    }
    
    func clearButtons(buttons: [UIButton]){
        for button in buttons{
            clearButton(button)
        }
    }
    
    func flipButton(emoji: String, button: UIButton){
        button.currentTitle == emoji ? clearButton(button) : fillButton(emoji,button)
    }
    
    func clearButton(_ button: UIButton){
        button.setTitle("", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.07922752947, green: 0.4794213772, blue: 1, alpha: 1)
    }
    
    func fillButton(_ symbol: String,_ button: UIButton){
        button.setTitle(symbol, for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    }
    
    
    func emojiRandomizer(){
        for i in 0...bigEmojiList.count-1{
            bigEmojiList.swapAt(i, Int.random(in: 0..<bigEmojiList.count))
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
        do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundsUrls[6]!)
                    audioPlayer!.play()
                    
               } catch {
                  // couldn't load file :(
               }
    }
    
    
    @IBAction func myExitButton(_ sender: Any) {
        exit(0)
    }
    
    func win(){
        dataApp.result = true
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundsUrls[4]!)
            audioPlayer!.play()
        }
        catch{
            
        }
        
        
        clearAndShowResult()
    }
    func lose(){
        dataApp.result = false
        
        
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundsUrls[3]!)
            audioPlayer!.play()
        }
        catch{
            
        }
        clearAndShowResult()
    }
}
