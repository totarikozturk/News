//
//  MakeNewsViewController.swift
//  News
//
//  Created by TarıkOzturk on 3.08.2022.
//

import SnapKit
import SwiftUI
import UIKit

extension NewsViewController {

// MARK: configureView
    func configureView() {
        drawDesign()
        navigationBarAppearance()
        makeSearchBar()
        makeFromDatePicker()
        makeToDatePicker()
        makeTableView()
    }

// MARK: drawDesign
    func drawDesign() {
        view.backgroundColor = CustomColor.backGroundColor
        view.addSubview(fromDatePicker)
        view.addSubview(toDatePicker)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        refreshControl.attributedTitle = NSAttributedString(string: "Home.fetchingNewsData".localized)
        refreshControl.overrideUserInterfaceStyle = .dark
        refreshControl.tintColor = CustomColor.titleColor
    }

// MARK: makeSearchBar
    func makeSearchBar() {
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.searchBar.placeholder = "Home.searchBarPlaceHolderText".localized
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.tintColor = CustomColor.textColor
        searchBar.searchBar.barTintColor = CustomColor.textColor
        searchBar.searchBar.searchTextField.textColor = CustomColor.textColor
    }

// MARK: makeFromDatePicker
    func makeFromDatePicker() {
        fromDatePicker.tintColor = CustomColor.textColor
        fromDatePicker.backgroundColor = CustomColor.backGroundColor
        fromDatePicker.layer.cornerRadius = 15
        fromDatePicker.datePickerMode = .date
        fromDatePicker.overrideUserInterfaceStyle = .dark
        fromDatePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.left.equalToSuperview().offset(16)
        }
    }

// MARK: makeToDatePicker
    func makeToDatePicker() {
        toDatePicker.tintColor = CustomColor.titleColor
        toDatePicker.backgroundColor = CustomColor.backGroundColor
        toDatePicker.layer.cornerRadius = 15
        toDatePicker.datePickerMode = .date
        toDatePicker.overrideUserInterfaceStyle = .dark
        toDatePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
    }

// MARK: makeTableView
    func makeTableView() {
        tableView.backgroundColor = CustomColor.backGroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 240
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.newsCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalTo(fromDatePicker.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-54)
        }
    }

// MARK: navigationBarAppearance
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
        navigationItem.title = "Home.newsViewTitle".localized
        navigationItem.titleView?.tintColor = CustomColor.titleColor
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationItem.searchController = searchBar
    }
}
