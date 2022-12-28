//
//  DataVideo.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 28/12/22.
//

import Foundation

// MARK: - DataVideo
struct DataVideo: Codable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
    
    // MARK: - PageInfo
    struct PageInfo: Codable {
        let totalResults, resultsPerPage: Int
    }

    
    // MARK: - Item
    struct Item: Codable {
        let kind, etag, id: String
        let snippet: Snippet
        
        // MARK: - Snippet
        struct Snippet: Codable {
            let publishedAt: Date
            let channelID, title, snippetDescription: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let tags: [String]
            let categoryID, liveBroadcastContent: String
            let localized: Localized
            let defaultAudioLanguage: String

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelID = "channelId"
                case title
                case snippetDescription = "description"
                case thumbnails, channelTitle, tags
                case categoryID = "categoryId"
                case liveBroadcastContent, localized, defaultAudioLanguage
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Codable {
                let medium: Medium
               
                struct Medium: Codable {
                    let url : String
                    let width : Int
                    let height : Int
                }
             
            }
            
            // MARK: - Localized
            struct Localized: Codable {
                let title, localizedDescription: String

                enum CodingKeys: String, CodingKey {
                    case title
                    case localizedDescription = "description"
                }
            }
        }
    }
}










