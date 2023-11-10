//
//  Model.swift
//  Msigma Gokulam
//
//  Created by Vikash on 09/11/23.
//

import Foundation

struct APIResponse: Codable {
    var branches: [Branch]
}

struct Branch: Codable, Hashable{
    var id: Int
    var name: String
    var short: String
}
