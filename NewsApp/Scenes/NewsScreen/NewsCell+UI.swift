//
//  MakeNewsCell.swift
//  News
//
//  Created by TarıkOzturk on 3.08.2022.
//

import SnapKit
import UIKit

extension NewsCell {

// MARK: configure
    func configure() {
        drawDesign()
        makeNewsImage()
        makeNewsTitle()
    }

// MARK: drawDesign
    func drawDesign() {
        contentView.backgroundColor = CustomColor.contentViewColor
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        backgroundColor = CustomColor.backGroundColor
        addSubview(newsImage)
        addSubview(newsTitle)
    }

// MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 8.0
        self.contentView.frame = self.contentView.frame.inset(by:
                                                 UIEdgeInsets(top: 0,
                                                              left: 0,
                                                              bottom: bottomSpace,
                                                              right: 0))
    }

// MARK: makeNewsImage
    func makeNewsImage() {
        newsImage.layer.cornerRadius = 16
        newsImage.clipsToBounds = true
        newsImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-52)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

// MARK: makeNewsTitle
    func makeNewsTitle() {
        newsTitle.lineBreakMode = .byTruncatingTail
        newsTitle.numberOfLines = 2
        newsTitle.textAlignment = .left
        newsTitle.minimumScaleFactor = 1
        newsTitle.adjustsFontSizeToFitWidth = true
        newsTitle.textColor = CustomColor.textColor
        newsTitle.font = .boldSystemFont(ofSize: 16)
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottomMargin).offset(8)
            make.left.equalTo(newsImage.snp.left).offset(12)
            make.right.equalToSuperview()
        }
    }
}
