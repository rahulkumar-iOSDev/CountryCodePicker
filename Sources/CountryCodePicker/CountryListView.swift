//
//  SwiftUIView.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI

public struct CountryListView: View {
    
    public init() {
        
    }
    
    @StateObject var viewModel = CountryListViewModel()
    
    public var body: some View {
        List(viewModel.filteredCountries) { country in
            CountryListCellView(country: country)
        }
    }
}

#Preview {
    CountryListView()
}

