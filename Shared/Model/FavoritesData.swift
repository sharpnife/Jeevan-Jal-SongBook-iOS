//
//  FavoritesData.swift
//  SongBook (iOS)
//
//  Created by PRAISE WINSTON on 17/06/21.
//

import Foundation

let file = "favorites.data"

func writeFavoritesData(textToWrite: String) {
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(file)
        do {
            try textToWrite.write(to: fileURL, atomically: false, encoding: .utf8)
        } catch {
            fatalError("Can't write favorites data to file")
        }
    }
}

func deleteFavoritesData(textToDelete: String) {
    var data = readFavoritesData()
//    print("Data before deleting: \(data)")
//    print("textToDelete: \(textToDelete)")
    data = data.replacingOccurrences(of: textToDelete, with: "")
//    print("Data after deleting: \(data)")
    writeFavoritesData(textToWrite: data)
    generateFavoritesList()
}

func deleteFile() {
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(file)
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            fatalError("Can't delete file")
        }
    }
}


func readFavoritesData() -> String {
    var readData : String = ""
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(file)
        do {
            readData =  try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            fatalError("Can't read favorites data from file")
        }
    }
    return readData
}
