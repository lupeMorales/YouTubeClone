//
//  DataPlaylist.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 28/12/22.
//

import Foundation

// MARK: - DataPlaylist
struct DataPlaylist: Decodable {
    let kind, etag, nextPageToken: String
    let pageInfo: PageInfo
    let items: [Item]
    
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }

    // MARK: - Item
    struct Item: Decodable {
        let kind, etag, id: String
        let snippet: Snippet
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let publishedAt: Date
            let channelID, title, snippetDescription: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let localized: Localized

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelID = "channelId"
                case title
                case snippetDescription = "description"
                case thumbnails, channelTitle, localized
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let medium: Medium
               
                struct Medium: Decodable {
                    let url : String
                    let width : Int
                    let height : Int
                }
             
            }
            
            // MARK: - Localized
            struct Localized: Decodable {
                let title, localizedDescription: String

                enum CodingKeys: String, CodingKey {
                    case title
                    case localizedDescription = "description"
                }
            }
        }
    }
}









