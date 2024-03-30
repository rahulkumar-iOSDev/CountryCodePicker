//
//  ContentView.swift
//  CountryCodePickerDemo
//
//  Created by Rahul Kumar on 30/03/24.
//

import SwiftUI
import CountryCodePicker

struct ContentView: View {
    
    @State var isCountryListPresnted: Bool = false
    
    var body: some View {
        Button {
            isCountryListPresnted = true
        } label: {
            Text("Open Country Code Picker")
        }
        
        .fullScreenCover(isPresented: $isCountryListPresnted, content: {
            CountryListView(isCountryListPresnted: $isCountryListPresnted) { country in
                print(country.name)
                print(country.dialCode)
            }
        })
    }
}

#Preview {
    ContentView()
}
