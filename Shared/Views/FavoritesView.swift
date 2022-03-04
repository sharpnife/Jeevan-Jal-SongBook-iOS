//
//  FavoritesView.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 17/06/21.
//

import SwiftUI

var favoritesSongs : [Song] = []
//private var hasSeen: [String] = []

struct FavoritesView: View {
    @State var favorites: [Song] = favoritesSongs
    var body: some View {
        List(favorites) {
            song in
            VStack {
//                getAlphabet(song: song)
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .padding(EdgeInsets.init(top: 50, leading: 0, bottom: 50, trailing: 0))
                NavigationLink(
                    destination: SongMainView(song: song, fontName: (song.isEnglish ? "Times New Roman": "Marathi Tirkas") )) {
                    makeView(song: song)
                }
            }.contextMenu{
                Button {
                    deleteFavoritesData(textToDelete: String(song.id + " "))
                    favorites = favoritesSongs
                } label: {
                    Image(systemName: "trash")
                    Text("Delete")
                }
            }
            Spacer()
        }.listStyle(SidebarListStyle())
        .onAppear {
            favorites = favoritesSongs
        }
    }
    
//    func getAlphabet(song: Song) -> Text {
//        if(!hasSeen.contains(song.indexAlphabet)) {
//            hasSeen.append(song.indexAlphabet)
//            if(!song.isEnglish) {
//                return Text(song.indexAlphabet).font(Font.custom("Marathi Tirkas", size: 40.0))
//            }
//            else {
//                return Text(song.indexAlphabet)
//                    .font(Font.custom("Times New Roman", size: 40.0))
//            }
//        }
//        return Text("")
//    }
    
    func makeView(song: Song) -> SongsIndexView {
        return SongsIndexView(song: song, id: song.indexID)
    }
}

func generateFavoritesList() {
    favoritesSongs = []
    let data = readFavoritesData()
    var cur = ""
    for character in data {
        if(character == " ") {
            for song in songs {
                if(song.id == cur) {
                    favoritesSongs.append(song)
                }
            }
            for song in englishSongs {
                if(song.id == cur) {
                    favoritesSongs.append(song)
                }
            }
            cur = ""
            continue
        }
        cur += String(character)
    }
    let temp = Set(favoritesSongs)
    let temp2 = Array(temp)
    favoritesSongs = temp2
    sortSongs(songsToBeSorted: &favoritesSongs)
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
