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

    let newsTitle = UILabel()
    let newsImage = UIImageView()
    let favButton = UIButton()
    private var bookMarksdata: Article?

    var bookMarkAction: ((Article) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("\(ErrorCode.fatalInitError)")
    }

    @objc func favButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            favButton.setImage(UIImage(systemName: ViewSymbols.starFill), for: .selected)
        }
        bookMarkAction?(bookMarksdata!)
        AppManager.shared.favButtonTapped = true
    }

    func setCellWithValuesOf(_ news: Article) {
        self.bookMarksdata = news
        updateUI(title: news.title, image: news.urlToImage)
    }

    private func updateUI(title: String?, image: String?) {
        guard let imageString = image else { return }
        let url = URL(string: imageString)
        self.newsImage.kf.setImage(with: url)
        self.newsTitle.text = title
        self.favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
    }
}
