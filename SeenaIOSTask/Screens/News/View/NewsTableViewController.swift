//
//  AllNewsTableViewController.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import UIKit

class NewsTableViewController: UITableViewController ,NewsViewProtocol {

    //MARK: - Properites
    private let newsTableViewCell = "NewsTableViewCell"
    var presenter: NewsPresenterProtocol?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter?.viewDidLoad()
        
    }

    //MARK: - Helper Functions
    func setupTableView(){
        self.title = "News"
        self.tableView.register(UINib(nibName:newsTableViewCell , bundle: nil), forCellReuseIdentifier: newsTableViewCell)
        
    }
    
    func showLoadingIndicator() {
        self.showIndicator()
    }
    
    func hideLoadingIndicator() {
        self.hideIndicator()
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

// MARK: - Table view delegate - data source
extension NewsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presenter?.numberOfRows ?? 0
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCell , for: indexPath) as! NewsTableViewCell
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
                    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/5
    }

}
