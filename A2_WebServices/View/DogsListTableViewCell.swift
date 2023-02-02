//
//  DogsListTableViewCell.swift
//  Assignment-2-CMP-1000
//
//  Created by Khadija Daruwala on 2023-02-01.
//

import UIKit

class DogsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var subBreedName: UILabel!
    @IBOutlet weak var breedImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        subBreedName.alpha = 1
    }
    
}
