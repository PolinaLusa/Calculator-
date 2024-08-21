//
//  calculatorApp.swift
//  calculator
//
//  Created by Полина Лущевская on 27.02.24.
//

import SwiftUI
import SwiftData

@main
struct CalculatorApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
