//
//  MainView.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 16/06/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing:100) {
                Text("Jeevan Jal Song Book")
                    .padding(.top)
                    .offset(x: 10.0, y: -30.0)
                    .font(.system(size: 35))
                VStack (spacing:20){
                    HStack(spacing: 10) {
                        NavigationLink(destination: SongsList()) {
                            Image(systemName: "book").font(.system(size: 25))
                            Text("Hindi Songs").font(.system(size: 30))
                        }
                    }
                    HStack(spacing: 10) {
                        NavigationLink(destination: EnglishSongsList()) {
                            Image(systemName: "book").font(.system(size: 25))
                            Text("English Songs").font(.system(size: 30))
                        }
                    }
                    HStack(spacing: 10) {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "heart").font(.system(size: 25))
                            Text("Favorites").font(.system(size: 30))
                        }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
