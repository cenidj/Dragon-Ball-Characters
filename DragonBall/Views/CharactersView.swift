//
//  CharactersView.swift
//  DragonBall
//
//  Created by Cesario Nivar on 1/24/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var DBViewModel = DragonBallViewModel()
    @State private var characters = [Character]()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140, maximum: 180))], spacing: 10) {
            ForEach(characters) { character in
                NavigationLink {
                    DragonBallCharacter(character: character)
                } label: {
                    AsyncImage(url: URL(string: character.image)!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .overlay(alignment: .bottom) {
                                Text(character.name)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryFirstColor)
                            }
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                }
                .foregroundStyle(.black)
                
                
            }
            
        }
        .onAppear {
            Task {
                do {
                    self.characters = try await DBViewModel.getCharacters()
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

#Preview {
    CharactersView()
}
