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
    let fromDatePicker = UIDatePicker()
    let toDatePicker = UIDatePicker()

    private let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(refreshNewsData(_:)), for: .valueChanged)
        configureView()
        getDefaultNews()
    }

    func getDefaultNews() {
        let query = "fener"
        let fromDate = "2022-08-14"
        let toDate = "2022-08-15"
        let sortBy = "popularity"

        viewModel.newsList(query: query, fromDate: fromDate, toDate: toDate, sortBy: sortBy) { [weak self] in
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

// MARK: UITableViewDelegate, UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.newsCell,
                                                       for: indexPath) as? NewsCell else { return UITableViewCell() }
        let news = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(news)
        return cell
    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cellSelect: UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath) else { return }
//        let movieDetailViewController = MovieDetailViewController()
//        let movie = viewModel.didSelectedRowAt(indexPath: indexPath)
//        self.navigationController?.navigationBar.isHidden = false
//        movieDetailViewController.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}
// MARK: UISearchBarDelegate, UISearchResultsUpdating
extension NewsViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
                      text.trimmingCharacters(in: CharacterSet.whitespaces).count >= 1  else { return }
//        viewModel.fetchSearchMoviesData(for: text) {
//            self.tableView.reloadData()
//        }
    }
}

// MARK: DateFormatter
extension DateFormatter {
    static var filterDateFormat: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }()
}
