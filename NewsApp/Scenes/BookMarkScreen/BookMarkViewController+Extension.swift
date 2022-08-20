//
//  BookMarkViewController+Extension.swift
//  News
//
//  Created by TarıkOzturk on 20.08.2022.
//

import SafariServices
import UIKit

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
        openSafari(data: data)
    }
}

// MARK: SFSafariViewControllerDelegate
extension BookMarkViewController: SFSafariViewControllerDelegate {
    func openSafari (data: Article) {
        guard let url = URL(string: data.url!) else { return }
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let safariVC = SFSafariViewController(url: url, configuration: config)
        safariVC.delegate = self
        present(safariVC, animated: true)
    }
}
