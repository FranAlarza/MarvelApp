//
//  RemoteDataSource.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 20/3/23.
//

import Foundation

protocol RemoteDataSource {
    func getHeroes()
    func getSeries(id: String)
}
