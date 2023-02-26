//
//  NewsRouter.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import UIKit


class NewsRouter : NewsRouterProtocol {

    weak var viewController:UIViewController?
    
    static func createModule() -> UIViewController {
        let view = NewsTableViewController.init()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        let presenter = NewsPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view 
    }
    
    func navigateToNewsDetails(_ news: NewsModel) {
        let newsDetailsView = NewsDetailsRouter.createModule(with: news)
        viewController?.navigationController?.pushViewController(newsDetailsView, animated: true)
    }
}
