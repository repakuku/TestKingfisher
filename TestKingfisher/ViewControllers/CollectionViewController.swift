//
//  CollectionCollectionViewController.swift
//  TestKingfisher
//
//  Created by Алексей Турулин on 7/20/23.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private var superheroes: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSuperheroes()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superheroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "superhero", for: indexPath) as! CollectionViewCell
        let superhero = superheroes[indexPath.row]
        cell.configure(with: superhero)
        return cell
    }
    
    private func fetchSuperheroes() {
        networkManager.fetchData { result in
            switch result {
            case .success(let superheroes):
                self.superheroes = superheroes
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
