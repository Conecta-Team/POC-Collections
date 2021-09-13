//
//  View2.swift
//  POC-Collections
//
//  Created by José João Silva Nunes Alves on 08/09/21.
//

import UIKit

class View2: UIView {

    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .gray
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(collection)
        
        NSLayoutConstraint.activate([
            self.collection.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.collection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            self.collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collection.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
