//
//  FlagsViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class FlagsViewController: UIViewController {
    
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
        }
    }
    
}
