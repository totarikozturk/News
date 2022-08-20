//
//  BookMarkViewController.swift
//  News
//
//  Created by TarıkOzturk on 24.07.2022.
//

import UIKit

class BookMarkViewController: UIViewController {

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

        viewModel.addBookmark()
        AppManager.shared.favButtonTapped = false
        viewModel.load()
        tableView.reloadData()
    }
}
