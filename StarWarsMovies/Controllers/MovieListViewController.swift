//
//  MovieListViewController.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalMoviesLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        loadData()
        topView.setShadow()
        
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: CONSTANT.CELLIdentifier.movieCell, bundle: nil), forCellReuseIdentifier: CONSTANT.CELLIdentifier.movieCell)
    }
    
    func loadData() {
        StarWarsAPI().getAllMovies { movieData in
            DispatchQueue.main.async {
                self.totalMoviesLabel.text = "Total \(String(describing: movieData!.count)) moviesss"
            }
            
        }
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANT.CELLIdentifier.movieCell, for: indexPath) as! MovieTableViewCell
        
        return cell
    }
    
    
    
    
}

