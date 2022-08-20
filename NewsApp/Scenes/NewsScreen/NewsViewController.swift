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

    let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(refreshNewsData(_:)), for: .valueChanged)
        configureView()
        getNews()
    }

    func getNews() {
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
