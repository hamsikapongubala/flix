//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Hamsika Pongubala on 9/13/18.
//  Copyright © 2018 Hamsika Pongubala. All rights reserved.
//

import UIKit
import AlamofireImage



class NowPlayingViewController: UIViewController, UITableViewDataSource{

    
    
    @IBOutlet weak var tableView: UITableView!
  
//    var movies : [[String: Any]] = []
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRequest(_:)),for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self //dataSource of tableView is us
        fetchMovies()
        
      
    }
    @objc func didPullToRequest(_ refreshControl : UIRefreshControl){
      
      
    }
  
  
  
    func fetchMovies(){
          MovieApiManager().nowPlayingMovies{(movies: [Movie]? ,error: Error?) in
                    if let movies = movies {
                    self.movies = movies
                    self.tableView.reloadData()
          }
      }
  
  }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
      
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        cell.poserImageView.af_setImage(withURL: movie.posterURL)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
    
}
