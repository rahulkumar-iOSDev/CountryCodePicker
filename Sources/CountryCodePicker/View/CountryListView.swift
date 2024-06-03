//
//  SwiftUIView.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI

public struct CountryListView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = CountryListViewModel()
    public var onTapOfCountryRow: ((Country) -> Void)
    
    public init(onTapOfCountryRow: @escaping ((Country) -> Void)) {
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
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.gray)
                    }
                } else {
                    List(viewModel.filteredCountries) { country in
                        CountryListCellView(country: country)
                            .contentShape(Rectangle())
                            .frame(height: 28)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                onTapOfCountryRow(country)
                                presentationMode.wrappedValue.dismiss()
                                
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
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Close")
                        .fontWeight(.regular)
                }
            }
        }
    }
}

#Preview {
    CountryListView(onTapOfCountryRow: { _ in })
}

