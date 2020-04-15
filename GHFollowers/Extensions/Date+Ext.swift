//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Kora on 15/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
