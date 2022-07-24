//
//  MakeSplashView.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit
import SnapKit

extension SplashViewController {

    func configureView() {
        view.addSubview(activityIndicator)
        view.addSubview(appTitle)
        makeAppTitle()
        startLoading()
        view.backgroundColor = UIColor.blue
    }

    func makeActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }

    func makeAppTitle() {
        appTitle.text = "N E W S"
        appTitle.textColor = UIColor.yellow
        appTitle.font = .systemFont(ofSize: 70, weight: .bold )
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(72)
            make.centerX.equalTo(view.center.x)
        }
    }

    func startLoading() {
        makeActivityIndicator()
        activityIndicator.startAnimating()
    }

    func setTabBarController() {
        let tabbarViewController = UITabBarController()
        let viewController1 = UINavigationController(rootViewController: NewsViewController())
        let viewController2 = UINavigationController(rootViewController: BookMarkViewController())
        viewController1.title = Titles.newsTabTitle
        viewController2.title = Titles.bookMarkTabTitle
        tabbarViewController.setViewControllers([viewController1, viewController2], animated: false)

        guard let items = tabbarViewController.tabBar.items else { return }

        let images = [ViewSymbols.display, ViewSymbols.book]

        for item in 0..<items.count {
            items[item].image = UIImage(systemName: images[item])
        }

        tabbarViewController.modalPresentationStyle = .fullScreen
        tabbarViewController.tabBar.backgroundColor = CustomColor.backGroundColor
        tabbarViewController.tabBar.barTintColor = CustomColor.backGroundColor
        tabbarViewController.tabBar.tintColor = CustomColor.titleColor
        DispatchQueue.main.async {
            self.view.window?.rootViewController = tabbarViewController
        }
    }

}
