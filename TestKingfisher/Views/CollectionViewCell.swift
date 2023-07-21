//
//  CollectionViewCell.swift
//  TestKingfisher
//
//  Created by Алексей Турулин on 7/20/23.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with superhero: Superhero) {
        nameLabel.text = superhero.name
    }
}
