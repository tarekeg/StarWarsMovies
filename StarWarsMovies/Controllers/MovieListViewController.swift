//
//  MovieListViewController.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit
import Reachability
class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalMoviesLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    let reachability = try! Reachability()
    
    private var movieListVM: MovieListViewModel!
    let spinner = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        topView.setShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
       do{
         try reachability.startNotifier()
       }catch{
         print("could not start reachability notifier")
       }
        
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: CONSTANT.CellIdentifier.movieCell, bundle: nil), forCellReuseIdentifier: CONSTANT.CellIdentifier.movieCell)
    }
    
    func loadData() {
        setupSpinner()
        StarWarsAPI().getAllMovies { movieData in
            if let movies = movieData?.results {
                self.movieListVM = MovieListViewModel(movies)
            }
            DispatchQueue.main.async {
                self.totalMoviesLabel.text = "Total \(movieData?.count ?? 0) Movies"
                self.tableView.reloadData()
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
            }
            
        }
    }
    
    func setupSpinner() {
        spinner.startAnimating()
        tableView.backgroundView = spinner
    }
    
    func resetTableView() {
        self.totalMoviesLabel.text = "Total 0 Movie"
        self.movieListVM = nil
        self.tableView.reloadData()
        self.tableView.setEmptyMessage("no internet connexion")
    }
    
    @objc func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability

      switch reachability.connection {
      case .wifi:
          loadData()
      case .cellular:
          loadData()
      case .unavailable:
          resetTableView()
      case .none:
          print("")
      }
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANT.CellIdentifier.movieCell, for: indexPath) as? MovieTableViewCell else {
            fatalError("TableViewCell not found")
        }
        
        let movieVM = self.movieListVM.movieAtIndex(index: indexPath.row)
        
        cell.movieTitleLabel.text = movieVM.title
        cell.directorLabel.text = movieVM.director
        cell.producerLabel.text = movieVM.producer
        cell.releaseDateLabel.text = movieVM.releaseDate
        cell.openingCrawlLabel.text = movieVM.openingCrawl
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: CONSTANT.SegueIdentifier.toDetails, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CONSTANT.SegueIdentifier.toDetails{
            let index = sender as? NSIndexPath
            let movieVM = movieListVM.movieAtIndex(index: index!.row)
            if let destinationVC =  segue.destination as? MovieDetailViewController {
                destinationVC.movieVM = movieVM
            }
        }
    }
    
    
    
    
}

