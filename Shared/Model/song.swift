//
//  song.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 14/06/21.
//

import Foundation

struct Song: Hashable, Codable, Identifiable {
    let id = UUID().uuidString
    var indexID: Int
    let isEnglish: Bool
    let indexAlphabet: String
    //weight would store the priority of each data which is used while sorting
    //weight value would [0...] - for Hindi Alphabets
    // weight value would be [60...] - for English Alphabets
    let weight: Int
    let title: String
    let lyrics: String
}

struct SongsData: Identifiable {
    let id = UUID()
    var songsList: [Song]
}
