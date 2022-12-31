//
//  RequestMode.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 31/12/22.
//

import Foundation
//atributo para al hacer las llamadas a la API se le pasan las caracteristicas del request

struct RequestModel  {
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .youtube
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }
    
    enum Endpoints : String   {
        case search = "/search"
        case playlist = "/playlist"
        case channels = "/channels"
        case playlistItem = "/playlistItems"
        case empty = ""
    }
    
    enum URLBase : String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}
