//
//  NewsViewController.swift
//  News
//
//  Created by TarıkOzturk on 24.07.2022.
//
import UIKit

class NewsViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let tableView = UITableView()
    let searchBar = UISearchController()
    let refreshControl = UIRefreshControl()

    private let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal

        refreshControl.addTarget(self, action: #selector(refreshNewsData(_:)), for: .valueChanged)
        configureView()
        getDefaultNews()
    }

    func getDefaultNews() {
        let query = "everything"
        let fromDate = "2022-08-14"
        let toDate = "2022-07-14"
        let sortBy = "popularity"

        viewModel.newsList(query: query, fromDate: fromDate, toDate: toDate, sortBy: sortBy) { [weak self] in
            print(self as Any)
            self?.tableView.reloadData()
        }
    }

    @objc private func refreshNewsData(_ sender: Any) {
        fetchNewsData()
    }

    private func fetchNewsData() {
        getDefaultNews()
        self.refreshControl.endRefreshing()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.newsCell,
                                                       for: indexPath) as? NewsCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let news = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(news)
        return cell
    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellSelect: UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath) else { return }
        cellSelect.selectionStyle = .none
//        let movieDetailViewController = MovieDetailViewController()
//        let movie = viewModel.didSelectedRowAt(indexPath: indexPath)
//        self.navigationController?.navigationBar.isHidden = false
//        movieDetailViewController.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

extension NewsViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
                      text.trimmingCharacters(in: CharacterSet.whitespaces).count >= 1  else { return }
//        viewModel.fetchSearchMoviesData(for: text) {
//            self.tableView.reloadData()
//        }
    }
}
