//
//  News.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import Foundation

// MARK: - Welcome
struct NewsAPIResponse: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [NewsModel]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct NewsModel: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let publishedDate, updated, section, subsection, source: String
    let nytdsection, adxKeywords: String
    let byline: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection, source
        case adxKeywords = "adx_keywords"
        case byline, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

//NewsViewModel
struct NewsViewModel {
    
    var title : String
    var publishedBy : String
    var publishedDate : String
    var imageUrl : URL?
        
    init(news:NewsModel) {
        title = news.title
        publishedBy = news.byline
        publishedDate = news.publishedDate
        
        if let firstMedia = news.media.first,
           let firstMetaData = firstMedia.mediaMetadata.first,
           let url = URL(string: firstMetaData.url) {
            
            imageUrl = url
            
        }
    }
}
// MARK: - Media
struct Media: Codable {
    let caption, copyright: String
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case caption, copyright
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let height, width: Int
}




