//
//  ApiConfig.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 07/03/2022.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case patch
    case delete

    var method: String {
        switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .patch: return "PATCH"
            case .delete: return "DELETE"
        }
    }
}

// MARK: - AAAA

struct SignInSmsParam {
    let phoneNumber: String
}

struct SignInSmsVerifyParam {
    let phoneNumber: String
    let pinNumber: String
}

// MARK: - AAAA

enum ApiConfig {
    static var smsSignIn = (
        url: "https://user.api.e-doctor.dev/v1/auth/sign_in_sms_request",
        method: HTTPMethod.post,
        bodyType: SignInSmsParam.Type.self
    )

    static var smsSignInVerify = (
        url: "https://user.api.e-doctor.dev/v1/auth/sign_in_sms_verify?source=edoctor",
        method: HTTPMethod.post,
        bodyType: SignInSmsVerifyParam.Type.self
    )

    static var accountSummary = (
        url: "https://user.api.e-doctor.dev/v1/account/summary?detail=consumer",
        method: HTTPMethod.get
    )
}
