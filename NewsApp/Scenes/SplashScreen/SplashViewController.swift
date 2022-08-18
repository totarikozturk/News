//
//  ProgressViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 24.07.2022.
// Launch screen interface file base name changed with SplashViewController

import UIKit

class SplashViewController: UIViewController {

    let appTitle = UILabel()
    private let viewModel = SplashViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.registerForPushNotifications {
            DispatchQueue.main.async {
                self.setTabBarController()
            }
        }
    }
}
