//
//  HomeViewController.swift
//  AnimeFlix
//
//  Created by Rodrigo on 29/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let customView = HomeView()
    
    var mockTitles = [
        "Episódio 01: A Lenda de Seiya",
        "Episódio 02: O Despertar de Shiryu",
        "Episódio 03: O Golpe de Hyoga",
        "Episódio 04: Ikki Retorna das Sombras"
    ]
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "AnimeFlix"
        configureTableView()
    }
    
    func configureTableView(){
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        customView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: mockTitles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selecionou: \(mockTitles[indexPath.row])")
    }
}
