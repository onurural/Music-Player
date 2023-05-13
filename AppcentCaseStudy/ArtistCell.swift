//
//  ArtistCell.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import SwiftUI

struct ArtistCell: View {
    var artist: Artist
    var body: some View {
        ZStack {
            if let imageURL = artist.pictureMedium {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
            }
            VStack {
                Spacer()
                if let name = artist.name {
                    Text(name)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                }
            }
            
            
            
        }
    }
}

//struct ArtistCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtistCell(artist: Artist(id: <#T##Int#>, name: <#T##String#>, picture: <#T##String#>, pictureSmall: <#T##String#>, pictureMedium: <#T##String#>, pictureBig: <#T##String#>, pictureXl: <#T##String#>, radio: <#T##Bool#>, tracklist: <#T##String#>, type: <#T##String#>))
//    }
//}
