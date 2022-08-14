//
//  MakeNewsViewController.swift
//  News
//
//  Created by TarıkOzturk on 3.08.2022.
//

import SnapKit
import UIKit

extension NewsViewController {

    func configureView() {
        drawDesign()
        navigationBarAppearance()
        makeSearchBar()
        makeTableView()
    }

    func drawDesign() {
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching News Data")
        refreshControl.tintColor = CustomColor.titleColor
    }

    func makeSearchBar() {
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.searchBar.placeholder = Texts.searchBarPlaceHolderText
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.tintColor = CustomColor.textColor
        searchBar.searchBar.barTintColor = CustomColor.textColor
        searchBar.searchBar.searchTextField.textColor = CustomColor.textColor
    }

    func makeTableView() {
        tableView.backgroundColor = CustomColor.backGroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 240
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.newsCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = Titles.newsViewTitle
        navigationItem.titleView?.tintColor = CustomColor.titleColor
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationItem.searchController = searchBar
    }
}
