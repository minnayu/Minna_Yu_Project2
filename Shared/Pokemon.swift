//
//  Pokemon.swift
//  CPSC357-Project 2
//
//  Created by Minna Yu on 10/26/21.
//
// This Swift file provides attributes for Pokémon objects.

import Foundation

import SwiftUI

struct Pokemon: Codable, Identifiable{
    var id: String
    var name: String
    var pokemonType: String
    var type: String
    var type2: String
    var description: String
    var imageName: String
    var detailImageName: String
}
