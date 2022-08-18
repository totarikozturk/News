//
//  AppManager.swift
//  News
//
//  Created by TarıkOzturk on 16.08.2022.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    var bookmarksData: Article?
    var favButtonTapped = false
}
