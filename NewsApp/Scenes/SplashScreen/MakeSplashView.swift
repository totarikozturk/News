//
//  MakeSplashView.swift
//  Movies
//
//  Created by TarıkOzturk on 24.07.2022.
//

import SnapKit
import UIKit

extension SplashViewController {

    func configureView() {
        view.addSubview(appTitle)
        makeAppTitle()
        view.backgroundColor = CustomColor.backGroundColor
    }

    func makeAppTitle() {
        appTitle.text = "Splash.appTitle".localized
        appTitle.textColor = CustomColor.titleColor
        appTitle.font = .systemFont(ofSize: 72, weight: .bold )
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(72)
            make.centerX.equalTo(view.center.x)
        }
    }

    func setTabBarController() {
        let tabbarViewController = UITabBarController()
        let viewController1 = UINavigationController(rootViewController: NewsViewController())
        let viewController2 = UINavigationController(rootViewController: BookMarkViewController())
        viewController1.title = "Home.newsTabTitle".localized
        viewController2.title = "Home.bookMarkTabTitle".localized
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
