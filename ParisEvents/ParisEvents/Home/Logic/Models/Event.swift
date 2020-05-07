//
//  Event.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation

struct Event: Codable {
    let addressStreet: String
    let id: String
    let category: String
    let title: String
    let addressName: String
    let eventDescription: String
    let coverURL: String?
    let addressCity: String
    let addressZipcode: String

    enum CodingKeys: String, CodingKey {
        case addressStreet = "address_street"
        case id, category, title
        case addressName = "address_name"
        case eventDescription = "description"
        case coverURL = "cover_url"
        case addressCity = "address_city"
        case addressZipcode = "address_zipcode"
    }
}
