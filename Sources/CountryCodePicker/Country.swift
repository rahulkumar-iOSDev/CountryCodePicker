//
//  File.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import Foundation

struct Country: Decodable, Identifiable {
    var id = UUID()
    let name: String
    let dialCode: Int
    let code, flag: String
}
