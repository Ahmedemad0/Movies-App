//
//  ViewController.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import UIKit

class ListMoviesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    var collectionLayout: UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        return layout
    }()
    var nextPageNumber: Int = 1
    let api:listMovieProtocolAPI = listMovieAPI()
    var cellID = "ListMovieID"
    var moviesList = [Movie]()
    var movieDetailsVC = MovieDetailsVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.collectionViewLayout = collectionLayout
        CollectionView.delegate = self
        CollectionView.dataSource = self
        GetListMovies()
        
    }
    func GetListMovies(){
        api.getMovies(page: nextPageNumber) { [weak self] (data,error) in
            guard let self = self else {return}
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let myData = data?.data else { return }
            self.nextPageNumber = myData.pageNumber
            self.moviesList = myData.movies
            for movie in self.moviesList {
                self.movieDetailsVC.id = movie.id
//                print(movie.title , movie.genres)
//                print(movie.id)
            }
            DispatchQueue.main.async {
                self.CollectionView.reloadData()
                self.nextPageNumber += 1
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ListMoviesCell
        cell.Configure(with: moviesList[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? IndexPath {
            let destnation = segue.destination as! MovieDetailsVC
            destnation.id = moviesList[index.row].id
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Details", sender: indexPath)
    }

}


extension ListMoviesVC {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceHeight: CGFloat = 800
        return CGSize(width: UIScreen.main.bounds.size.width, height: referenceHeight)
    }


}

