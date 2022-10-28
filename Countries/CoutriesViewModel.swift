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
    
    //treba mi jos jedna varijabla koja broji koliko pitanja je postavljeno, od 0 do 10 (dok je 10 gotov je quizz)
    
}
// jedna funkcija za loudanje
//random int koji oznacava tocni odgovor - NE SMIJE SE PONAVLJAT -> moguce napraviti array brojeva koji su vec bili i po njima provjeravati
//salje pitanje -> String
//salje 4 odgovora, 1 tocan i 3 random ->[String]
//chekira odgovor (dok je tocan odgovor zeleno dok je pogresean crveno) i povecava score ako je odgovor tocan i broj pitanja -> ide novo pitanje

//dok se odgovori na 10 pitanja salje se na novi screen gdje pise score i poruka
