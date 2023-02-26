//
//  RemoteDatabaseManager.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation
import Alamofire

class RemoteDatabaseManager {
    
    func getNews(completionHandler: @escaping (_ response:NewsAPIResponse? ,_ error:Error?) -> ()){
        AF.request(APIConstants.newsUrl, method: .get, encoding: URLEncoding.default).response { response in
            
            switch response.result {
            case .success(let data):
                do{
                    let jsonDecoder = JSONDecoder()
                    let decodedData = try jsonDecoder.decode(NewsAPIResponse.self, from: data!)
                    completionHandler(decodedData, nil)
                }
                catch{
                    print(error.localizedDescription)
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
            
        }
        
    }
    
 }
