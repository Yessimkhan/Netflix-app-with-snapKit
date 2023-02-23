//
//  YouTubeSearchResults.swift
//  Netflix
//
//  Created by Yessimkhan Zhumash on 30.11.2022.
//

import Foundation

 struct YouTubeSearchResponse: Codable{
    let items: [ViedeoElement]
}

struct  ViedeoElement: Codable{
    let id: IdViedeoElement
}
struct IdViedeoElement: Codable{
    let kind: String
    let videoId: String
}

