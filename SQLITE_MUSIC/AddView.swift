//
//  AddView.swift
//  SQLITE_MUSIC
//
//  Created by HoangHai on 9/7/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class AddView: UIViewController {

    
    @IBOutlet weak var txt_Name: UITextField!
    
    @IBOutlet weak var txt_ImgName: UITextField!
    
    @IBOutlet weak var lbl_ArtistName: UILabel!
    
    @IBOutlet weak var lbl_Album: UILabel!
    
    @IBOutlet weak var lbl_Genre: UILabel!
    
    let dataBase = DataBase.sharedInstance
    var listView = ListView(frame: CGRectMake(0, 0, 100, 100), style: .Plain)
    var labels = [Label]()
    private var albumID = 0
    private var artistID = 0
    private var genreID = 0
    private var activeList = false
    
    //# MARK: Override view
    override func viewDidLoad() {
        super.viewDidLoad()
//        addGestureForLabels()
//        addListView()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        for gesture in self.view.gestureRecognizers! {
//            if gesture.isKindOfClass(UIGestureRecognizer) {
//                self.view.removeGestureRecognizer(gesture)
//            }
//        }
//    }
//    
//    //#MARK: Process Interface
//    func setPositionForListView(sender: UILabel) {
//        setStateForListView()
//        listView.frame = CGRectMake(sender.frame.origin.x, sender.frame.origin.y + sender.frame.height, sender.frame.width, 100)
//        listView.reloadData()
//    }
//    
//    func addListView() {
//        listView.delegateSelectItem = self
//        setStateForListView()
//        self.view.addSubview(listView)
//    }
//    
//    func addGestureForLabels() {
//        lbl_ArtistName.userInteractionEnabled = true
//        lbl_Album.userInteractionEnabled = true
//        lbl_Genre.userInteractionEnabled = true
//        
//        let tapAlbum = UITapGestureRecognizer(target: self, action: #selector(AddView.viewListItemsAlbum))
//        lbl_Album.addGestureRecognizer(tapAlbum)
//        
//        let tapArtist = UITapGestureRecognizer(target: self, action: #selector(AddView.viewListItemsArtist))
//        lbl_ArtistName.addGestureRecognizer(tapArtist)
//        
//        let tapGenre = UITapGestureRecognizer(target: self, action: #selector(AddView.viewListGenre))
//        lbl_Genre.addGestureRecognizer(tapGenre)
//        
//    }
//    
//    func setStateForListView() {
//        listView.hidden = !listView.hidden
//    }
//    
//    //#MARK: Process Data
//    func viewListItemsArtist() {
//        labels.removeAll()
//        var allArtists = [NSDictionary]()
//        var statement = ""
//        if (albumID == 0) {
//            allArtists = dataBase.viewDataBase("ARTISTS", columns: ["ID", "ArtistName"], statement: statement)
//            
//        } else {
//            statement = "JOIN ARTISTS On DETAILALBUM.ArtistID = ARTISTS.ID Where DETAILALBUM.albumID = \(albumID)"
//            allArtists = dataBase.viewDataBase("DETAILALBUM", columns: ["ARTISTS.ArtistName", "ARTISTS.ID"], statement: statement)
//        }
//        
//        for artist in allArtists {
//            labels.append(Label(displayName: artist["ArtistName"] as! String, id: artist["ID"] as! Int, column: "ArtistName"))
//        }
//        
//        listView.items = labels
//        listView.type = Type.ARTISTS
//        setPositionForListView(lbl_ArtistName)
//        
//    }
//    
//    func viewListItemsAlbum() {
//        labels.removeAll()
//        var allAlbums = [NSDictionary]()
//        var statement = ""
//        if (artistID == 0) {
//            
//            allAlbums = dataBase.viewDataBase("ALBUMS", columns: ["ID", "AlbumName"], statement: statement)
//            
//        } else {
//            statement = "JOIN ALBUMS On DETAILALBUM.AlbumID = ALBUMS.ID Where DETAILALBUM.artistID = \(artistID)"
//            allAlbums = dataBase.viewDataBase("DETAILALBUM", columns: ["ALBUMS.AlbumName", "ALBUMS.ID"], statement: statement)
//        }
//        
//        
//    }
//    
    
}
