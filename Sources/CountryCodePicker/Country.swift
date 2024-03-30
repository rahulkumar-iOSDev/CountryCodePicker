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
