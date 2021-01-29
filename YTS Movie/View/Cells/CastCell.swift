//
//  CastCell.swift
//  YTS Movie
//
//  Created by Ahmed on 1/29/21.
//

import UIKit

class CastCell: UICollectionViewCell {
    @IBOutlet weak var CastImageURL: UIImageView!
    
    func Configure(with data: CastModel){
        CastImageURL.downloadImage(url: data.imageURL, imageView: CastImageURL)
    }
    
}
