//
//  ConsumerModel.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 09/03/2022.
//

import Foundation
import UIKit

struct Consumer: Codable {
    var consumer: ConsumerData?
}

struct ConsumerData: Codable {
    var email: String?
    var id: String?
    var profiles: [Profile]?
}

struct Profile: Codable {
    var id: String = ""
    var avatar: Avatar?
    var birthDate_date: Int = 0
    var birthDate_month: Int = 0
    var birthDate_year: Int = 0
    var gender: String = ""
    var relation: String = ""
    var fullName: String = ""
    var phoneNumber: String?
}

struct Avatar: Codable {
    var id: String = ""
    var versions: Version?
}

struct Version: Codable {
    var original: Original?
}

struct Original: Codable {
    var url: String?
}
