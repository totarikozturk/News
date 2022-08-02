//
//  NewsViewModel.swift
//  News
//
//  Created by TarıkOzturk on 2.08.2022.
//

import Foundation

class NewsViewModel {

    var newsList: [Article] = []

    func newsList(query: String, fromDate: String, toDate: String, sortBy: String, completion: @escaping(() -> Void)) {
        Services.newsList(query: query, fromDate: fromDate, toDate: toDate, sortBy: sortBy) { (result) in
            switch result {
            case .success(let response):
                if response.articles != nil {
                    self.newsList = response.articles!
                    completion()
                } else {
                    self.newsList = []
                    completion()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if newsList.count != 0 {
            return newsList.count
        }
        return 0
    }

    func cellForRowAt (indexPath: IndexPath) -> Article {
        return newsList[indexPath.row]
    }

    func didSelectedRowAt (indexPath: IndexPath) -> Article {
        return newsList[indexPath.row]
    }
}
