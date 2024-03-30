//
//  SwiftUIView.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI

public struct CountryListCellView: View {
    
    let country: Country
    
    public var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text(country.flag)
                Text(country.name)
                Spacer()
                Text("+\(country.dialCode)")
            }
            
            Divider()
            Spacer()
            
        }
    }
}

#Preview {
    List {
        CountryListCellView(country: Country(name: "India", dialCode: 91, code: "IN", flag: "🇮🇳"))
            .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    
}
