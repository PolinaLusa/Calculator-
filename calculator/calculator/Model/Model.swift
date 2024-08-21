//
//  Model.swift
//  calculator
//
//  Created by Полина Лущевская on 4.03.24.
//

import SwiftUI
enum Operation {
    case addition, subtraction, multiplication, division, none
}

enum Buttons: String{
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiply = "×"
    case divide = "÷"
    case equal = "="
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    case factorial = "x!"
    case logFromTen = "lg"
    case naturalLog = "ln"
    case exponenta = "e"
    case Pi = "π"
    case sin = "sin"
    case cos = "cos"
    case tg = "tg"
    case ctg = "ctg"
    case sqrt = "√"
    
    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.grayCalculator
        case .divide, .multiply, .minus, .plus, .equal:
            return Color.orangeCalculator
        default:
            return Color.darkGrayCalc
        }
    }
    
    var buttonFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }
}
