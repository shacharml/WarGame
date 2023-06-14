//
//  GameViewController.swift
//  WarGame
//
//  Created by Student30 on 14/06/2023.
//

import UIKit

class GameViewController: UIViewController {

    var name: String?
    var isRight: Bool?
    var sRight:Int = 0
    var sLeft:Int = 0
    let cardsImages = ["card8" , "card7" , "card10", "card6", "card9", "card4", "card5", "card2", "card3", "card1"]
    
    @IBOutlet weak var nameRight: UILabel!
    @IBOutlet weak var nameLeft: UILabel!
    @IBOutlet weak var scoureRight: UILabel!
    @IBOutlet weak var scoureLeft: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageLeftt: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(patternImage: UIImage (named: "forest.jpg")!)
        initLabels()
        playGame()
    }

    func initLabels(){
        
        if (isRight != nil) {
            if (isRight == true){
                //on the right side
                nameRight.text = name
                nameLeft.text = "Phone"
            }else{
                //on the left Side
                nameLeft.text = name
                nameRight.text = "Phone"
                
            }
            scoureRight.text = String(format: "%d", sRight)
            scoureLeft.text = String(format: "%d", sLeft)
            
        }
    }
    
    func playGame(){
        timer.isHidden = false
        start(counterTurns: 0)
    }
    
    func start(counterTurns : Int){
        if counterTurns < 10 {
            var timerSec = 3
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
                if timerSec > 0{
                    self.timer.text = "\(timerSec)"
                } else {
                    self.timer.text = ""
                }
                
                timerSec -= 1
                
                if timerSec < 0 {
                    //stop the timer
                    timer.invalidate()
                    //get the randoms number of the card to show
                    let randomRight = Int.random(in: 0..<self.cardsImages.count)
                    let randomLeft = Int.random(in: 0..<self.cardsImages.count)
                    
                    //init the pictures in the ui
                    self.imageLeftt.image = UIImage(named: self.cardsImages[randomLeft])
                    self.imageRight.image = UIImage(named: self.cardsImages[randomRight])
                    
                    
                    //check from the card who is stronget to win
                    if randomLeft > randomRight {
                        self.sLeft += 1
                        self.scoureLeft.text = String(format: "%d", self.sLeft)
                    }else if randomLeft < randomRight {
                        self.sRight += 1
                        self.scoureRight.text = String(format: "%d", self.sRight)
                    }
                    //if the same number  ->  dont do nothing
                    //next turn
                    self.start(counterTurns: counterTurns + 1)
                }
            }
        }
        else{
                //the counter turn> 10 the game is finish
                let nextScreen = storyboard?.instantiateViewController(identifier: "finishGame") as! FinishViewController
                nextScreen.modalPresentationStyle = .fullScreen
                
                //Check who win
                if sLeft > sRight{
                    nextScreen.scoure = sLeft
                    nextScreen.name = nameLeft.text
                } else if sLeft < sRight{
                    nextScreen.scoure = sRight
                    nextScreen.name = nameRight.text
                } else{
                    nextScreen.scoure = 0
                    nextScreen.name = "tie"
                }
                
                present( nextScreen, animated: true , completion: nil)
          }
    }
    
}
