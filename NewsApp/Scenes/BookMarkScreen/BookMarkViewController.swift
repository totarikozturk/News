//
//  BookMarkViewController.swift
//  News
//
//  Created by TarıkOzturk on 24.07.2022.
//

import SafariServices
import UIKit

class BookMarkViewController: UIViewController, SFSafariViewControllerDelegate {

    let appearance = UINavigationBarAppearance()
    let tableView = UITableView()

    let viewModel = BookMarkViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.removeObject(forKey: UserdefaultsCode.codableKey)
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateTableViewData()
    }

    func updateTableViewData() {
        viewModel.addBookmark()
        Singleton.shared.favButtonTapped = false
        viewModel.load()
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension BookMarkViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookMarkCell.bookMarkCell,
                            for: indexPath) as? BookMarkCell else { return UITableViewCell() }

        let news = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(news)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.didSelectedRowAt(indexPath: indexPath)
        guard let url = URL(string: data.url!) else { return }

        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true

        let safariVC = SFSafariViewController(url: url, configuration: config)
        safariVC.delegate = self
        present(safariVC, animated: true)
    }
}
