//
//  PokemonData.swift
//  CPSC357-Project 2
//
//  Created by Minna Yu on 10/26/21.
//
// This swift file loads the Pokémon Data file to be used for the input of the Pokémon details.

import Foundation
import UIKit
import SwiftUI

var pokemonData: [Pokemon] = loadJson("pokemonData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
