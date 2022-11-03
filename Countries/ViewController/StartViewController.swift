//
//  StartViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var flagsButton: UIButton!
    @IBOutlet weak var capitalCitiesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }
    
    
    func setUpButtons() {
        
        flagsButton.tintColor = UIColor(rgb: 0x71C9CE)
        flagsButton.backgroundColor = .clear
        flagsButton.layer.cornerRadius = 25
        flagsButton.layer.borderWidth = 6
        flagsButton.backgroundColor = UIColor(rgb: 0xE3FDFD)
        flagsButton.layer.borderColor = UIColor(rgb: 0xE3FDFD).cgColor
        
        capitalCitiesButton.tintColor = UIColor(rgb: 0x71C9CE)
        capitalCitiesButton.backgroundColor = .clear
        capitalCitiesButton.layer.cornerRadius = 25
        capitalCitiesButton.layer.borderWidth = 6
        capitalCitiesButton.backgroundColor = UIColor(rgb: 0xE3FDFD)
        capitalCitiesButton.layer.borderColor = UIColor(rgb: 0xE3FDFD).cgColor
    }
    
     //MARK: - Button actions
    
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
