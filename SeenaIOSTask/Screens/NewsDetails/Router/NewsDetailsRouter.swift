//
//  NewsDetailsRouter.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import UIKit

class NewsDetailsRouter: NewsDetailsRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createModule(with newsDetails:NewsModel) -> UIViewController {
        
        let view = NewsDetailsViewController()
        let router = NewsDetailsRouter()
        let interactor = NewsDetailsInteractor()
        
        let presenter = NewsDetailsPresenter(view: view, interactor: interactor, router: router, newsDetails: newsDetails)
        
        view.presenter = presenter
        router.view = view
        interactor.presenter = presenter
        
        return view
        
    }
    
    func navigateToFullImageViewController(with stringImageUrl: String) {
        let fullImageVc = FullImageVC()
        fullImageVc.stringImageUrl = stringImageUrl
        view?.navigationController?.pushViewController(fullImageVc, animated: true)
    }
}
 
