//
//  EventPresenter.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation

class EventPresenter: EventPresenterProtocol, EventInteractorOutputProtocol {
    var view: EventViewProtocol?
    var interactor: EventInteractorInputProtocol?
    var wireFrame: EventWireFrameProtocol?
    
    //MARK: EventPresenterProtocol
    func viewDidLoad() {
        interactor?.getViewModel()
    }
    
    //MARK: - EventInteractorOutputProtocol
    func updateViewModel(_ model: EventViewModel) {
        view?.bindData(with: model)
    }

}
