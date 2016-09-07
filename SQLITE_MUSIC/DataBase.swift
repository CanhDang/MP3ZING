//
//  DataBase.swift
//  SQLITE_MUSIC
//
//  Created by HoangHai on 8/30/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import Foundation

class DataBase{
    class var sharedInstance: DataBase{
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: DataBase? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DataBase()
        }
        return Static.instance!
    }
    var dataBasePath = NSString()
    
    init(){
        getPath()

        if (createDataBase() == true) {
            insertNewValuesToTables()
        }
    }
    
    func insertNewValuesToTables(){
        
        //ALBUM
        
        insertDatabase("ALBUMS", dict: ["Price":"200,000", "AlbumName":"Anh Bỏ Thuốc EM Sẽ Yêu","ReleaseDate":"11/1/2015", "UrlImg":"Anh Bỏ Thuốc Em Sẽ Yêu - Lyna Thùy Linh.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"350,000", "AlbumName":"Anh Cứ Đi Đi", "ReleaseDate":"12/02/2014", "UrlImg":"Anh Cứ Đi Đi.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"450,000", "AlbumName":"Bí Mật Bị Thời Gian Vùi Lấp", "ReleaseDate":"22/05/2014", "UrlImg":"Bí Mật Bị Thời Gian Vùi Lấp.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"600,000", "AlbumName":"Yêu Một Người Không Sai", "ReleaseDate":"07/08/2014", "UrlImg":"Yêu Một Người Không Sai.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"550,000", "AlbumName":"Đếm Ngày Xa Em - Lou Hoàng,OnlyC", "ReleaseDate":"25/07/2015", "UrlImg":"Đếm Ngày Xa Em - Lou Hoàng,OnlyC.jpg"])
        
        
        
        //ARTIST
        
        insertDatabase("ARTISTS", dict: ["ArtistName":"Chí Thiện","Born":"19/5/1986", "UrlImg":"Tình Yêu Nhạt Màu (Bí Mật Bị Thời Gian Vùi Lấp OST).jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"HariWon", "Born":"20/11/1983", "UrlImg":"Anh Cứ Đi Đi - Hari Won.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Lou Hoàng","Born":"19/01/1990", "UrlImg":"LOUHOANG.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Lyna Thùy Linh","Born":"27/8/1992", "UrlImg":"LYNA THÙY LINH.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Mai Fin","Born":"19/05/1993", "UrlImg":"Chủ Nhật Buồn.jpg"])
        
        //Genres
        insertDatabase("GENRES", dict: ["GenreName":"Nhạc Trẻ"])
        insertDatabase("GENRES", dict: ["GenreName":"Nhạc Pop"])
        
        //PlayList
        insertDatabase("PLAYLIST", dict: ["PlaylistName":"Playlist1"])
        insertDatabase("PLAYLIST", dict: ["PlaylistName":"Playlist2"])
        
        //Song
        insertDatabase("SONGS", dict: ["SongName":"Anh Bỏ Thuốc Em Sẽ Yêu", "UrlImg":"Anh Bỏ Thuốc Em Sẽ Yêu.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Gái Nhà Lành", "UrlImg":"Gái Nhà Lành.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Anh Cứ Đi Đi", "UrlImg":"Anh Cứ Đi Đi - Hari Won.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Điệp Khúc Mùa Xuân", "UrlImg":"Điệp Khúc Mùa Xuân.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Chỉ Mong Trái Tim Người", "UrlImg":"Chỉ Mong Trái Tim Người.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Tình Yêu Nhạt Màu (Bí Mật Bị Thời Gian Vùi Lấp OST)", "UrlImg":"Tình Yêu Nhạt Màu (Bí Mật Bị Thời Gian Vùi Lấp OST).jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Đếm Ngày Xa Em", "UrlImg":"Đếm Ngày Xa Em.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Yêu Một Người Có Lẽ", "UrlImg":"Yêu Một Người Có Lẽ.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Chủ Nhật Buồn", "UrlImg":"Chủ Nhật Buồn.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Yêu Một Người Không Sai", "UrlImg":"Yêu Một Người Không Sai.jpg"])
               
        
        //DetailPlaylist
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"1","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"2","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"3","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"4","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"5","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"6","PlayListID":"1"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"7","PlayListID":"1"])
        
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"7","PlayListID":"2"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"8","PlayListID":"2"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"9","PlayListID":"2"])
        insertDatabase("DETAILPLAYLIST", dict: ["SongID":"10","PlayListID":"2"])
        
        //DetailAlbum
        
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"1", "GenreID":"1", "ArtistID":"4", "SongID":"1"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"1", "GenreID":"1", "ArtistID":"4", "SongID":"2"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"2", "GenreID":"1", "ArtistID":"2", "SongID":"3"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"2", "GenreID":"1", "ArtistID":"2", "SongID":"4"])
        
        
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"3", "GenreID":"1", "ArtistID":"5", "SongID":"5"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"3", "GenreID":"1", "ArtistID":"5", "SongID":"6"])
        
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"4", "GenreID":"1", "ArtistID":"3", "SongID":"7"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"4", "GenreID":"1", "ArtistID":"3", "SongID":"8"])
        
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"5", "GenreID":"1", "ArtistID":"1", "SongID":"9"])
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"5", "GenreID":"1", "ArtistID":"1", "SongID":"10"])
    }
    
    func getPath(){
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = NSString(string: dirPaths[0])
        dataBasePath = docsDir.stringByAppendingPathComponent("musics.db")
        print(dataBasePath)
    }
    
    func createDataBase() -> Bool {
        let file = NSFileManager.defaultManager()
        
        if (!file.fileExistsAtPath(dataBasePath as String)) {
            let musicDB = FMDatabase(path: dataBasePath as String)
            if musicDB == nil {
                print("Error: \(musicDB.lastErrorMessage())")
            }
            if musicDB.open() {
                let sql_Create_SONGS = "create table if not exists SONGS (ID integer primary key autoincrement, SongName text, UrlImg text)"
                
                let sql_Create_DetailPlayList = "create table if not exists DETAILPLAYLIST (SongID integer, PlayListID integer, foreign key (PlayListID) references PLAYLIST(ID), foreign key (SongID) references SONGS(ID), primary key (SongID, PlayListID))"
                
                let sql_Create_PlayList = "create table if not exists PLAYLIST (ID integer primary key autoincrement, PlaylistName text)"
                
                let sql_Create_ALBUMS = "create table if not exists ALBUMS (ID integer primary key autoincrement, Price text, AlbumName text, ReleaseDate text, UrlImg text)"
                
                let sql_Create_DetailAlbum = "create table if not exists DETAILALBUM (AlbumID integer, GenreID integer, ArtistID integer, SongID integer, foreign key (AlbumID) references ALBUMS(ID), foreign key (GenreID) references GENRES(ID), foreign key (ArtistID) references ARTISTS(ID), foreign key (SongID) references SONGS(ID), primary key (AlbumID, GenreID, ArtistID, SongID))"
                
                let sql_Create_ARTISTS = "create table if not exists ARTISTS (ID integer primary key autoincrement, ArtistName text, UrlImg text, Born text not null)"
                
                let sql_Create_GENRES = "create table if not exists GENRES (ID integer primary key autoincrement, GenreName text)"
                
                
                if (!musicDB.executeStatements(sql_Create_SONGS)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_DetailPlayList)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_PlayList)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_ALBUMS)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_DetailAlbum)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_ARTISTS)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
                if (!musicDB.executeStatements(sql_Create_GENRES)){
                    print("Error: \(musicDB.lastErrorMessage())")
                }
                
            }
            else {
                print("Error: \(musicDB.lastErrorMessage())")
            }
            musicDB.open()
            return true
        }
        return false
    }
    
    func insertDatabase(nameTable: String, dict: NSDictionary) {
        var keys = String()
        var values = String()
        var first = true
        for key in dict.allKeys {
            if (first == true) {
                keys = "'" + (key as! String) + "'"
                values = "'" + (dict.objectForKey(key) as! String) + "'"
                first = false
                continue
            }
            keys = keys + "," + "'" + (key as! String) + "'"
            values = values + "," + "'" + (dict.objectForKey(key) as! String) + "'"
        }
        
        
        let musicDB = FMDatabase(path: dataBasePath as String)
        if musicDB == nil {
            print("Error: \(musicDB.lastErrorMessage())")
        }
        
        if musicDB.open(){
            if (!musicDB.executeStatements("PRAGMA foreign_keys = ON")) {
                print("Error: \(musicDB.lastErrorMessage())")
            }
            
            let insertSQL = "INSERT INTO \(nameTable) (\(keys)) VALUES (\(values))"
            let result = musicDB.executeUpdate(insertSQL, withArgumentsInArray: nil)
            if !result {
                print("Error: \(musicDB.lastErrorMessage())")
            }
        }
        musicDB.close()
    }
    
    func viewDataBase(tableName: String, columns: [String], statement: String) -> [NSDictionary] {
        
        var items = [NSDictionary]()
        
        let musicDB = FMDatabase(path: dataBasePath as String)
        if musicDB == nil {
            print("Error: \(musicDB.lastErrorMessage())")
        }
        
        if musicDB.open() {
            var allColumns = ""
            
            for column in columns {
                if (allColumns == "") {
                    allColumns = column
                } else {
                    allColumns = allColumns + "," + column
                }
            }
            let querySQL = "Select DISTINCT \(allColumns) From \(tableName) \(statement)"
            let results: FMResultSet? = musicDB.executeQuery(querySQL, withArgumentsInArray: nil)
            while ((results?.next()) == true) {
                items.append((results?.resultDictionary())!)
            }
        }
        musicDB.close()
        return items
    }
}