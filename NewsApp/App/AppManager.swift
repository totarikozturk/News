//
//  AppManager.swift
//  News
//
//  Created by TarıkOzturk on 16.08.2022.
//

import Foundation

class AppManager {
    static let shared = AppManager()
    var bookmarksData: Article?
    var favButtonTapped = false
}
