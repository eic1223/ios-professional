//
//  DecimalUtils.swift
//  Banky
//
//  Created by Dane's macbook pro on 2022/04/10.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
