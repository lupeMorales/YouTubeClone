//
//  DataPlaylistItem.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 28/12/22.
//

import Foundation

struct DataPlaylistItems: Decodable{
    let kind: String
    let etag: String
    let items: [Item]
    let pageInfo : PageInfo
    
    struct Item: Decodable{
        let kind : String
        let etag : String
        let id : String
        //let snippet : VideoModel.Item.Snippet
        let contentDetails : ContentDetails?
        
        struct ContentDetails: Decodable{
            let videoId : String?
            let videoPublishedAt : String?
        }
    }
    
    struct PageInfo: Decodable{
        let totalResults: Int
        let resultsPerPage: Int
    }
}
