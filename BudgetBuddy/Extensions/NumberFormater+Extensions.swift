//
//  NumberFormater+Extensions.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/2/24.
//

import Foundation

extension NumberFormatter {
  static let currency: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "en_US")
    return formatter
  }()
}
