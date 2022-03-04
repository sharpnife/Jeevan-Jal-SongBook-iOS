//
//  IndexAlphabet.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 15/06/21.
//

import SwiftUI

struct IndexAlphabet: View {
    var alphabet: String
    var body: some View {
        Text(alphabet).font(Font.custom("Marathi Tirkas", size: 15.0))
    }
}

struct IndexAlphabet_Previews: PreviewProvider {
    static var previews: some View {
        IndexAlphabet(alphabet: "A")
    }
}
