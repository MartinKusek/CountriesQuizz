//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Martin Kusek on 24.10.2022..
//

import UIKit

class CountriesViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var countriesData : [CountriesModel]! {
        didSet {
            self.bindCountriesViewModelToController()
        }
    }
    
    var bindCountriesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetData()
    }
    
    func callFuncToGetData() {
        self.apiService.fetchCountries() { (countriesData) in
            self.countriesData = countriesData
        }
    }
    
    var rightRandomNumber = 0
    var score = 0
    var questionCount = 0
    var callSegue = false

    func getQuestion() -> String {
        rightRandomNumber = Int.random(in: 0...countriesData.count-1)
        var countryName = countriesData[rightRandomNumber].name
        
        if countriesData[rightRandomNumber].name.isEmpty || countriesData[rightRandomNumber].capital.isEmpty {
            rightRandomNumber = Int.random(in: 0...countriesData.count-1)
            countryName = countriesData[rightRandomNumber].name
        }
        
        let questionString = "\(countryName)?"
        return questionString
    }
    
    func getRightAnswer() -> String {
        let answer = countriesData[rightRandomNumber].capital
        return answer
    }
    
    func getRandomAnswer() -> String {
        var randNumb = Int.random(in: 0...countriesData.count-1)
        var answer = countriesData[randNumb].capital
        
        if answer.isEmpty {
            randNumb = Int.random(in: 0...countriesData.count-1)
            answer = countriesData[randNumb].capital
        }
        return answer
    }
    
    func getScore() -> String {
        let scoreString = "Score: \(score)"
        return scoreString
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == countriesData[rightRandomNumber].capital {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func nextQuestion() -> Bool {
        if questionCount + 1 < 10 {
            questionCount += 1
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        return Float(questionCount + 1) / 10.00
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
