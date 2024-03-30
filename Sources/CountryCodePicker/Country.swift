//
//  File.swift
//  
//
//  Created by Rahul Kumar on 30/03/24.
//

import Foundation

public struct Country: Decodable, Identifiable {
    public var id = UUID()
    public let name: String
    public let dialCode: Int
    public let code, flag: String
}

extension Country {
    static let mockData: [Country] = [Country(name: "India", dialCode: 91, code: "IN", flag: "🇮🇳"),
                                      Country(name: "Afghanistan", dialCode: 93, code: "AF", flag: "🇦🇫"),
                                      Country(name: "Japan", dialCode: 81, code: "JP", flag: "🇯🇵")]
}
