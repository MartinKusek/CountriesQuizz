//
//  FlagsViewModel.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class FlagsViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var flagsData : [FlagModel]! {
        didSet {
            self.bindFlagsViewModelToController()
        }
    }
    
    var bindFlagsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetData()
    }
    
    func callFuncToGetData() {
        self.apiService.fetchFlags() { (flagsData) in
            self.flagsData = flagsData
        }
    }
    
    var rightRandomNumber = 0
    var score = 0
    var questionCount = 0
    
    var callSegue = false

    func getQuestion() -> String {
        rightRandomNumber = Int.random(in: 0...flagsData.count-1)
        var countryName = flagsData[rightRandomNumber].name
        
        if flagsData[rightRandomNumber].name.isEmpty || flagsData[rightRandomNumber].url.isEmpty {
            rightRandomNumber = Int.random(in: 0...flagsData.count-1)
            countryName = flagsData[rightRandomNumber].name
        }
        
        let questionString = "What is the capital city of \(countryName)?"
        return questionString
    }
    
    func getRightAnswer() -> String {
        let answer = flagsData[rightRandomNumber].url
        print(answer, "TOCAN")
        return answer
    }
    
    func getRandomAnswers() -> String {
        var randNumb = Int.random(in: 0...flagsData.count-1)
        var answer = flagsData[randNumb].url
        
        if answer.isEmpty {
            randNumb = Int.random(in: 0...flagsData.count-1)
            answer = flagsData[randNumb].url
        }
        return answer
    }
    
    func getScore() -> String {
        let scoreString = "Score: \(score)"
        return scoreString
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == flagsData[rightRandomNumber].url {
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
