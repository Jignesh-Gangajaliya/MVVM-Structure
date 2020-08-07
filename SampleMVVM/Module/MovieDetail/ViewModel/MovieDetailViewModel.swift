//
//  MovieDetailViewModel.swift
//  SampleMVVM
//
//  Created by Jignesh gangajaliya on 12/11/19.
//

import Foundation

class MovieDetailViewModel {
    
    //MARK: Outputs
    
    //The variables value can only be set from view model.
    private (set) var movieName, movieImageName, director, releaseDate, income, rating: String!
    private (set) var isFavorite: Bool!
    
    //Data Model of the ViewModel
    private var dataModel: Movie! = nil
    private let movieDataModel = MovieDataModel()
    ////MARK: Input to View Model
    var markFavoriteButtonPressed: () -> () = { }
    
    //Communication type - 1 using functions
    func viewDidLoad() {
        print("2 - MovieDetailVM is informed of the view load")
        configureDataModel()
        //Communication type - 2 using closures
        markFavoriteButtonPressed = { [weak self] in
            print("2 - View Model is informed of favorite button press via closure.")
            guard let _self = self else { return }
            print("3 - View Model changes the state of favorite selction.")
            _self.isFavorite = !_self.isFavorite
        }
    }
    
    //Configure the data model required for the UI population.
    private func configureDataModel() {
        dataModel = Movie(data: movieDataModel.movieData())
        print("3 - Data Model of view model is configured to configureDataModel()")
        configureOutput()
    }
    
    //Configure the output properties that are to be accessed by the view.
    private func configureOutput() {
        print("4 - Outputs of view model are configured and stored in respective properties.")
        movieName = dataModel.movieName
        movieImageName = dataModel.movieImageName
        director = dataModel.director
        isFavorite = dataModel.isFavorite
        income = dataModel.income
        releaseDate = releaseDisplayDataForMovie()
        rating = ratingDisplayDataForMovie()
    }
    
    //Process raw date data for output.
    private func releaseDisplayDataForMovie() -> String {
        print("5 - Data of movie release date processed for display woth proper date format.")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        return dateFormatter.string(from: dataModel.releaseDate)
    }
    
    //Process raw rating data for output.
    private func ratingDisplayDataForMovie() -> String {
        print("6 - Rating is processed for display.")
        return "\(dataModel.rating)/10.0"
    }
    
}
