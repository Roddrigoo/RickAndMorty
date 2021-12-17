//
//  Character.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import Foundation

struct Character: Codable {
    
    var id: Int
    var name: String
    var species: String
    var gender: String
    var type: String
    var image: String
}
