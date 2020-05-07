//
//  HomePresenter.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    private var events =  [EventViewModel]()
    
    //MARK: - HomePresenterProtocol
    func viewDidLoad() {
        interactor?.getEvents()
    }
    
    func eventItemDidSelected(_ item: EventItemViewModel) {
        if let eventModel = events.first(where: { $0.id == item.id }) {
            wireFrame?.presentEventDetails(eventModel)
        }
    }
    
    //MARK: - HomeInteractorOutputProtocol
    func eventsDidRetrieved(_ events: [EventViewModel]) {
        self.events = events
        let rows = events.map({ EventItemViewModel(from: $0) })
        let viewModel = HomeViewModel(rows: rows)
        view?.bindData(with: viewModel)
    }
    
    func displayErrorMessage(title: String, message: String) {
        wireFrame?.presentAlert(title: title, message: message)
    }
}

extension EventItemViewModel {
    init(from event: EventViewModel) {
        id = event.id
        title = event.title
        address = event.address
        category = event.category
    }
}
