//
//  ResultViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var isFrom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScore()
    }
    
    func updateScore() {
        scoreLabel.text = "\(score) / 10"
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
