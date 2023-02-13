//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Martin Kusek on 24.10.2022..
//

import UIKit

class CountriesViewModel {
    
    
    
    var rightAnswer = 0
    
    var questionNumber = 0
    var score = 0
    
    
    enum BindableProperties {
        case countries
    }
    var bind: ((BindableProperties) -> Void)?
    
    var countries: [CountriesModel]? {
        didSet {
            print("setan u brainu", countries)
        }
    }
    
    
    func getQuestion () -> String {
        print(countries)
        rightAnswer = Int.random(in: 0...countries!.count)
        print(countries![rightAnswer].name)
        return (countries![rightAnswer].name)
    }
    
    func getRightAnswers (coutries: [CountriesModel]) -> String {
        print(coutries[rightAnswer].capital)
        return coutries[rightAnswer].capital
    }
    
    func getRandomAnswers (coutries: [CountriesModel]) -> String {
        return coutries[Int.random(in: 0...coutries.count)].capital
    }    
}

