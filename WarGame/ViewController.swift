//
//  ViewController.swift
//  WarGame
//
//  Created by Student30 on 13/06/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{
    
    let LOG: Double = 34.817549168324334
    
    @IBOutlet weak var startGame :UIButton!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var enterName: UITextField!
    
    @IBOutlet weak var userName: UILabel!
    
    var isLocation = false
    
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init location
        locationManager = CLLocationManager()
        getCurrentLocation()
        //handel text fild
        //enterName.becomeFirstResponder()
        enterName.delegate = self
    }
    
    func getCurrentLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
            
    }
   

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            //get Current Location
            let userLocation = locations[0] as CLLocation
            //get longutide
         let currentLog = userLocation.coordinate.longitude
            isLocation = true
        
             
            groupDecide(curLog: currentLog)
        }
    
    func groupDecide(curLog: Double){
        var isRight : Bool?
        print("curLog: \(curLog)")
        if curLog > LOG{
            rightImage.isHidden = false
            leftImage.isHidden = true
            isRight = true
        }else{
            leftImage.isHidden = false
            rightImage.isHidden = true
            isRight = false
        }
    }
    
    @IBAction func play(_ sender:UIButton){
        enterName.resignFirstResponder()
        if isLocation {
            if let textName = self.enterName.text {
                
                if textName == "" {
                    print("is nil")
                    
                    return
                }
                 
                else {
                    //have the location and the name can go to the game screen
                    print("\(textName)")
                    
                    let nextScreen = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
                    nextScreen.modalPresentationStyle = .fullScreen
                    present( nextScreen, animated: true)
                    
                    
                }
            }
            else{
                //nees to save the name and the side and pass it to the next screen
                print("is nil")
                //maybe show an error massage
                return
            }
        } else{
            print("\(isLocation)")
            return
        }
    }
        
}
    
// handle the Done button clicked on the keyboard
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
       /* if let text = textField.text{
            print("\(text)")
        }*/
        return true
    }
}
    

