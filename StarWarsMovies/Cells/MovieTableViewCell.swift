//
//  MovieTableViewCell.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.setShadow()
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
