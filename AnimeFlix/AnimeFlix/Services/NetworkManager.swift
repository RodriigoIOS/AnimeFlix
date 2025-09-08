//
//  NetworkManager.swift
//  AnimeFlix
//
//  Created by Rodrigo on 08/09/25.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init () {}
    
    func fetchAnimes(completion: @escaping(Result<[Anime], Error>) -> Void) {
        let url = "https://api.jikan.moe/v4/anime"
        
        AF.request(url).validate().responseDecodable(of: AnimeResponse.self) { response in
            switch response.result {
            case.success(let animeResponse):
                completion(.success(animeResponse.data))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}
