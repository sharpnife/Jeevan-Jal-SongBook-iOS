//
//  SongsList.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 14/06/21.
//

import SwiftUI

private var hasSeen: [String] = []
private var songID: Int = 0

struct EnglishSongsList: View {
    var songsData: [Song] = englishSongs
    var body: some View {
        List(songsData) {
            song in
            VStack {
                getAlphabet(song: song)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(EdgeInsets.init(top: 50, leading: 0, bottom: 50, trailing: 0))
                NavigationLink(
                    destination: SongMainView(song: song, fontName: "Times New Roman")) {
                    makeView(song: song)
                }
            }
            .contextMenu {
                Button {
                    writeFavoritesData(textToWrite: readFavoritesData() + String(song.id + " "))
                    generateFavoritesList()
                } label: {
                    Label("Add to favorites", systemImage: "heart")
                }
            }
            Spacer()
        }.listStyle(SidebarListStyle())
    }
    
    func getAlphabet(song: Song) -> Text {
        if(!hasSeen.contains(song.indexAlphabet)) {
            hasSeen.append(song.indexAlphabet)
            if(!song.isEnglish) {
                return Text(song.indexAlphabet).font(Font.custom("Marathi Tirkas", size: 40.0))
            }
            else {
                return Text(song.indexAlphabet)
                    .font(Font.custom("Times New Roman", size: 40.0))
            }
        }
        return Text("")
    }
    
    func makeView(song: Song) -> SongsIndexView {
        songID += 1
//        let tempID = songID
        if(songID == songsData.count) {
            songID = 0
            hasSeen = []
        }
        return SongsIndexView(song: song, id: song.indexID)
    }
}


struct EnglishSongsList_Previews: PreviewProvider {
    static var previews: some View {
        EnglishSongsList()
    }
}
