//
//  FlickrAPI.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

//USe custom Delegate to update listners when photoSearch() is complete
protocol FlickrAPIDelegate: class {
    func flickrService(_ flickrService: FlickrAPI, didReceivePhotos photos: [Photo])
    //    TODO: add a func for errors
}

class FlickrAPI {
    let flickrBaseURL = "https://api.flickr.com/services/rest/?"
    
    weak var delegate: FlickrAPIDelegate?

    func photoSearch(photoType: String, location: CLLocationCoordinate2D?) {
        // TODO: use Alamofire to make network request
        
        var params: [String:Any] = ["api_key": APIKeys.apiKey,
                                    "method": "flickr.photos.search",
                                    "lat": 40.93,
                                    "lon": -73.88,
                                    "format": "json",
                                    "extras":"url_m, description",
                                    "per_page": 500,
                                    "text": "roti",
                                    "nojsoncallback": 1,
                                    "safe_search": 3]
//        Ability to update lat and lon
        params["text"] = photoType
        
        Alamofire.request(flickrBaseURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("dataResponse error: \(error)")
            } else if let data = dataResponse.data {
                do {
                    let decoder = JSONDecoder()
                    let search = try decoder.decode(Search.self, from: data)
                    let photos = search.results.photos
                    self.delegate?.flickrService(self, didReceivePhotos: photos)
                    print("photo count: \(photos.count)")
                } catch {
                    print("decoding error: \(error)")
                }
            }
        }
        
      
        
        // TODO: complete the implementation of the Flickr photoSearch()
        // TODO: user should be able to enter a type of photo to search e.g. central park
        // TODO: user should be able to enter a location e.g 5th Ave, NY
    }
}
