//
//  TheMovieDatabaseApi.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public enum TheMovieDatabaseApi {
    case movie(String)
}

extension TheMovieDatabaseApi: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org")!
    }
    
    public var path: String {
        return "/3/search/movie"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .movie(let term):
            return .requestParameters(parameters: ["api_key": "$YOUR-API-KEY",
                                                   "language": "en-US",
                                                   "query": "\(term.urlEscaped)"],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
