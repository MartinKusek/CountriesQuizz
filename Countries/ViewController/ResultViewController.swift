//
//  ResultViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var score = 0
    var isFrom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
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
    }
    
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
