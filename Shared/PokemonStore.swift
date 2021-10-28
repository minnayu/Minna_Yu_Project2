//
//  PokemonStore.swift
//  CPSC357-Project 2
//
//  Created by Minna Yu on 10/26/21.
//
// This swift file allows for instantiation of Pokémon objects.

import Foundation
import SwiftUI
import Combine

class PokemonStore: ObservableObject{
    @Published var pokemon: [Pokemon]
    
    init (pokemon: [Pokemon] = []){
        self.pokemon = pokemon
    }
}
