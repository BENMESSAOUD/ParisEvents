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
    
    func viewDidLoad() {
        interactor?.getEvents()
    }
    
    func eventsDidRetrieved(_ events: [EventViewModel]) {
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
        title = event.title
        address = event.address
        category = event.category
    }
}
