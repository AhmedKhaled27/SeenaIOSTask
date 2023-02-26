//
//  NewsDetailsProtocols.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

protocol NewsDetailsViewProtocol:AnyObject {
    var presenter : NewsDetailsPresenterProtocol? { get set }
    func setupNavigationTitle(with title:String)
    
}

protocol NewsDetailsPresenterProtocol:AnyObject {
    var view : NewsDetailsViewProtocol? { get set }
    func viewDidLoad()
    
}

protocol NewsDetailsRouterProtocol {
    
    
}

protocol NewsDetailsInputInteractorProtocol:AnyObject {
    var presenter: NewsDetailsOutputInteractorProtocol? { get set }
    
}

protocol NewsDetailsOutputInteractorProtocol {
    
    
}


