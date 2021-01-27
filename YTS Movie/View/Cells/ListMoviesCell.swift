//
//  ListMoviesCell.swift
//  YTS Movie
//
//  Created by Ahmed on 1/19/21.
//

import UIKit
import Kingfisher

class ListMoviesCell: UICollectionViewCell {
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieSummery: UILabel!
    @IBOutlet weak var MovieRating: UILabel!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieGenres: UILabel!
    @IBOutlet weak var CellBackgroundView: UIView!
    

    func Configure(with data: Movie){
        CellBackgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        MovieTitle.text = data.title
        MovieRating.text = ("\(data.rating) / 10")
        MovieGenres.text = data.genres.joined(separator: ", ")
        MovieSummery.text = data.summery
        MovieImage.downloadImage(url: data.ImageURL, imageView: MovieImage)
        
    }

}
