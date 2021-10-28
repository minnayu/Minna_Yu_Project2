//
//  PokemonDetail.swift
//  ListNavDemo
//
//  Created by Minna Yu on 10/26/21.
//
// This view shows the specific Pokémon details, including the name,
// their title, type, secondary type, and description.

import SwiftUI

struct PokemonDetail: View {
    let selectedPokemon: Pokemon
    var colors: [Color] = [.black, .red, .green, .orange, .blue, .purple, .pink, .gray, .yellow]
    var colornames = ["Black", "Red", "Green", "Orange", "Blue", "Purple", "Pink", "Gray", "Yellow"]
    @State private var colorIndex = 0

    var body: some View {
        Form {
            Section(header: Text("Pokémon Details")) {
                Image(selectedPokemon.detailImageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                HStack {
                    Text(selectedPokemon.name)
                        .font(.headline)
                    Text(selectedPokemon.pokemonType)
                        .font(.subheadline)
                }
                Text(selectedPokemon.type)
                    .font(.headline)
                    .foregroundColor(checkType(selectedPokemon.type))
                Text(selectedPokemon.type2)
                    .font(.headline)
                    .foregroundColor(checkType(selectedPokemon.type2))
                Text(selectedPokemon.description)
                    .font(.body)
                    .foregroundColor(colors[colorIndex])
                Picker(selection: $colorIndex, label: Text("Description Color")) {
                    ForEach(0 ..< colornames.count){
                        Text(colornames[$0])
                            .foregroundColor(colors[$0])
                }
                        .padding()
                       
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
    }
    
    func checkType(_ type: String) -> Color{
        switch type{
        case "Normal":
            return Color.gray
        case "Fire":
            return Color.red
        case "Water":
            return Color.blue
        case "Grass":
            return Color.green
        case "Ice":
            return (Color(red: 0.0, green: 3.0, blue: 4.5, opacity: 1.0))
        case "Psychic":
            return Color.pink
        case "Poison":
            return Color.purple
        case "Electric":
            return Color.yellow
        case "Dragon":
            return Color.purple
        default:
            return Color.black
        }
    }
    
    

}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(selectedPokemon: pokemonData[0])
    }
}
