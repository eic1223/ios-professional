//
//  Date+Utils.swift
//  Banky
//
//  Created by Dane's macbook pro on 2022/04/10.
//

import Foundation

extension Date {
    static var bankyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankyDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
