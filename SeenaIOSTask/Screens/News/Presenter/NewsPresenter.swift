//
//  NewsPresenter.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

class NewsPresenter : NewsPresenterProtocol ,NewsInteractorOutputProtocol{

    
    weak var view: NewsViewProtocol?
    private let interactor:NewsInteractorInputProtocol
    private let router:NewsRouterProtocol
    
    private var news = [NewsModel]()
    var numberOfRows : Int {
        return news.count
    }
    
    init(view: NewsViewProtocol, interactor: NewsInteractorInputProtocol, router: NewsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getNews()
    }
    
    func newsFetchedSuccessfully(_ news: [NewsModel]) {
        view?.hideLoadingIndicator()
        self.news = news
        view?.reloadTableView()
    }
    
    func newsFetchingFailed(_ error: Error) {
        view?.hideLoadingIndicator()
        view?.showAlertWithErrorMessage(error.localizedDescription)
        
    }
    
    func configure(cell: NewsTableViewCell, indexPath: IndexPath) {
        let news = news[indexPath.row]
        let viewModel = NewsViewModel(news: news)
        cell.configureCell(viewModel: viewModel)
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        router.navigateToNewsDetails(news[indexPath.row])
    }
    
    
}
