//
//  MainView.swift
//  calculator
//
//  Created by Полина Лущевская on 4.03.24.
//
import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                horizontalLayout
            } else {
                verticalLayout
            }
        }
    }

    private var horizontalLayout: some View {
        let buttonsArray: [[Buttons]] = [
            [.sqrt, .factorial, .clear, .negative, .percent, .divide],
            [.sin, .logFromTen, .seven, .eight, .nine, .multiply],
            [.cos, .naturalLog, .four, .five, .six, .minus],
            [.tg, .exponenta, .one, .two, .three, .plus],
            [.ctg, .Pi, .zero, .decimal, .equal]
        ]
        return ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            HStack {
                VStack(spacing: 7) {
                    Spacer()
                    
                    // Display
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.light)
                        .padding(.horizontal, 5)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    // Buttons
                    ForEach(buttonsArray, id: \.self) { row in
                        HStack(spacing: 12) {
                            ForEach(row, id: \.self) { item in
                                Button {
                                    viewModel.didTap(item: item)
                                } label: {
                                    Text(item.rawValue)
                                        .frame(width: item == .zero ? 208 : 100, height: 50)
                                        .foregroundColor(item.buttonFontColor)
                                        .background(item.buttonColor)
                                        .font(.system(size: 25))
                                        .cornerRadius(item == .zero ? 25 : 30)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
                .frame(alignment: .leading) 
            }
        }
    }
    
    private var verticalLayout: some View {
        let buttonsArray: [[Buttons]] = [
            [.clear, .negative, .percent, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .minus],
            [.one, .two, .three, .plus],
            [.zero, .decimal, .equal]
        ]
        
        return ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                // Display
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 76))
                        .fontWeight(.light)
                        .padding(.horizontal, 7)
                }
                // Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(item: item)
                            } label: {
                                Text(item.rawValue)
                                    .frame(width: viewModel.buttonWidth(item: item), height: viewModel.buttonHeight())
                                    .foregroundColor(item.buttonFontColor)
                                    .background(item.buttonColor)
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
