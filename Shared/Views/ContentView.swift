//
//  ContentView.swift
//  Shared
//
//  Created by PRAISE WINSTON on 12/06/21.
//

import SwiftUI

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func sortSongs( songsToBeSorted: inout [Song]) {
    //sorts the songs
    songsToBeSorted.sort {
        $0.indexAlphabet < $1.indexAlphabet
    }
    for index in 1...songsToBeSorted.count {
        songsToBeSorted[index - 1].indexID = index
    }
}


struct ContentView: View {
    var body: some View {
        makeMainView()
    }
    
    func makeMainView() -> MainView {
        writeFavoritesData(textToWrite: "")
        sortSongs(songsToBeSorted: &songs)
        sortSongs(songsToBeSorted: &englishSongs)
        return MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
