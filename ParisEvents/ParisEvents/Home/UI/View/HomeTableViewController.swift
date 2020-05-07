//
//  HomeTableViewController.swift
//  ParisEvents
//
//  Created by Mahmoud BEN MESSAOUD on 07/05/2020.
//  Copyright © 2020 BENMESSAOUD. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, HomeViewProtocol {
    //MARK: - Public properties
    var presenter: HomePresenterProtocol?
    
    //MARK: - Private properties
    var rows = [EventItemViewModel]()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    //MARK: - HomeViewProtocol implementation
    func bindData(with model:HomeViewModel) {
        self.rows = model.rows
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventTableViewCell
        cell?.configure(with: item)
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = rows[indexPath.row]
        presenter?.eventItemDidSelected(item)
    }

    

}
