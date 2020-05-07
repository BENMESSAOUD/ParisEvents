//
//  HomeViewModel.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
struct HomeViewModel {
    let rows: [EventItemViewModel]
}
struct EventItemViewModel {
    let id: String
    let title: String?
    let category: String?
    let address: String?
}
