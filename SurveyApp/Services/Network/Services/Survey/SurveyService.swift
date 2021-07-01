//
//  SurveyService.swift
//  SurveyApp
//
//  Created by Chananchida F. on 6/24/21.
//

import Alamofire

// sourcery: AutoMockable
protocol SurveyServiceProtocol {
    
    func fetchSurveys(
        pageNumber: Int,
        pageSize: Int,
        completion: @escaping RequestCompletion<SurveyResponse>
    ) -> Request?
    
    func fetchSurveyDetail(
        id: String,
        completion: @escaping RequestCompletion<SurveyDetailResponse>
    ) -> Request?
}

final class SurveyService: NetworkService, SurveyServiceProtocol {
    
    func fetchSurveys(pageNumber: Int, pageSize: Int, completion: @escaping RequestCompletion<SurveyResponse>) -> Request? {
        let configuration = RequestConfiguration(
            method: .get,
            url: url(forEndpoint: "/api/v1/surveys"),
            parameters: [
                "page[number]": pageNumber,
                "page[size]": pageSize
            ],
            parameterEncoding: URLEncoding.default
        )
        
        return api.performRequest(with: configuration, completion: completion)
    }
    
    func fetchSurveyDetail(id: String, completion: @escaping RequestCompletion<SurveyDetailResponse>) -> Request? {
        let configuration = RequestConfiguration(
            method: .get,
            url: url(forEndpoint: "/api/v1/surveys/\(id)")
        )
        
        return api.performRequest(with: configuration, completion: completion)
    }
}
