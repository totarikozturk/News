//
//  NewsDetailViewController+UI.swift
//  News
//
//  Created by TarıkOzturk on 15.08.2022.
//

import SnapKit
import UIKit

extension NewsDetailViewController {

    // MARK: configureView
    func configureView() {
        drawDesign()
        makeNewsImage()
        makeTitleLabel()
        makeAuthorLabel()
        makeDescriptionLabel()
        makeContentLabel()
        navigationBarAppearance()
    }

    // MARK: drawDesign
    func drawDesign() {
        view.addSubview(newsImage)
        view.addSubview(titleLabel)
        view.addSubview(authorLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(contentLabel)
        view.backgroundColor = CustomColor.contentViewColor
    }

    // MARK: makeNewsImage
    func makeNewsImage() {
        newsImage.layer.cornerRadius = 16
        newsImage.clipsToBounds = true
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-500)
        }
    }

    // MARK: makeTitleLabel
    func makeTitleLabel() {
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.minimumScaleFactor = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = CustomColor.textColor
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

    // MARK: makeAuthorLabel
    func makeAuthorLabel() {
        authorLabel.lineBreakMode = .byWordWrapping
        authorLabel.numberOfLines = 0
        authorLabel.textAlignment = .left
        authorLabel.minimumScaleFactor = 1
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.textColor = CustomColor.textColor
        authorLabel.font = .boldSystemFont(ofSize: 14)
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

    // MARK: makeDescriptionLabel
    func makeDescriptionLabel() {
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.minimumScaleFactor = 1
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textColor = CustomColor.textColor
        descriptionLabel.font = .boldSystemFont(ofSize: 14)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

    // MARK: makeContentLabel
    func makeContentLabel() {
        contentLabel.lineBreakMode = .byTruncatingTail
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .natural
        contentLabel.minimumScaleFactor = 1
        contentLabel.adjustsFontSizeToFitWidth = true
        contentLabel.textColor = CustomColor.textColor
        contentLabel.font = .systemFont(ofSize: 12)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

    // MARK: navigationBarAppearance
    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationController?.navigationBar.tintColor = CustomColor.titleColor
    }
}
