//
//  Anime.swift
//  AnimeFlix
//
//  Created by Rodrigo on 09/09/25.
//

import Foundation

struct Anime: Codable {
    let mal_id: Int
    let title: String
    let images: AnimeImages
}
