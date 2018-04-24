//
//  Song.swift
//  AlamofireLab
//
//  Created by Allen Huang on 2018/4/24.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import Foundation

struct SongResults: Codable {
    struct Song: Codable {
        var artistName: String
        var trackName: String
        var previewUrl: URL
        var artworkUrl100: URL
        var trackPrice: Double?
        var releaseDate: Date
    }
    var resultCount: Int
    var results: [Song]
}
