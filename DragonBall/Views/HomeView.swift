//
//  HomeView.swift
//  DragonBall
//
//  Created by Cesario Nivar on 1/19/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.thirdColor, .secondarySecondColor], startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    CharactersView()
                        .padding()
                }
            }
            .navigationTitle("Characters")
            .toolbarBackground(LinearGradient(colors: [.thirdColor, .secondarySecondColor], startPoint: .topLeading, endPoint: .bottomTrailing), for: .navigationBar)
        }
    }
}

#Preview {
    HomeView()
}
