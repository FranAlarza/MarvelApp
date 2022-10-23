//
//  ErrorView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 23/10/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var heroViewModel: HeroesViewModel
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            Image("mr-satan")
                .resizable()
                .frame(width: 200, height: 300)
            Text("Vaya parece que algo ha ido mal hemos llamado a Mr. Satán para solucionarlo")
                .padding([.leading, .trailing], 50)
                .bold()
            Button {
                heroViewModel.status = .none
            } label: {
                Text("Volver Con Los Heroes")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 48)
                    .background(Color.orange)
                    .cornerRadius(20)
            }

        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
