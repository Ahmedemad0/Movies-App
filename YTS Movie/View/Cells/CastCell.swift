//
//  CastCell.swift
//  YTS Movie
//
//  Created by Ahmed on 1/29/21.
//

import UIKit

class CastCell: UICollectionViewCell {
//    @IBOutlet weak var CastImageURL: UIImageView!
//    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Name: UILabel!
    
    func Configure(with data: CastModel){
//        CastImageURL.downloadImage(url: data.imageURL ?? "https://www.google.com/search?q=unknown+image&sxsrf=ALeKk02jZbsm10anSJMJsfI0VJ5zDOnviA:1612029300197&tbm=isch&source=iu&ictx=1&fir=X-qWTNGbS3FSTM%252CgTEnwEP31ZIxlM%252C_&vet=1&usg=AI4_-kTtZPYdW0humzHY7dEt94avFnCr2Q&sa=X&ved=2ahUKEwjmxbiOncTuAhWStHEKHSiICbYQ9QF6BAgEEAE&biw=1366&bih=597#imgrc=vLORGxPIlwmoaM", imageView: CastImageURL)
        Name.text = data.name
    }
    
}
