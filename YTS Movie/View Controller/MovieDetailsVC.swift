//
//  MovieDetailsVC.swift
//  YTS Movie
//
//  Created by Ahmed on 1/26/21.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

class MovieDetailsVC: UIViewController, YTPlayerViewDelegate {
    @IBOutlet weak var TopBackground: UIImageView!
    @IBOutlet weak var BottomBackground: UIImageView!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var VideoPlayer: YTPlayerView!
    @IBOutlet weak var Summery: UILabel!
    @IBOutlet weak var CastCollectionView: UICollectionView!
    
    var castCollectionView: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    var id: Int = 9
    // for blur effect
    let blurEffect = UIBlurEffect()
    let image      = UIImageView()
    var moviedetails: MovieDetails!
    var castlist = [CastModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        GetMovieDetails()
        CastCollectionView.collectionViewLayout = castCollectionView
        CastCollectionView.delegate = self
        CastCollectionView.dataSource = self

    }
    
    func GetMovieDetails(){
        let api: MovieDetailsProtocolAPI = MovieDetailsAPI()
        api.getMovieDetails(id: id) {[weak self ] (data, error) in
            guard let self = self else { return }
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            // get data
            guard let myData = data?.data else { return }
            self.moviedetails = myData.movie
            self.MovieTitle.text = self.moviedetails.title
            self.Rating.text = "\(self.moviedetails.rating) / 10"
            self.Summery.text = self.moviedetails.summery
            self.castlist = myData.movie.cast ?? []
            for ca in self.castlist {
                print(ca.name)
                print(ca.imageURL)
            }
            
            // download image
            self.image.downloadImage(url: self.moviedetails.TopBackground, imageView: self.TopBackground)
            self.image.downloadImage(url: self.moviedetails.BottomBackground, imageView: self.BottomBackground)
            self.image.downloadImage(url: self.moviedetails.poster, imageView: self.MovieImage)
            
            // set blur effect
            self.blurEffect.BlurEffect(style: .light, image: self.TopBackground)
            self.blurEffect.BlurEffect(style: .dark, image: self.BottomBackground)
            
            // trailer video
            self.VideoPlayer.load(withVideoId: self.moviedetails.trailer, playerVars: ["playsinline": 1])
            
            DispatchQueue.main.async {
                self.CastCollectionView.reloadData()
            }
        }
        
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        VideoPlayer.playVideo()
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true)
    }
 
}
extension MovieDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castlist.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CastCollectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.Configure(with: castlist[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 3 , height: 110)
    }

}
