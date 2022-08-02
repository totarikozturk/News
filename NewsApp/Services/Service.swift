//
//  Service.swift
//  News
//
//  Created by TarıkOzturk on 2.08.2022.
//

import Alamofire
import Darwin

public class Services {

    class func newsList(query: String,
                        fromDate: String,
                        toDate: String,
                        sortBy: String,
                        completion:@escaping(Swift.Result<NewsListResponseModel, AFError>) -> Void) {
        ServiceManager.shared.sendRequest(request: NewsListRequestModel(query: query,
                                 fromDate: fromDate,
                                 toDate: toDate,
                                 sortBy: sortBy )) { (result) in
            completion(result)
        }
    }
}
