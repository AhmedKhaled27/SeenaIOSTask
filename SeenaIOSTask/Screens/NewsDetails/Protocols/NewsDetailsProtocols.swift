//
//  NewsDetailsProtocols.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

protocol NewsDetailsViewProtocol:AnyObject {
    var presenter : NewsDetailsPresenterProtocol? { get set }
    func setupViews(with newsDetails:NewsModel)
    
}

protocol NewsDetailsPresenterProtocol:AnyObject {
    var view : NewsDetailsViewProtocol? { get set }
    func viewDidLoad()
    func tapOnImageView()
    
}

protocol NewsDetailsRouterProtocol {
    func navigateToFullImageViewController(with stringImageUrl:String)
    
}

protocol NewsDetailsInputInteractorProtocol:AnyObject {
    var presenter: NewsDetailsOutputInteractorProtocol? { get set }
    
}

protocol NewsDetailsOutputInteractorProtocol {
    
    
}


