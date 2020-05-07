//
//  EventProtocols.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

//MARK: - communication PRESENTER -> VIEW
protocol EventViewProtocol: class {
    var presenter: EventPresenterProtocol? { get set }
    func bindData(with model:EventViewModel)
}

protocol EventWireFrameProtocol: class {
    func createEventModule() -> UINavigationController?
    func presentAlert(title: String, message: String)
}

//MARK: - communication VIEW -> PRESENTER
protocol EventPresenterProtocol: class {
    var view: EventViewProtocol? { get set }
    var interactor: EventInteractorInputProtocol? { get set }
    var wireFrame: EventWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

//MARK: - communication INTERACTOR -> PRESENTER
protocol EventInteractorOutputProtocol: class {
    func eventsDidRetrieved(_ events: [EventViewModel])
    func displayErrorMessage(title: String, message: String)
}

//MARK: - communication PRESENTER -> INTERACTOR
protocol EventInteractorInputProtocol: class
{
    var presenter: EventInteractorOutputProtocol? { get set }
    var apiDataManager: EventAPIDataManagerInputProtocol? { get set }
    func getEvents()
}

//MARK: - communication INTERACTOR -> DATAMANAGER
protocol EventAPIDataManagerInputProtocol: class
{
    var interactor: EventRemoteDataManagerOutputProtocol? {get set}
    func fetchEvents()
}

//MARK: - communication DATAMANAGER -> INTERACTOR
protocol EventRemoteDataManagerOutputProtocol: class {
    func onEventsRetrieved(_ events: Events)
    func onError(_ error: NSError)
}
