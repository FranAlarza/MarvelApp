//
//  HeroCardView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import SwiftUI

struct HeroCardView: View {
    var hero: Result
    var body: some View {
        ZStack {
            VStack {
                Text(hero.name)
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)/standard_fantastic.jpg")) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding(.leading, 20)
            } placeholder: {
                ProgressView()
            }
        }
        // MARK: Fin ZStack
    }
}

struct HeroCardView_Previews: PreviewProvider {
    static var previews: some View {
        HeroCardView(hero: Result(id: 1,
                                  name: "3-D Man",
                                  resultDescription: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(
                                    path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension(rawValue: "jpg")!)
                                  ))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/335.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/))
    }
}
