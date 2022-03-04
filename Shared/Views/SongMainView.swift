//
//  SongMainView.swift
//  SongBook
//
//  Created by PRAISE WINSTON on 14/06/21.
//

import SwiftUI

struct SongMainView: View {
    var song: Song
    var fontName: String
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView{
                HStack {
                    Text(song.title).font(Font.custom(fontName, size: 30.0))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .font(.body)
                        .padding(EdgeInsets.init(top: 70, leading: 0, bottom: 0, trailing: 0))
                }
                .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                
                VStack(spacing: 0) {
                    
                    VStack {
                        Text(song.lyrics)
                            .font(Font.custom(fontName, size: 35.0))
                            .fontWeight(.light)
                            .font(.title)
                            .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
                .foregroundColor(Color.black.opacity(0.7))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                .offset(x: 0, y: 0)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .background(Color.orange.opacity(0.2))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SongMainView_Previews: PreviewProvider {
    static var previews: some View {
        SongMainView(song: songs[0], fontName: "Times New Roman")
    }
}
