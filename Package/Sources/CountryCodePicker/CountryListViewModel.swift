//
//  CountryListViewModel.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import Foundation

final class CountryListViewModel: ObservableObject {
    
    public var countries: [Country] = Country.mockData
    @Published public var filteredCountries: [Country] = Country.mockData
    public let countryJsonFileName: String = "countries"
    @Published var searchText: String = ""
    
    
    init() {
        //loadCountryJSON()
    }
    
    public func getCounytryJSONFilePath() -> String? {
        guard let path = Bundle.main.path(forResource: countryJsonFileName, ofType: "json") else {
            print("countries.json file is missing")
            return nil
        }
        return path
    }
    
    public func loadCountryJSON() {
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
    
    public func getCountryFlag(from countryCode: String) -> String {
        let countryCodeWithoutPlus = countryCode.contains("+") ? String(countryCode.dropFirst()) : countryCode
        for country in countries {
            if country.dialCode.description == countryCodeWithoutPlus {
                return country.flag
            }
        }
        return ""
    }

    public func performSearch(for searchText: String) {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

}
