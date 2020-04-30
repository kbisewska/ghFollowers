//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Kora on 14/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    var networkManager: NetworkManageable = NetworkManager()
    
    lazy var cache = networkManager.cache
    let placeholderImage = Images.placeholder

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        networkManager.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
