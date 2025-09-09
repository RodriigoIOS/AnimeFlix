
// Classe principal HomeViewController

import Foundation
import UIKit
import Alamofire

final class HomeViewController: UIViewController {

    private let homeView = HomeView()
    private let viewModel = HomeViewModel()

    // MARK: - Lifecycle
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AnimeFlix"
        configureTableView()
        bindViewModel()
        viewModel.fetchAnimes()
    }

    // MARK: - Setup tableView
    private func configureTableView() {
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        homeView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        homeView.tableView.estimatedRowHeight = 80
        homeView.tableView.rowHeight = UITableView.automaticDimension
    }

    private func bindViewModel() {
        viewModel.onDataFetched = { [weak self] in
            DispatchQueue.main.async {
                print("Dados recebidos: \(self?.viewModel.animes.count ?? 0) animes")
                self?.homeView.tableView.reloadData()
            }
        }

        viewModel.onError = { [weak self] message in
            DispatchQueue.main.async {
                print("Erro no ViewModel: \(message)")
            }
        }
    }
}

// MARK: - UITableViewDataSource / Delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.animes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }

        let anime = viewModel.animes[indexPath.row]
        cell.configure(with: anime)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let anime = viewModel.animes[indexPath.row]
        print("▶️ Selecionado: \(anime.title)")
    }
}
