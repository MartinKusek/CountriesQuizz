//
//  CountriesModel.swift
//  Countries
//
//  Created by Martin Kusek on 23.10.2022..
//

import Foundation

 //MARK: - CountriesModel
struct CountriesModel {
    let name: String
    let capital: String
}

 //MARK: - CountriesData
struct CoutriesData: Codable {
    let data: [CountryData]
}

struct CountryData: Codable {
    let name: String
    let capital: String
}
