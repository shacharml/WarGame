//
//  FinishViewController.swift
//  WarGame
//
//  Created by Student30 on 14/06/2023.
//

import UIKit

class FinishViewController: UIViewController {
    
    var name: String?
    var scoure: Int?
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var winnerScore: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()

        if name != nil{
            if name == "tie"{
                winnerName.text = "tie"
                winnerScore.isHidden = true
            } else{
                winnerName.text = name
                if let sco = scoure {
                    winnerScore.text = String(format: "%d", sco )}
            }
        }
    }

    
    @IBAction func backToMenu(_ sender:UIButton){
        let nextScreen = storyboard?.instantiateViewController(identifier: "main") as! ViewController
        nextScreen.modalPresentationStyle = .fullScreen
            present( nextScreen, animated: true , completion: nil)
        
    }
}
