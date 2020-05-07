//
//  HomeInteractor.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
class HomeInteractor: HomeInteractorInputProtocol, HomeRemoteDataManagerOutputProtocol {
    var presenter: HomeInteractorOutputProtocol?
    var apiDataManager: HomeAPIDataManagerInputProtocol?
    
    func getEvents() {
        apiDataManager?.fetchEvents()
    }
    
    func onEventsRetrieved(_ events: Events) {
        let eventsViewModel = events.records.map({ EventViewModel(from: $0.event) })
        presenter?.eventsDidRetrieved(eventsViewModel)
    }
    
    func onError(_ error: NSError) {
        let errorMessage = "An error was occured when fetching events. code: \(error.code)"
        presenter?.displayErrorMessage(title: "Error", message: errorMessage)
    }
}

extension Event {
    var address: String {
        return "\(addressStreet)\n\(addressZipcode), \(addressCity)"
    }
}

extension EventViewModel {
    init(from event: Event) {
        title = event.title
        address = event.address
        if let coverUrl = event.coverURL, let url = URL(string: coverUrl) {
            cover = url
        } else {
            cover = nil
        }
        category = event.category
        description = event.eventDescription
    }
}
