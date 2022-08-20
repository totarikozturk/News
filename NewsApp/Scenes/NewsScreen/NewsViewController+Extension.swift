//
//  NewsViewController+Extension.swift
//  News
//
//  Created by TarıkOzturk on 20.08.2022.
//

import UIKit

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
            AppManager.shared.bookmarksData = article
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
