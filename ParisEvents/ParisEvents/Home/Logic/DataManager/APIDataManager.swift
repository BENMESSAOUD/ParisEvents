//
//  APIDataManager.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation

class HomeAPIDataManager: HomeAPIDataManagerInputProtocol {
    //MARK: - Public properties
    var interactor: HomeRemoteDataManagerOutputProtocol?
    
    //MARK: - private properties:
    let service: EventsServiceProtocol
    let decoder: JSONDecoder
    
    //MARK: - life cycle
    init(service: EventsServiceProtocol = EventsService(), decoder: JSONDecoder = JSONDecoder()) {
        self.service = service
        self.decoder = decoder
    }
    
    //MARK: - HomeAPIDataManagerInputProtocol
    func fetchEvents() {
        service.fetchEvents { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    let events = try self.decoder.decode(Events.self, from: data)
                    self.interactor?.onEventsRetrieved(events)
                } catch  {
                    self.interactor?.onError(error as NSError)
                }
            case .failure(let error):
                 self.interactor?.onError(error)
            }
        }
    }
    
}
