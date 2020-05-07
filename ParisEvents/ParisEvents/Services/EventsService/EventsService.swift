//
//  EventsServices.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import Alamofire
import Foundation

protocol EventsServiceProtocol {
    /**
    Fetch all events
    */
    func fetchEvents(completion: @escaping (Swift.Result<Data, NSError>) -> Void)
}

 /**
 This class is responsible to fetch all events from server
 */
class EventsService: EventsServiceProtocol {
    
    //MARK: - EventsServiceProtocol implementation
    func fetchEvents(completion: @escaping (Swift.Result<Data, NSError>) -> Void) {
        guard let url = URL(string: Endpoints.getEvents) else {
            let error = NSError(domain: "BAD_REQUEST", code: 1, userInfo: ["message" : "Wrong url format"])
            completion(.failure(error))
            return
        }
        
        let request = Alamofire.AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                
                completion(.failure(error as NSError))
            }
        }
        request.resume()
    }
}

private enum Endpoints {
    static let getEvents: String = "https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=&facet=category&facet=tags&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf&facet=access_type&facet=price_type"
}
