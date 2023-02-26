//
//  NewsInteractor.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

class NewsInteractor : NewsInteractorInputProtocol{
   
    weak var presenter: NewsInteractorOutputProtocol?

    private let remoteDatabaseManager = RemoteDatabaseManager()
    
    func getNews() {
        remoteDatabaseManager.getNews { [weak self] response, error in
            
            guard let self = self else {return}
            if let error = error {
                self.presenter?.newsFetchingFailed(error)
                
            } else if let response = response {
                
                let results = response.results
                self.presenter?.newsFetchedSuccessfully(results)
            }
            
        }
    }
    
}
