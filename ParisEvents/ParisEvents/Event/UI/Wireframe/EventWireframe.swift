//
//  EventWireframe.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

private enum EventUIIdentifier {
    static let eventController = "EventViewController"
    static let storyboard = "Event"
}

class EventWireframe: EventWireFrameProtocol {
    private var view: (EventViewController & EventViewProtocol)?
    private var presenter: (EventPresenterProtocol & EventInteractorOutputProtocol)?
    private var interactor: EventInteractorInputProtocol?
    
    private var EventStoryboard: UIStoryboard {
        return UIStoryboard(name: EventUIIdentifier.storyboard, bundle: Bundle.main)
    }
    
    func createEventModule(event: EventViewModel) -> UIViewController? {
        view = EventStoryboard.instantiateViewController(withIdentifier: EventUIIdentifier.eventController) as? EventViewController & EventViewProtocol
        presenter = EventPresenter()
        interactor = EventInteractor(with: event)
        
        // Connecting
        view?.presenter = presenter
        presenter?.view = view
        presenter?.wireFrame = self
        presenter?.interactor = interactor
        interactor?.presenter = presenter
    
        return view
    }
}
