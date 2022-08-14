//
//  NewsRequestModel.swift
//  News
//
//  Created by TarıkOzturk on 2.08.2022.
//
import Foundation

class NewsListRequestModel: RequestModel {

    private let query: String
    private let fromDate: String
    private let toDate: String
    private let sortBy: String

    init(query: String, fromDate: String, toDate: String, sortBy: String) {
        self.query = query
        self.fromDate = fromDate
        self.toDate = toDate
        self.sortBy = sortBy
        super.init()
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }

    override var path: String {
        "\(APIKey.baseURL)?apikey=\(APIKey.apiKey)"
    }

    override var parameters: [String: Any?] {
        [
            "q": self.query,
            "from": self.fromDate,
            "to": self.toDate,
            "sortBy": self.sortBy
        ]
    }
}
