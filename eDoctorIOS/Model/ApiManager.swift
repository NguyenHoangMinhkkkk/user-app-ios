//
//  Api.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 07/03/2022.
//

import Foundation

protocol ApiManagerDelegate {
    func didRequestApi(_ apiResponse: ApiResponseModel)
    func didFailWithError(_ error: Error)
}

struct UnknownType: Codable {}

struct ApiManager {
//    makeRequest
    let requestHandler = RequestHandler()

    func requestSmsSignIn(_ phoneNumber: String, completion: @escaping (Result<UnknownType, Error>) -> Void) {
        let requestBody = ["phoneNumber": phoneNumber]
        requestHandler.dataRequest(
            url: ApiConfig.smsSignIn.url,
            httpMethod: ApiConfig.smsSignIn.method,
            requestBody: requestBody)
        { (result: Result<UnknownType, Error>) in
                switch result {
                case .success(let data): completion(.success(data))
                case .failure(let error): completion(.failure(error))
                }
            }
    }

    func requestSmsVerify(_ phoneNumber: String, _ pinNumber: Int, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        let requestBody = ["phoneNumber": phoneNumber, "pinNumber": pinNumber] as [String: Any]
        requestHandler.dataRequest(
            url: ApiConfig.smsSignInVerify.url,
            httpMethod: ApiConfig.smsSignIn.method,
            requestBody: requestBody)
        { (result: Result<AccessToken, Error>) in
                switch result {
                case .success(let data): completion(.success(data))
                case .failure(let error): completion(.failure(error))
                }
            }
    }

    func requestAccountSummary(completion: @escaping (Result<Consumer, Error>) -> Void) {
        requestHandler.dataRequest(
            url: ApiConfig.accountSummary.url,
            httpMethod: ApiConfig.accountSummary.method,
            needAuth: true)
        { (result: Result<Consumer, Error>) in
                switch result {
                case .success(let data): completion(.success(data))
                case .failure(let error): completion(.failure(error))
                }
            }
    }
}
