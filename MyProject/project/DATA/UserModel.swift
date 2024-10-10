//
//  UserModel.swift
//  MyProject
//
//  Created by user on 10.10.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var fullname: String
    var phone: String
    var email: String
    var password: String
}
