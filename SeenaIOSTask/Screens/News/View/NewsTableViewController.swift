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
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }

    //MARK: - Helper Functions
    private func setupTableView(){
        self.title = "News"
        self.tableView.register(UINib(nibName:newsTableViewCell , bundle: nil), forCellReuseIdentifier: newsTableViewCell)
        
    }
    
    private func setupNavigationController(){
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func showLoadingIndicator() {
        self.showIndicator()
    }
    
    func hideLoadingIndicator() {
        self.hideIndicator()
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showAlertWithErrorMessage(_ errorMessage: String) {
        let alert = UIAlertController(title: "Senna", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/5
    }

}
