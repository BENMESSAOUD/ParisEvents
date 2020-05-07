//
//  HomeProtocols.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

//MARK: - communication PRESENTER -> VIEW
protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    func bindData(with model:HomeViewModel)
}

protocol HomeWireFrameProtocol: class {
    func createHomeModule() -> UINavigationController?
    func presentAlert(title: String, message: String)
}

//MARK: - communication VIEW -> PRESENTER
protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

//MARK: - communication INTERACTOR -> PRESENTER
protocol HomeInteractorOutputProtocol: class {
    func eventsDidRetrieved(_ events: [EventViewModel])
    func displayErrorMessage(title: String, message: String)
}

//MARK: - communication PRESENTER -> INTERACTOR
protocol HomeInteractorInputProtocol: class
{
    var presenter: HomeInteractorOutputProtocol? { get set }
    var apiDataManager: HomeAPIDataManagerInputProtocol? { get set }
    func getEvents()
}

//MARK: - communication INTERACTOR -> DATAMANAGER
protocol HomeAPIDataManagerInputProtocol: class
{
    var interactor: HomeRemoteDataManagerOutputProtocol? {get set}
    func fetchEvents()
}

//MARK: - communication DATAMANAGER -> INTERACTOR
protocol HomeRemoteDataManagerOutputProtocol: class {
    func onEventsRetrieved(_ events: Events)
    func onError(_ error: NSError)
}
