//
//  FlagsViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class FlagsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var flagsViewModel: FlagsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.flagsViewModel = FlagsViewModel()
        self.flagsViewModel.bindFlagsViewModelToController = {
            self.updateUI()
        }
    }
 
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        print(userAnswer!, "USER ANSWER")
        let userGotItRight = flagsViewModel.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if !flagsViewModel.nextQuestion() {
            performSegue(withIdentifier: "capitalToResult", sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (_) in
            self.updateUI()
        }
    }
        

    //MARK: - UI Changes
    
    func updateUI() {
        
        DispatchQueue.main.async {
            
            ///Question label
            self.questionLabel.text = self.flagsViewModel.getQuestion()
            ///Buttons
            
            self.A.setTitle(self.flagsViewModel.getRandomAnswers(), for: .normal)
            self.B.setTitle(self.flagsViewModel.getRandomAnswers(), for: .normal)
            self.C.setTitle(self.flagsViewModel.getRandomAnswers(), for: .normal)
            self.D.setTitle(self.flagsViewModel.getRandomAnswers(), for: .normal)

            self.A.backgroundColor = UIColor.clear
            self.B.backgroundColor = UIColor.clear
            self.C.backgroundColor = UIColor.clear
            self.D.backgroundColor = UIColor.clear
            
            let rightButton = Int.random(in: 0...3)
            switch rightButton {
            case 0: self.A.setTitle(self.flagsViewModel.getRightAnswer(), for: .normal)
                
            case 1: self.B.setTitle(self.flagsViewModel.getRightAnswer(), for: .normal)
                
            case 2: self.C.setTitle(self.flagsViewModel.getRightAnswer(), for: .normal)
                
            case 3: self.D.setTitle(self.flagsViewModel.getRightAnswer(), for: .normal)
            default:
                return print("error in switch")
            }
            
            ///Score
            self.scoreLabel.text = self.flagsViewModel.getScore()
            
            ///ProgressBar
            self.progressBar.progress = self.flagsViewModel.getProgress()
        }
    }
    
}
