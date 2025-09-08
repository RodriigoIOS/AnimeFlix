//
//  HomeViewModel.swift
//  AnimeFlix
//
//  Created by Rodrigo on 08/09/25.
//

class HomeViewModel {
    
    var animes: [Anime] = []
    var onDataFetched: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchAnimes() {
        NetworkManager.shared.fetchAnimes { [weak self] result in
            switch result {
            case .success(let animes):
                self?.animes = animes
                self?.onDataFetched?()
            case .failure(let error):
                self?.onError?(error.localizedDescription)
            }
        }
    }
}
