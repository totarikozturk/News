//
//  NewsViewController.swift
//  News
//
//  Created by TarıkOzturk on 24.07.2022.
//
import UIKit

class NewsViewController: UIViewController {

    private let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal
        getDefaultNews()
    }

    func getDefaultNews() {
        let query = "apple"
        let fromDate = "2022-07-31"
        let toDate = "2022-07-31"
        let sortBy = "popularity"

        viewModel.newsList(query: query, fromDate: fromDate, toDate: toDate, sortBy: sortBy) { [weak self] in
            print(self as Any)
        }
    }

}
