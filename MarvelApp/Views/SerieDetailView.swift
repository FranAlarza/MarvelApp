//
//  SerieDetail.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 17/10/22.
//

import SwiftUI

struct SerieDetailView: View {
    var serie: Series
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(serie.thumbnail.path)/detail.jpg")) { image in
                ZStack {
                    GeometryReader { geometry in
                        image
                            .resizable()
                            .opacity(1)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geometry.size.width)
                        LinearGradient(gradient: Gradient(colors: [.white.opacity(0.6), .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                            .frame(width: geometry.size.width)
                    }
                    .ignoresSafeArea()
                }
                
                
            } placeholder: {
                ProgressView()
            }
            VStack {
                Text(serie.title)
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 22))
                    .offset(x: 0, y: -40)
                Spacer()
                Text(serie.resultDescription ?? "")
                    .padding(20)
                    .foregroundColor(.white)
            }
        }
    }
}


struct SerieDetail_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(serie: Series(id: 1,
                                  title: "Deadpool (1997 - 2002)",
                                  resultDescription: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!",
                                  thumbnail: ThumbnailSerie(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3", thumbnailExtension: "jpg")))
    }
}
