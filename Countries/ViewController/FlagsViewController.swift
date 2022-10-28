//
//  FlagsViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class FlagsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var A: UIImageView!
    @IBOutlet weak var B: UIImageView!
    @IBOutlet weak var C: UIImageView!
    @IBOutlet weak var D: UIImageView!
    
    private var flagsViewModel: FlagsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate() {
        self.flagsViewModel = FlagsViewModel()
        self.flagsViewModel.bindFlagsViewModelToController = {
            self.updateUI()
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            print(self.flagsViewModel.getRandomAnswers(), "RANDOM ANSWER URL")
            
            self.questionLabel.text = self.flagsViewModel.getQuestion()
            
            self.A.downloaded(from: "https://robohash.org/123.png")
            
            self.B.downloaded(from: self.flagsViewModel.getRandomAnswers())
            self.C.downloaded(from: self.flagsViewModel.getRandomAnswers())
            self.D.downloaded(from: self.flagsViewModel.getRandomAnswers())
        }
    }
    
}
