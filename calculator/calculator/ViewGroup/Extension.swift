//
//  Extension.swift
//  calculator
//
//  Created by Полина Лущевская on 4.03.24.
//

import SwiftUI

extension Color {
    static let darkGrayCalс = Color("darkGrayCalc")
    static let grayCalculator = Color("grayCalc")
    static let orangeCalculator = Color("orangeCalc")
}

extension Buttons {
    func ButtonOperation() -> Operation{
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtraction
        case .multiply:
            return .multiplication
        case .divide:
            return .division
        default:
            return .none
        }
    }
}
