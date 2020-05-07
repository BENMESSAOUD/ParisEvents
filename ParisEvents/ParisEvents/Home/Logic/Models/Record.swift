//
//  Record.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

struct Record: Codable {
    let id: String
    let datasetId: String
    let event: Event
    
    enum CodingKeys: String, CodingKey {
        case datasetId = "datasetid"
        case id = "recordid"
        case event = "fields"
    }
}
