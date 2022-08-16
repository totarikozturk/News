//
//  Constant.swift
//  Movies
//
//  Created by TarıkOzturk on 24.07.2022.
//

import UIKit

enum CellIdent {
    static let newsCell = "NewsCell"
    static let bookMarkCell = "BookMarkCell"
}

enum ViewSymbols {
    static let display = "display"
    static let book = "book"
    static let star = "star"
    static let starFill = "star.fill"
}

enum CustomColor {
    static let backGroundColor = UIColor(named: "BackgroundColor")
    static let textColor = UIColor(named: "TextColor")
    static let titleColor = UIColor(named: "TitleColor")
    static let contentViewColor = UIColor(named: "ContentColor")
    static let rateColor = UIColor(named: "RateColor")
}

enum ErrorCode {
    static let dataTaskError = "DataTask error:"
    static let responseError = "Empty Response"
    static let responseStatusCode = "Response status code:"
    static let emptyData = "Empty Data"
    static let errorProcessingJson = "Error processing json data:"
    static let fatalInitError = "has not been implemented"
}

struct UserdefaultsCode {
    static let codableKey = "CodableKey"
}
