//
//  ContentView.swift
//  Shared
//
//  Created by Minna Yu on 10/26/21.
//
// This view provides full functionality to the user.
// The user can add their own Pokémon using the add button, edit
// the navigation view using the edit button, and view each Pokémon
// detail by clicking on the specific Pokémon.

import SwiftUI

struct ContentView: View {
    @StateObject private var pokemonStore: PokemonStore = PokemonStore(pokemon: pokemonData)
    var body: some View {
        NavigationView{
            List{
                ForEach (pokemonStore.pokemon) { pokemon in
                    ListCell(pokemon: pokemon)
                    }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
                }
            .navigationBarTitle(Text("Pokémon"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewPokemon(pokemonStore: self.pokemonStore)){
                Text("Add")
                    .foregroundColor(.blue)
            },trailing: EditButton())
            
        }
    }
    func deleteItems(at offsets: IndexSet){
        pokemonStore.pokemon.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int){
        pokemonStore.pokemon.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    
    var pokemon : Pokemon
    
    var body: some View {
        NavigationLink(destination: PokemonDetail(selectedPokemon: pokemon)){
            HStack{
                Image(pokemon.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(pokemon.name)
            }
        }
       
    }
}
