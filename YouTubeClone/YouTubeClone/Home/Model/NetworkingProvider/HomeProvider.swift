//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 31/12/22.
//

import Foundation

protocol HomeProviderProtocol{
    
    func getVideos(searchString : String, channelId : String) async throws -> DataVideo
    func getChannels(channelId : String) async throws -> DataChannel
    func getPlaylist(channelId : String) async throws -> DataPlaylist
    func getPlaylistItems(playlistId : String) async throws -> DataPlaylistItems
}
class HomeProvider : HomeProviderProtocol {
    
    //método que conecta con la capa de servicio para crear la llamada a la api
    func getVideos(searchString : String, channelId : String) async throws -> DataVideo{
        
        var queryParams : [String : String] = ["part":"snippet"]
        if !channelId.isEmpty { //enviaste channel ID?? pues agregaselo, sino no agregues nada
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do {
            
            let model = try await ServiceLayer.callService(requestModel, DataVideo.self)
            return model
        }catch{
            print(error)
            throw error
        }
        
    }
    
    func getChannels(channelId: String) async throws -> DataChannel {
        
        let queryParams : [String : String] = ["part":"snippet, brandingSettings, statistics", "id": channelId]
        
        let requestModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        
        do {
            
            let model = try await ServiceLayer.callService(requestModel, DataChannel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    func getPlaylist(channelId: String) async throws -> DataPlaylist {
        let queryParams : [String : String] = ["part":"snippet, contentDetails", "channelId": channelId]
        
        let requestModel = RequestModel(endpoint: .playlist, queryItems: queryParams)
        
        do {
            
            let model = try await ServiceLayer.callService(requestModel, DataPlaylist.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    func getPlaylistItems(playlistId: String) async throws -> DataPlaylistItems {
        let queryParams : [String : String] = ["part":"id, snippet, contentDetails y status",
                                               "playlistId": playlistId
        ]
        
        let requestModel = RequestModel(endpoint: .playlistItem, queryItems: queryParams)
        
        do {
            
            let model = try await ServiceLayer.callService(requestModel, DataPlaylistItems.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    
}

