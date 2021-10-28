//
//  AddNewPokemon.swift
//  Project 2
//
//  Created by Minna Yu on 10/26/21.
//
// This view allows the user to add their own Pokémon, with name,
// Pokémon title, Pokémon type, secondary type, and description

import SwiftUI

struct AddNewPokemon: View {
    @StateObject var pokemonStore: PokemonStore
    @State private var type: String = ""
    @State private var type2: String = ""
    @State private var pokemonType: String = ""
    @State private var name: String = ""
    @State private var description: String = ""
    var body: some View {
        Form {
            Section(header: Text("Pokémon Details")) {
                    Image("pokemon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        DataInput(title: "Name", userInput: $name)
        DataInput(title: "Pokémon", userInput: $pokemonType)
        DataInput(title: "Type", userInput: $type)
        DataInput(title: "Secondary Type", userInput: $type2)
        DataInput(title: "Description", userInput: $description)
    }
        Button(action: addNewPokemon) {
            Text("Add Pokémon")
            }
        }
        
    }
    func addNewPokemon(){
        let newPokemon = Pokemon(id: UUID().uuidString,
                         name: name,
                         pokemonType: pokemonType,
                         type: type,
                         type2: type2,
                         description: description,
                        imageName: "pokemon",
                        detailImageName: "pokemon")
        pokemonStore.pokemon.append(newPokemon)
    }
}



struct AddNewPokemon_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPokemon(pokemonStore: PokemonStore(pokemon: pokemonData))
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
