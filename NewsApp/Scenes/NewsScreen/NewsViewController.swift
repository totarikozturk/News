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
        getNews()
    }

    private func getNews() {
        let query = viewModel.chooseQuery()
        viewModel.newsList(query: query, fromDate: viewModel.fromDate, toDate: viewModel.toDate) { [weak self] in
            self?.tableView.reloadData()
        }
    }

    @objc private func refreshNewsData(_ sender: Any) {
        fetchNewsData()
        getSearchDate()
    }

    private func fetchNewsData() {
        getNews()
        self.refreshControl.endRefreshing()
    }

    private func getSearchDate() {
        let fromDate = DateFormatter.filterDateFormat.string(from: fromDatePicker.date)
        let toDate = DateFormatter.filterDateFormat.string(from: toDatePicker.date)
        viewModel.fromDate = fromDate
        viewModel.toDate = toDate
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
        cell.bookMarkAction = { article in
            Singleton.shared.bookmarksData = article
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailData = viewModel.didSelectedRowAt(indexPath: indexPath)
        openDetailView(detailData)
    }
}

// MARK: UISearchBarDelegate, UISearchResultsUpdating
extension NewsViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
                      text.trimmingCharacters(in: CharacterSet.whitespaces).count >= 1  else { return }
        viewModel.searchQuery = text
        getNews()
    }
}

// MARK: Open DetailView
private extension NewsViewController {
    func openDetailView(_ data: Article?) {
        guard let detailData = data else { return }
        let newsDetailViewController = NewsDetailViewController(newsData: detailData)
        self.navigationController?.navigationBar.isHidden = false
        newsDetailViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
}
