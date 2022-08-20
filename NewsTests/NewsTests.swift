//
//  NewsTests.swift
//  NewsTests
//
//  Created by TarıkOzturk on 24.07.2022.
//

@testable import News
import XCTest

class NewsTests: XCTestCase {

    func testSuccessParser() {
        let json = """
                {
                "articles": [
                {
                    "source": {
                        "id": null,
                        "name": "name"
                    },
                    "author": "author",
                    "title": "title",
                    "description": "description",
                    "url": "url",
                    "urlToImage": "urltoimage",
                    "publishedAt": "published",
                    "content": "content"
                }
                ]
                }
                """.data(using: .utf8)!

        let news = try! JSONDecoder().decode(Article.self, from: json)
        XCTAssertNotNil(news)
    }
}
