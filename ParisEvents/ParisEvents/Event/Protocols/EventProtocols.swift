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
    func createEventModule(event: EventViewModel) -> UIViewController?
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
    func updateViewModel(_ model: EventViewModel)
}

//MARK: - communication PRESENTER -> INTERACTOR
protocol EventInteractorInputProtocol: class
{
    var presenter: EventInteractorOutputProtocol? { get set }
    func getViewModel()
}
