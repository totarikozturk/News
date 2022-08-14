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

    func configureView() {
        drawDesign()
        navigationBarAppearance()
        makeSearchBar()
        makeFromDatePicker()
        makeToDatePicker()
        makeTableView()
    }

    func drawDesign() {
        view.backgroundColor = CustomColor.backGroundColor
        view.addSubview(fromDatePicker)
        view.addSubview(toDatePicker)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching News Data")
        refreshControl.overrideUserInterfaceStyle = .dark
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

    func makeToDatePicker() {
        toDatePicker.tintColor = CustomColor.titleColor
        toDatePicker.backgroundColor = CustomColor.backGroundColor
        toDatePicker.layer.cornerRadius = 15
        toDatePicker.datePickerMode = .countDownTimer
        toDatePicker.datePickerMode = .date
        toDatePicker.overrideUserInterfaceStyle = .dark
        toDatePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
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
            make.top.equalTo(fromDatePicker.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(44)
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
