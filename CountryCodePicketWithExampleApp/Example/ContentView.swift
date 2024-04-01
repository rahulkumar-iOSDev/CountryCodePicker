//
//  ContentView.swift
//  Example
//
//  Created by Rahul Kumar on 01/04/24.
//

import SwiftUI
import CountryCodePicker

struct ContentView: View {
    
    @State var isCountryListPresnted: Bool = false
    
    var body: some View {
        
        Button {
            isCountryListPresnted = true
        } label: {
             Text("Show Country Picker")
        }
        
        .fullScreenCover(isPresented: $isCountryListPresnted, content: {
            CountryListView(isCountryListPresnted: $isCountryListPresnted) { country in
                print(country)
            }
        })
    }
}

#Preview {
    ContentView()
}
