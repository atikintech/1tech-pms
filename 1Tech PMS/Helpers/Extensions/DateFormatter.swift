//
//  NSDateFormatter.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 20/07/23.
//

import Foundation

extension DateFormatter {
    
    class func simpleDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, YYYY"
        return formatter.string(from: date)
    }
}
