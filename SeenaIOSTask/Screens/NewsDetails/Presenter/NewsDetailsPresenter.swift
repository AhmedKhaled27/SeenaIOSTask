//
//  NewsDetailsPresenter.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

class NewsDetailsPresenter: NewsDetailsPresenterProtocol, NewsDetailsOutputInteractorProtocol {

    var view: NewsDetailsViewProtocol?
    private let interactor: NewsDetailsInputInteractorProtocol
    private let router: NewsDetailsRouter
    var newsDetails:NewsModel
    
    
    init(view: NewsDetailsViewProtocol, interactor: NewsDetailsInputInteractorProtocol, router: NewsDetailsRouter, newsDetails:NewsModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.newsDetails = newsDetails
    }
    
    func viewDidLoad() {
        view?.setupViews(with: newsDetails)
    }
    
    func tapOnImageView() {
        if let firstMedia = newsDetails.media.first,
           let firstMetaData = firstMedia.mediaMetadata.first {
            
            router.navigateToFullImageViewController(with: firstMetaData.url)

        }
    }
}
