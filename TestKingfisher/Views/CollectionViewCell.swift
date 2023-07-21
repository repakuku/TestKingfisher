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
        
        let imageURL = URL(string: superhero.images.lg)
        
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.indicatorType = .activity
        
        imageView.kf.setImage(
            with: imageURL,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        ) { result in
            switch result {
            case .success(let value):
                print("Task done for \(value.source.url?.lastPathComponent ?? "")")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
