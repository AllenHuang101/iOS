//
//  ViewController.swift
//  AlamofireLab
//
//  Created by Allen Huang on 2018/4/24.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getItunesData1()
        getItunesData2()
    }

    func getItunesData1(){
        let params: Parameters = ["term": "周杰倫", "media": "music"]
        
        Alamofire.request("https://itunes.apple.com/search", parameters: params).responseJSON { (response) in
            if response.result.isSuccess {
                if let songResult = response.result.value as? [String: Any]{
                    if let songs = songResult["results"] as? [[String: Any]] {
                        for song in songs {
                            print(song["trackName"] as! String)
                        }
                    }
                }
            }else{
                print("error!")
            }
        }
    }
        
    func getItunesData2(){
        let params: Parameters = ["term": "周杰倫", "media": "music"]
        
        Alamofire.request("https://itunes.apple.com/search", parameters: params).responseJSON { (response) in
            if response.result.isSuccess {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let result = response.data, let songResult = try? decoder.decode(SongResults.self, from: result) {
                    for song in songResult.results {
                        print(song.trackName as! String)
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

