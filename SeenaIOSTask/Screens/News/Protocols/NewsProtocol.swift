//
//  NewsProtovol.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

protocol NewsViewProtocol : AnyObject{
    var presenter:NewsPresenterProtocol? { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadTableView()
    func showAlertWithErrorMessage(_ errorMessage : String)
    
}

protocol NewsPresenterProtocol : AnyObject {
    var view:NewsViewProtocol? { get set }
    var numberOfRows:Int { get }
    func viewDidLoad()
    
    func configure(cell:NewsTableViewCell, indexPath:IndexPath)
    func didSelectCell(at indexPath:IndexPath)
    
}

protocol NewsRouterProtocol {
    func navigateToNewsDetails(_ news:NewsModel)
}

protocol NewsInteractorInputProtocol : AnyObject {
    var  presenter:NewsInteractorOutputProtocol? { get set }
    func getNews()

}

protocol NewsInteractorOutputProtocol : AnyObject {
    func newsFetchedSuccessfully(_ news:[NewsModel])
    func newsFetchingFailed(_ error: Error)
}

protocol NewsCellView {
    func configureCell(viewModel:NewsViewModel)
}
