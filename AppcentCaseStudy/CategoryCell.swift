//
//  CategoryCell.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import SwiftUI

struct CategoryCell: View {
    var genre: Genre
    var body: some View {
        ZStack {
            if let imageURL = genre.pictureMedium {
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
                if let name = genre.name {
                    Text(name)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                }
            }
            
            
        }
        
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(genre: Genre(id: 132, name: "Pop", picture: "https://api.deezer.com/genre/132/image", pictureSmall: "https://e-cdns-images.dzcdn.net/images/misc/db7a604d9e7634a67d45cfc86b48370a/56x56-000000-80-0-0.jpg", pictureMedium: "https://e-cdns-images.dzcdn.net/images/misc/db7a604d9e7634a67d45cfc86b48370a/250x250-000000-80-0-0.jpg", pictureBig: "https://e-cdns-images.dzcdn.net/images/misc/db7a604d9e7634a67d45cfc86b48370a/500x500-000000-80-0-0.jpg", pictureXl: "https://e-cdns-images.dzcdn.net/images/misc/db7a604d9e7634a67d45cfc86b48370a/1000x1000-000000-80-0-0.jpg", type: TypeEnum.genre))
    }
}
