//
//  NewsCell.swift
//  News
//
//  Created by TarıkOzturk on 3.08.2022.
//

import Kingfisher
import UIKit

class NewsCell: UITableViewCell {

    static let newsCell = CellIdent.newsCell
    private let viewModel = NewsViewModel()

    let newsTitle = UILabel()
    let newsImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("\(ErrorCode.fatalInitError)")
    }

    func setCellWithValuesOf(_ news: Article) {
        updateUI(title: news.title, image: news.urlToImage)
    }

    private func updateUI(title: String?, image: String?) {

        guard let imageString = image else { return }
        let url = URL(string: imageString)
        self.newsImage.kf.setImage(with: url)
        self.newsTitle.text = title
    }
}
