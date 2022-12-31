//
//  HomePresenter.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 31/12/22.
//

import Foundation

protocol HomeViewProtocol : AnyObject{
    
    func getData(list : [[Any]])
}

class HomePresenter {
    
    var provider : HomeProviderProtocol
    weak var delegate : HomeViewProtocol?
    private var objectList : [[Any]] = []
    
    init(delegate : HomeViewProtocol, provider : HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    func getVideos() async{
        objectList.removeAll()
        
        do{
            let channel = try await provider.getChannels(channelId: Constants.channelId).items
            let playlist = try await provider.getPlaylist(channelId: Constants.channelId).items
            let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
            let playlistItems = try await provider.getPlaylistItems(playlistId: playlist.first?.id ?? "").items
            
            objectList.append(channel)
            objectList.append(playlistItems)
            objectList.append(videos)
            objectList.append(playlist)
            
        }catch {
            print(error)
        }
        
    }
}


