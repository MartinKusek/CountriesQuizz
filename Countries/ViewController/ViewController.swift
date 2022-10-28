//
//  ViewController.swift
//  Countries
//
//  Created by Martin Kusek on 23.10.2022..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var countriesViewModel: CountriesViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        
    }
    
     //MARK: - Answer Button Pressed
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = countriesViewModel.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        countriesViewModel.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (_) in
            self.updateUI()
        }
    }
    
    func callToViewModelForUIUpdate() {
        self.countriesViewModel = CountriesViewModel()
        self.countriesViewModel.bindCountriesViewModelToController = {
            self.updateUI()
        }
    }
    
     //MARK: - UI Changes
    
    func updateUI() {
        DispatchQueue.main.async {
            ///Question label
            self.questionLabel.text = self.countriesViewModel.getQuestion()
            ///Buttons
            self.A.setTitle(self.countriesViewModel.getRandomAnswers(), for: .normal)
            self.B.setTitle(self.countriesViewModel.getRandomAnswers(), for: .normal)
            self.C.setTitle(self.countriesViewModel.getRandomAnswers(), for: .normal)
            self.D.setTitle(self.countriesViewModel.getRandomAnswers(), for: .normal)
            
            self.A.backgroundColor = UIColor.clear
            self.B.backgroundColor = UIColor.clear
            self.C.backgroundColor = UIColor.clear
            self.D.backgroundColor = UIColor.clear
            
            let rightButton = Int.random(in: 0...3)
            switch rightButton {
            case 0: self.A.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                
            case 1: self.B.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                
            case 2: self.C.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                
            case 3: self.D.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
            default:
                return print("error in switch")
            }
            
            ///Score
            self.scoreLabel.text = self.countriesViewModel.getScore()
            
            ///ProgressBar
            self.progressBar.progress = self.countriesViewModel.getProgress()
        }
    }

}
