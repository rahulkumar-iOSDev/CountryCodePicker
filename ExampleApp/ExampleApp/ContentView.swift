//
//  ContentView.swift
//  DemoApp
//
//  Created by Rahul Kumar on 01/04/24.
//

import SwiftUI
import CountryCodePicker


struct ContentView: View {
    
    @State var isPresent: Bool = false
    
    var body: some View {
        Button {
            isPresent = true
        } label: {
            Text("Open Country Picker")
        }
        
        
        
        .sheet(isPresented: $isPresent, content: {
            CountryListView(isCountryListPresnted: $isPresent) { country in
                print(country.name)
            } testingClosure: { num in
                return num > 5
            }
        })
    }
}

#Preview {
    ContentView()
}
