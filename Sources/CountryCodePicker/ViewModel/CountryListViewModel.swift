//
//  CountryListViewModel.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import Foundation

final class CountryListViewModel: ObservableObject {
    
    public var countries = Country.countries
    @Published public var filteredCountries = Country.countries
    @Published var searchText: String = ""

    public func performSearch(for searchText: String) {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

}
