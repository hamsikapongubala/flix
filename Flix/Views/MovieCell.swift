//
//  MovieCell.swift
//  Flix
//
//  Created by Hamsika Pongubala on 9/13/18.
//  Copyright © 2018 Hamsika Pongubala. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
   
    @IBOutlet weak var poserImageView: UIImageView!
  
    var movie: Movie!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
