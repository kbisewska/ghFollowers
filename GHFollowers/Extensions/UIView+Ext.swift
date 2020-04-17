//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Kora on 17/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
