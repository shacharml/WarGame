//
//  GameViewController.swift
//  WarGame
//
//  Created by Student30 on 14/06/2023.
//

import UIKit

class GameViewController: UIViewController {

    var name: String?
    var isRight: Bool??
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
    }
    
}
