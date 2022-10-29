//
//  FlagsModel.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import Foundation

//MARK: - FlagsModel
struct FlagModel {
   let name: String
   let unicodeFlag: String
}

//MARK: - FlagsData
struct FlagsData: Codable {
   let data: [FlagData]
}

struct FlagData: Codable {
   let name: String
   let unicodeFlag: String
}
