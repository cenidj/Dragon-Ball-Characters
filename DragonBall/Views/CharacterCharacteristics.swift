//
//  CharacterCharacteristics.swift
//  DragonBall
//
//  Created by Cesario Nivar on 1/24/24.
//

import SwiftUI

struct CharacterCharacteristics: View {
    var characteristic: String
    var value: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            Text("\(characteristic):")
                .bold()
            
            Text(value)
                .font(.subheadline)
        }
        .padding()
        .foregroundStyle(.white)
        .background(backgroundColor)
        .clipShape(Capsule())
    }
}

#Preview {
    CharacterCharacteristics(characteristic: "Race", value: "Saiyan", backgroundColor: Color.backgroundColor)
}
