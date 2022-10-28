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
        
        let questionString = "What is the capital city of \(countryName)?"
        return questionString
    }
    
    func getRightAnswer() -> String {
        let answer = countriesData[rightRandomNumber].capital
        print(answer, "TOCAN")
        return answer
    }
    
    func getRandomAnswers() -> String {
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

