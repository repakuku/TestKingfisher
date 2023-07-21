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
    
    private let networkManager = NetworkManager.shared
    
    
    func configure(with superhero: Superhero) {
        nameLabel.text = superhero.name
        
        networkManager.fetchImage(for: superhero) { [weak self] result in
            switch result {
            case .success(let imageData):
                let image = UIImage(data: imageData)
                self?.imageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
