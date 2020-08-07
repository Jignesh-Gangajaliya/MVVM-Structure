//
//  MovieDataModel.swift
//  SampleMVVM
//
//  Created by Jignesh gangajaliya on 12/11/19.
//

import Foundation

class MovieDataModel {
    
    //Consider this as a data providing API request in general app environment.
    public func movieData() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let releaseDate = dateFormatter.date(from: "2017-11-17")
        return ["movieName": "Justice League" ,"movieImageName": "justiceleague" ,"isFavorite": false ,"director": "Zack Synder" ,"releaseDate": releaseDate ?? Date() ,"income": "$657.9 billion" ,"rating": 7.8]
    }
    
}
