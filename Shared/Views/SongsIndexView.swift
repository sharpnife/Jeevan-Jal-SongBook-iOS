//
//  SongsIndexView.swift
//  SongBook
//
//  Created by PRAISE WINSTON on 12/06/21.
//

import SwiftUI
import UIKit

struct SongsIndexView: View {
    var song: Song
    var id: Int
    var body: some View {
        HStack{
                Text("\(id).")
                    .font(Font.custom("Times New Roman", size: 25.0))
                Text(song.title)
                    .font(Font.custom((song.isEnglish ? "Times New Roman" : "Marathi Tirkas"), size: 30.0))
        }
    }
    
}

struct SongsIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongsIndexView(song: songs[0], id: 1)
    }
}
