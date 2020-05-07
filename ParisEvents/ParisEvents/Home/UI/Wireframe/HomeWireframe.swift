//
//  HomeWireframe.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Foundation
import UIKit

private enum HomeUIIdentifier {
    static let navigationController = "HomeNavigationController"
    static let storyboard = "Home"
}

class HomeWireframe: HomeWireFrameProtocol {
    private var navController: UINavigationController?
    private var view: (HomeTableViewController & HomeViewProtocol)?
    private var presenter: (HomePresenterProtocol & HomeInteractorOutputProtocol)?
    private var interactor: HomeInteractorInputProtocol?
    private var apiDataManager: HomeAPIDataManagerInputProtocol?
    
    private var HomeStoryboard: UIStoryboard {
        return UIStoryboard(name: HomeUIIdentifier.storyboard, bundle: Bundle.main)
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        navController?.present(alertController, animated: true, completion: nil)
    }
    
    func presentEventDetails(_ event: EventViewModel) {
        if let detailModule = EventWireframe().createEventModule(event: event) {
            navController?.pushViewController(detailModule, animated: true)
        }
    }
    
    func createHomeModule() -> UINavigationController? {
        navController = HomeStoryboard.instantiateViewController(withIdentifier: HomeUIIdentifier.navigationController) as? UINavigationController
        view = navController?.topViewController as? HomeTableViewController & HomeViewProtocol
        presenter = HomePresenter()
        interactor = HomeInteractor()
        apiDataManager = HomeAPIDataManager()
        
        // Connecting
        view?.presenter = presenter
        presenter?.view = view
        presenter?.wireFrame = self
        presenter?.interactor = interactor
        interactor?.presenter = presenter
        interactor?.apiDataManager = apiDataManager
        apiDataManager?.interactor = interactor as? HomeRemoteDataManagerOutputProtocol
        return navController
    }
}
