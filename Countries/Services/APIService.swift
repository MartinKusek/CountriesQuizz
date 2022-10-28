//
//  APIService.swift
//  Countries
//
//  Created by Martin Kusek on 23.10.2022..
//

import Foundation

struct APIService {

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
                    if let countriesData = self.parseJSON(safeData) {
                        completion(countriesData)
                    }
                }
            }
            
            //4. Start
            task.resume()
        }
    }
    
    func parseJSON(_ safeData: Data) -> [CountriesModel]? {
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
}
