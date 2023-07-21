//
//  Superhero.swift
//  TestKingfisher
//
//  Created by Алексей Турулин on 7/20/23.
//

import Foundation

struct Superhero: Decodable {
    let name: String
    let images: Image
}

struct Image: Decodable {
    let lg: String
}
