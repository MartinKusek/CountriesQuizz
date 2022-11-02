//
//  StartViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var startView: UIView!
    @IBOutlet weak var flagsButton: UIButton!
    @IBOutlet weak var capitalCitiesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagsButton.tintColor = UIColor(rgb: 0xE3FDFD)
        flagsButton.backgroundColor = .clear
        flagsButton.layer.cornerRadius = 25
        flagsButton.layer.borderWidth = 6
        flagsButton.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor
        
        capitalCitiesButton.tintColor = UIColor(rgb: 0xE3FDFD)
        capitalCitiesButton.backgroundColor = .clear
        capitalCitiesButton.layer.cornerRadius = 25
        capitalCitiesButton.layer.borderWidth = 6
        capitalCitiesButton.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor

    }
    
    @IBAction func flagsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToFlags", sender: self)
    }
    @IBAction func capitalCitysPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToCapital", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)
            segue.destination.modalPresentationStyle = .fullScreen
        }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
