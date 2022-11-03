//
//  ResultViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class ResultViewController: UIViewController {

    ///Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var welcomeScreenButton: UIButton!
    
    ///Variables
    var score = 0
    var isFrom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
     //MARK: - UI Changes
    
    func updateUI() {
        scoreLabel.text = "\(score) / 10"
        
        switch score {
        case 4...6:
            messageLabel.text = "Not bad!"
        case 7...9:
            messageLabel.text = "Good job!"
        case 10:
            messageLabel.text = "Perfect score!"
        default:
            messageLabel.text = "You can do better!"
        }
        ///Buttons
        tryAgainButton.tintColor = UIColor(rgb: 0x71C9CE)
        tryAgainButton.backgroundColor = .clear
        tryAgainButton.layer.cornerRadius = 25
        tryAgainButton.layer.borderWidth = 6
        tryAgainButton.backgroundColor = UIColor(rgb: 0xE3FDFD)
        tryAgainButton.layer.borderColor = UIColor(rgb: 0xE3FDFD).cgColor
        
        welcomeScreenButton.tintColor = UIColor(rgb: 0x71C9CE)
        welcomeScreenButton.backgroundColor = .clear
        welcomeScreenButton.layer.cornerRadius = 25
        welcomeScreenButton.layer.borderWidth = 6
        welcomeScreenButton.backgroundColor = UIColor(rgb: 0xE3FDFD)
        welcomeScreenButton.layer.borderColor = UIColor(rgb: 0xE3FDFD).cgColor
    }
    
     //MARK: - Button actions
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        if isFrom == "flagsVC" {
            performSegue(withIdentifier: "resultToFlags", sender: self)
        } else {
            performSegue(withIdentifier: "resultToCapital", sender: self)
        }
    }
    
    @IBAction func welcomeScreenPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToStart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)
            segue.destination.modalPresentationStyle = .fullScreen
        }
}
