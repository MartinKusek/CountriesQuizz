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
    
    var rightAnswer = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        
    }
    
    func callToViewModelForUIUpdate() {
        self.countriesViewModel = CountriesViewModel()
        self.countriesViewModel.bindCountriesViewModelToController = {
            self.updateUI()
        }
    }
    
     //MARK: - Answer Button Pressed
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = countriesViewModel.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
            switch rightAnswer {
                case "A": A.backgroundColor = UIColor.green
                case "B": B.backgroundColor = UIColor.green
                case "C": C.backgroundColor = UIColor.green
            default:
                D.backgroundColor = UIColor.green
            }
        }
        
        if !countriesViewModel.nextQuestion() {
            performSegue(withIdentifier: "capitalToResult", sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (_) in
            self.updateUI()
        }
    }
    
     //MARK: - Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)

            if let secondViewController = segue.destination as? ResultViewController {
                secondViewController.score = countriesViewModel.score
                secondViewController.isFrom = "capitalsVC"
                secondViewController.modalPresentationStyle = .fullScreen
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
                    self.rightAnswer = "A"
                
            case 1: self.B.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                    self.rightAnswer = "B"
                
            case 2: self.C.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                    self.rightAnswer = "C"
                
            case 3: self.D.setTitle(self.countriesViewModel.getRightAnswer(), for: .normal)
                    self.rightAnswer = "D"
                
            default:
                return print("error in switch")
            }
            
            self.A.tintColor = UIColor(rgb: 0xE3FDFD)
            self.A.backgroundColor = .clear
            self.A.layer.cornerRadius = 25
            self.A.layer.borderWidth = 4
            self.A.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor
            
            self.B.tintColor = UIColor(rgb: 0xE3FDFD)
            self.B.backgroundColor = .clear
            self.B.layer.cornerRadius = 25
            self.B.layer.borderWidth = 4
            self.B.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor
            
            self.D.tintColor = UIColor(rgb: 0xE3FDFD)
            self.D.backgroundColor = .clear
            self.D.layer.cornerRadius = 25
            self.D.layer.borderWidth = 4
            self.D.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor
            
            self.C.tintColor = UIColor(rgb: 0xE3FDFD)
            self.C.backgroundColor = .clear
            self.C.layer.cornerRadius = 25
            self.C.layer.borderWidth = 4
            self.C.layer.borderColor = UIColor(rgb: 0xA6E3E9).cgColor
            
            
            ///Score
            self.scoreLabel.text = self.countriesViewModel.getScore()
            
            ///ProgressBar
            self.progressBar.progress = self.countriesViewModel.getProgress()
        }
    }

}
