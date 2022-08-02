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
        getNews(query: "fenerbahce", fromDate: "2022-07-8", toDate: "2022-07-8", sortBy: "popularity")
    }

    func getNews(query: String, fromDate: String, toDate: String, sortBy: String) {
        viewModel.newsList(query: query, fromDate: fromDate, toDate: toDate, sortBy: sortBy) { [weak self] in
            guard let self = self else {return}
            print(self)
        }
    }

}
