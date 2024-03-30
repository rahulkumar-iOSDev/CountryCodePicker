//
//  SwiftUIView.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI

public struct CountryListView: View {

    @Binding public var isCountryListPresnted: Bool
    @StateObject private var viewModel = CountryListViewModel()
    public var onTapOfCountryRow: ((Country) -> Void)
    
    public init(isCountryListPresnted: Binding<Bool>, onTapOfCountryRow: @escaping ((Country) -> Void)) {
        _isCountryListPresnted = isCountryListPresnted
        self.onTapOfCountryRow = onTapOfCountryRow
        
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                if viewModel.filteredCountries.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "globe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.gray)
                        
                        Text("No Countries Found")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundStyle(.gray)
                    }
                } else {
                    List(viewModel.filteredCountries) { country in
                        CountryListCellView(country: country)
                            .frame(height: 28)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                onTapOfCountryRow(country)
                                isCountryListPresnted = false
                                
                            }
                    }
                    .listStyle(.plain)
                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: viewModel.searchText) { _ in
                viewModel.performSearch(for: viewModel.searchText)
            }
            .navigationTitle("Select Country")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isCountryListPresnted = false
                } label: {
                    Text("Close")
                        .fontWeight(.regular)
                }
            }
        }
    }
}

#Preview {
    CountryListView(isCountryListPresnted: .constant(false), onTapOfCountryRow: { _ in })
}

