//
//  Movie.swift
//  Flix
//
//  Created by Hamsika Pongubala on 10/10/18.
//  Copyright © 2018 Hamsika Pongubala. All rights reserved.
//

import Foundation

class Movie{


 var title: String
 var overview: String
 var posterPathString : String
 var baseURLString: String
 var posterURL: URL
 
    var posterUrl: URL?

    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
      overview = dictionary["overview"] as? String ?? "No overview"
      posterPathString = dictionary["poster_path"] as! String
      baseURLString = "https://image.tmdb.org/t/p/w500"
      posterURL = URL(string: baseURLString + posterPathString)!
    }
  
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
    var movies: [Movie] = []
    for dictionary in dictionaries {
        let movie = Movie(dictionary: dictionary)
        movies.append(movie)
    }

    return movies
}


}
