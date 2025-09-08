//
//  AnimeRespose.swift
//  AnimeFlix
//
//  Created by Rodrigo on 08/09/25.
//

struct AnimeResponse:Codable {
    
    let data: [Anime]
}

struct Anime: Codable {
    
    let id: Int
    let title: String
    let imageUrl: String
}
