//
//  EventInteractor.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
class EventInteractor: EventInteractorInputProtocol {
    private let event: EventViewModel
    
    var presenter: EventInteractorOutputProtocol?
    init(with event: EventViewModel) {
        self.event = event
    }
    
    //MARK: - EventInteractorInputProtocol
    func getViewModel() {
        presenter?.updateViewModel(event)
    }
    
}
