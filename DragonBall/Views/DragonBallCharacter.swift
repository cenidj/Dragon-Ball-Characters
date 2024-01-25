//
//  DragonBallCharacter.swift
//  DragonBall
//
//  Created by Cesario Nivar on 1/22/24.
//

import SwiftUI

struct DragonBallCharacter: View {
    var character: Character
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: character.image)!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                    
                } placeholder: {
                    ProgressView()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                }
                VStack (spacing: 20) {
                    
                    Text(character.name)
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            CharacterCharacteristics(characteristic: "Race", value: character.race, backgroundColor: Color.primaryFirstColor)
                            CharacterCharacteristics(characteristic: "Gender", value: character.gender.rawValue, backgroundColor: Color.secondarySecondColor)
                            CharacterCharacteristics(characteristic: "Base KI", value: character.ki, backgroundColor: Color.accentColor)
                            CharacterCharacteristics(characteristic: "Total KI", value: character.maxKi, backgroundColor: Color.green)
                            CharacterCharacteristics(characteristic: "Affiliation", value: character.affiliation, backgroundColor: Color.blue)
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    Text(character.description)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                
            }
        }
        .background(
            LinearGradient(colors: [.thirdColor, .secondarySecondColor], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        .toolbarBackground(LinearGradient(colors: [.thirdColor, .secondarySecondColor], startPoint: .topLeading, endPoint: .bottomTrailing), for: .navigationBar)
    }
}

#Preview {
    DragonBallCharacter(character: Character.characterExample)
}
