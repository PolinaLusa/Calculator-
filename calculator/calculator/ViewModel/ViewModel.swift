//
//  ViewModel.swift
//  calculator
//
//  Created by Полина Лущевская on 9.03.24.
//

import SwiftUI

class ViewModel: ObservableObject{
    //Property
    @Published var value = "0"
    @Published var number: Double = 0
    @Published var currentOperation: Operation = .none
    @Published var isResultCalculated = false

    //Tap button method
    func didTap(item: Buttons){
        switch item {
        case .plus, .minus, .multiply, .divide:
            currentOperation = item.ButtonOperation()
            number = Double(value) ?? 0
            value = "0"
            isResultCalculated = false
        case .equal:
            if let currentValue = Double(value){
                value = formatResult(performOperation(currentValue))
                isResultCalculated = true
            }
        case .decimal:
            if !value.contains("."){
                value += "."
            }
        case .percent:
            if let currentValue = Double(value){
                value = formatResult(currentValue / 100)
                isResultCalculated = true
            }
        case .negative:
            if let currentValue = Double(value){
                value = formatResult(-currentValue)
            }
        case .factorial:
            if let currentValue = Double(value), currentValue >= 0 {
                let result = currentValue == 0 ? 1 : (1...Int(currentValue)).reduce(1, *)
                value = formatResult(Double(result))
                isResultCalculated = true
            } else {
                value = "Ошибка"
                isResultCalculated = true
            }
        case .logFromTen:
            if let currentValue = Double(value), currentValue > 0 {
                value = String(formatResult(log10(currentValue)))
                isResultCalculated = true
            } else {
                value = "Ошибка"
                isResultCalculated = true
            }
        case .sqrt:
            if let currentValue = Double(value), currentValue >= 0 {
                value = String(formatResult(sqrt(currentValue)))
                isResultCalculated = true
            } else {
                value = "Ошибка"
                isResultCalculated = true
            }
        case .sin:
            if let currentValue = Double(value) {
                value = String(formatResult(sin(currentValue * .pi / 180)))
                isResultCalculated = true
            }
        case .cos:
            if let currentValue = Double(value) {
                value = String(formatResult(cos(currentValue * .pi / 180)))
                isResultCalculated = true
            }
        case .tg:
            if let currentValue = Double(value) {
                let tanValue = tan(currentValue * .pi / 180)
                if tanValue.isInfinite || tanValue.isNaN {
                    value = "Ошибка"
                } else {
                    value = String(formatResult(tanValue))
                    isResultCalculated = true
                }
            }
        case .ctg:
            if let currentValue = Double(value) {
                let cotanValue = 1 / tan(currentValue * .pi / 180)
                if cotanValue.isInfinite || cotanValue.isNaN {
                    value = "Ошибка"
                } else {
                    value = String(formatResult(cotanValue))
                    isResultCalculated = true
                }
            }
        case .naturalLog:
            if let currentValue = Double(value), currentValue > 0 {
                value = String(formatResult(log(currentValue)))
                isResultCalculated = true
                } else {
                value = "Ошибка"
                isResultCalculated = true
                }
        case .exponenta:
            value = String(format: "%.15f", M_E)
            isResultCalculated = true
        case .Pi:
            value = String(Double.pi)
            isResultCalculated = true
        case .clear:
            value = "0"
            isResultCalculated = false
        default:
            if isResultCalculated {
            value = item.rawValue
            isResultCalculated = false
            } else if value == "0" {
            value = item.rawValue
            } else {
            value += item.rawValue
            }
        }
    }
    //Helper calculate method
    func performOperation(_ currentValue: Double) -> Double{
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtraction:
            return number - currentValue
        case .multiplication:
            return number * currentValue
        case .division:
            return number / currentValue
        default:
            return currentValue
        }
    }
    //Remove last zero method
    func formatResult(_ result: Double) -> String{
        return String(format: "%g", result)
    }
    //Size of Buttons Methods
    func buttonWidth(item : Buttons) -> CGFloat{
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing : CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2     }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    func buttonHeight() -> CGFloat{
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }

    
}
