//
//  NewsDetailViewController.swift
//  News
//
//  Created by TarıkOzturk on 24.07.2022.
//

import UIKit

class NewsDetailViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let newsImage = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let descriptionLabel = UILabel()
    let contentLabel = UILabel()

    private let newsData: Article

    init(newsData: Article) {
        self.newsData = newsData
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        updateDetailUI()
    }

    // MARK: updateDetailUI
    func updateDetailUI() {
        let news = self.newsData
        guard let imageUrl = news.urlToImage else { return }
        let url = URL(string: imageUrl)
        newsImage.kf.setImage(with: url)
        titleLabel.text = news.title
        authorLabel.text = news.author
        descriptionLabel.text = news.articleDescription
        contentLabel.text = news.content
    }
}
