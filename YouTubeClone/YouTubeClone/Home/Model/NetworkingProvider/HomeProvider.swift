//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 31/12/22.
//

import Foundation

class HomeProvider {
    
    //método que conecta con la capa de servicio para crear la llamada a la api
    func getVideo(searchString : String, channelId : String) async throws -> DataVideo{
        
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
}

