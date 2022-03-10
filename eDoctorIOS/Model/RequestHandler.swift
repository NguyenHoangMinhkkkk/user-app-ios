//
//  RequestHandler.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 07/03/2022.
//

import Foundation
import UIKit

struct RequestHandler {
    func dataRequest<T: Codable>(
        url: String,
        httpMethod: HTTPMethod,
        requestBody: [String: Any]? = nil,
        needAuth: Bool? = false,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        let dataURL = URL(string: url)!
        let session = URLSession.shared
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if needAuth == true {
            let data = KeychainHelper.standard.read(service: KeyChainConst.KeyChainLoginService, loginMethod: KeyChainConst.EdoctorSmsLogin)!
            if let accessToken = String(data: data, encoding: .utf8) {
                request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            }
        }
        request.httpMethod = httpMethod.method

        if httpMethod.method != HTTPMethod.get.method, let safeBody = requestBody { // get method must not have request body
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: safeBody, options: [])
            } catch {
                completion(.failure(NSError(domain: "Unknown Error at body set", code: -100001, userInfo: nil)))
                return
            }
        }
        let task = session.dataTask(with: request, completionHandler: { data, _, error in
            guard error == nil else {
                completion(.failure(NSError(domain: "Unknown Error after task start", code: -100001, userInfo: nil)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "dataNilError", code: -100001, userInfo: nil)))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        })

        task.resume()
    }
}
