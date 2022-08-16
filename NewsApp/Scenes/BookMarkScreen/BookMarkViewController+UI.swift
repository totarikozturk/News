//
//  BookMarkViewController+UI.swift
//  News
//
//  Created by TarıkOzturk on 16.08.2022.
//

import SnapKit
import UIKit

extension BookMarkViewController {

// MARK: configureView
        func configureView() {
            drawDesign()
            navigationBarAppearance()
            makeTableView()
        }

// MARK: drawDesign
        func drawDesign() {
            view.backgroundColor = CustomColor.backGroundColor
            view.addSubview(tableView)
        }
    // MARK: makeTableView
        func makeTableView() {
            tableView.backgroundColor = CustomColor.backGroundColor
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 256
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(BookMarkCell.self, forCellReuseIdentifier: BookMarkCell.bookMarkCell)
            tableView.separatorStyle = .none
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
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
            navigationItem.title = "BookMark.viewTitle".localized
            navigationItem.titleView?.tintColor = CustomColor.titleColor
            navigationController?.navigationBar.tintColor = CustomColor.titleColor
        }
}
