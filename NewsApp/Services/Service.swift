//
//  Service.swift
//  News
//
//  Created by TarıkOzturk on 2.08.2022.
//

import Alamofire

public class Services {

    class func newsList(query: String,
                        fromDate: String,
                        toDate: String,
                        completion: @escaping(Swift.Result<NewsListResponseModel, AFError>) -> Void) {
        ServiceManager.shared.sendRequest(request: NewsListRequestModel(query: query,
                                 fromDate: fromDate,
                                 toDate: toDate)) { result in
            completion(result)
        }
    }
}
