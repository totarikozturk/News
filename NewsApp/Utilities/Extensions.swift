//
//  Extensions.swift
//  News
//
//  Created by TarıkOzturk on 15.08.2022.
//

import Foundation

// MARK: DateFormatter
extension DateFormatter {
    static var filterDateFormat: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }()
}
