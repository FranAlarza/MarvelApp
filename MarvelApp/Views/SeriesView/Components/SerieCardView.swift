//
//  SerieCard.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 16/10/22.
//

import SwiftUI

struct SerieCardView: View {
    @EnvironmentObject var viewModel: SeriesViewModel
    var serie: Series
    @State var isFavorite = false
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: URL(string: "\(serie.thumbnail.path)/standard_fantastic.jpg")) { image in
                ZStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(1)
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.8), .black.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    
                    
                }
            } placeholder: {
                ProgressView()
            }
            
            VStack {
                HStack {
                    Text(serie.title)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                .padding(20)
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isFavorite.toggle()
                        if isFavorite {
                            viewModel.saveFavorite(serie: serie)
                        } else {
                            viewModel.deleteFavorite(from: serie)
                        }
                    } label: {
                        if viewModel.favorites.contains(serie) {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.black)
                                .clipShape(Circle())
                                .opacity(0.7)
                                .foregroundColor(Color.red)
                        } else {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.black)
                                .clipShape(Circle())
                                .opacity(0.7)
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                } // Fin HStack
                .padding(10)
            } // Fin VStack
        }
        .cornerRadius(20)
        .padding()
    }
    
}

struct SerieCard_Previews: PreviewProvider {
    static var previews: some View {
        SerieCardView(serie: Series(id: 1,
                                title: "Deadpool (1997 - 2002)",
                                resultDescription: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!",
                                thumbnail: ThumbnailSerie(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: "jpg")))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/335.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/))
    }
}
