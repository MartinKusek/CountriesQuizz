//
//  APIService.swift
//  Countries
//
//  Created by Martin Kusek on 23.10.2022..
//

import Foundation

struct APIService {
    
     //MARK: - FetchCountries

    func fetchCountries(completion : @escaping ([CountriesModel]) -> ()) {
            
        let urlString = "https://countriesnow.space/api/v0.1/countries/capital"
        
        //1. URL
        if let url = URL(string: urlString) {
            
            //2. URLSession
            let session = URLSession(configuration: .default)
            
            //3. Taks
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let countriesData = self.parseJSONCoutries(safeData) {
                        completion(countriesData)
                    }
                }
            }
            
            //4. Start
            task.resume()
        }
    }
    
    func parseJSONCoutries(_ safeData: Data) -> [CountriesModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoutriesData.self, from: safeData)
            
            var countries = [CountriesModel]()
            for country in decodedData.data {
                let country1 = CountriesModel(name: country.name, capital: country.capital)
                countries.append(country1)
            }
            
            return countries
            
        } catch {
            print(error)
            return nil
        }
    }
    
     //MARK: - FetchFlags
    
    func fetchFlags(completion : @escaping ([FlagModel]) -> ()) {
            
        let urlString = "https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode"
        
        //1. URL
        if let url = URL(string: urlString) {
            
            //2. URLSession
            let session = URLSession(configuration: .default)
            
            //3. Taks
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let flagsData = self.parseJSONFlags(safeData) {
                        //print(flagsData)
                        completion(flagsData)
                    }
                }
            }
            
            //4. Start
            task.resume()
        }
    }
    
    func parseJSONFlags(_ safeData: Data) -> [FlagModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlagsData.self, from: safeData)
            
            var flags = [FlagModel]()
            for flag in decodedData.data {
                let flag1 = FlagModel(name: flag.name, unicodeFlag: flag.unicodeFlag)
                flags.append(flag1)
            }
            
            print("JSON")
            return flags
            
        } catch {
            print(error)
            return nil
        }
    }
}
