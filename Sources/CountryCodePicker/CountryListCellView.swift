//
//  SwiftUIView.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI

struct CountryListCellView: View {
    
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.flag)
            Text(country.name)
            Spacer()
            Text("+\(country.dialCode)")
        }
    }
}

#Preview {
    List {
        CountryListCellView(country: Country(name: "India", dialCode: 91, code: "IN", flag: "🇮🇳"))
    }
    
}
