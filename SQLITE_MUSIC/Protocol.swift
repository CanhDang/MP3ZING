//
//  Protocol.swift
//  SQLITE_MUSIC
//
//  Created by HoangHai on 9/6/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import Foundation
import CoreGraphics

enum Type {
    case SONGS
    case ALBUMS
    case ARTISTS
    case PLAYLIST
    case GENRE
    case CELL
    case NONE
}

@objc protocol SelectedItem {
    optional func selectedOrder(id: Int)
}