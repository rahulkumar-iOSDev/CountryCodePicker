//
//  ContentView.swift
//  ExampleApp
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
            Text("Show Country code Picker")
        }
        
        .fullScreenCover(isPresented: $isCountryListPresnted, content: {
            CountryListView { country in
                print(country)
            }
        })
    }
}

#Preview {
    ContentView()
}
