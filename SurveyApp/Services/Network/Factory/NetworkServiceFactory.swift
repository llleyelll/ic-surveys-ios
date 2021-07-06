//
//  NetworkServiceFactory.swift
//  SurveyApp
//
//  Created by Chananchida F. on 6/11/21.
//

import Foundation

final class NetworkServiceFactory {
    
    static let shared = NetworkServiceFactory()
    var api: API!

    func setup() {
        let keychain = KeychainStorage.default

        let userSession = UserSession(keychain: keychain)
        UserSessionProvider.shared.userSession = userSession

        self.api = BaseAPI(userSession: userSession)
    }
    
    func createAuthenticationService() -> AuthenticationServiceProtocol {
        AuthenticationService(api: api, baseURL: Constants.Network.baseUrl)
    }
    
    func createSurveyService() -> SurveyServiceProtocol {
        SurveyService(api: api, baseURL: Constants.Network.baseUrl)
    }
}
