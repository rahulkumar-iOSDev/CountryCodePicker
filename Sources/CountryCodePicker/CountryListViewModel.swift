//
//  CountryListViewModel.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import Foundation

final class CountryListViewModel: ObservableObject {
    
    var countries: [Country] = []
    @Published var filteredCountries: [Country] = []
    let countryJsonFileName: String = "countries"
    
    init() {
        loadCountryJSON()
    }
    
    func getCounytryJSONFilePath() -> String? {
        guard let path = Bundle.main.path(forResource: countryJsonFileName, ofType: "json") else {
            print("countries.json file is missing")
            return nil
        }
        return path
    }
    
    func loadCountryJSON() {
        guard let path = getCounytryJSONFilePath() else { return }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let fetchedList = try JSONDecoder().decode([Country].self, from: data)
            countries = fetchedList
            filteredCountries = countries
        } catch {
            print("Error loading country data from JSON: \(error)")
        }
    }
    
    func getCountryFlag(from countryCode: String) -> String {
        let countryCodeWithoutPlus = countryCode.contains("+") ? String(countryCode.dropFirst()) : countryCode
        for country in countries {
            if country.dialCode.description == countryCodeWithoutPlus {
                return country.flag
            }
        }
        return ""
    }


}
