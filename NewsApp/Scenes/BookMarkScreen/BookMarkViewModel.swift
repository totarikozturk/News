//
//  BookMarkViewModel.swift
//  News
//
//  Created by TarıkOzturk on 16.08.2022.
//

import Foundation

class BookMarkViewModel {

    private var bookMarksArray: [Article] = []

    func addBookmark() {
        guard let data = Singleton.shared.bookmarksData else { return }
        if  Singleton.shared.favButtonTapped {
            if self.bookMarksArray.isEmpty {
                self.bookMarksArray.append(data)
                save()
            } else {
                if self.bookMarksArray.contains(where: { $0.title == data.title }) {
                    Singleton.shared.favButtonTapped = false
                } else {
                   self.bookMarksArray.append(data)
                    save()
                    Singleton.shared.favButtonTapped = false
                }
            }
            Singleton.shared.favButtonTapped = false
        }
    }

    func save() {
        guard let data = try? JSONEncoder().encode(bookMarksArray) else { return }
        UserDefaults.standard.set(data, forKey: UserdefaultsCode.codableKey)
    }

    func load() {
        guard let loadedData = UserDefaults.standard.data(forKey: UserdefaultsCode.codableKey)  else { return }
        do {
            bookMarksArray = try JSONDecoder().decode([Article].self, from: loadedData)
        } catch { print(error) }
    }

    func numberOfRowsInSection(section: Int) -> Int {
            bookMarksArray.count
    }

    func cellForRowAt (indexPath: IndexPath) -> Article {
        bookMarksArray[indexPath.row]
    }

    func didSelectedRowAt (indexPath: IndexPath) -> Article {
        bookMarksArray[indexPath.row]
    }
}
