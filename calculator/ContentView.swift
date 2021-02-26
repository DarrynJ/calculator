//
//  ContentView.swift
//  calculator
//
//  Created by Darryn Jacobs on 2021/02/21.
//

import SwiftUI

enum CalculatorButton: String {
    
    case zero, decimal, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percentage
    
    var background: Color {
        switch self {
        case .zero, .decimal, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .ac, .plusMinus, .percentage:
            return Color(.lightGray)
        default:
            return Color(.systemOrange)
        }
    }
    
    var title: String {
        switch self {
        case .zero:
            return "0"
        case .decimal:
            return "."
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .equals:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        case .ac:
            return "AC"
        case .plusMinus:
            return "±"
        case .percentage:
            return "%"
        }
    }
    
}

// Environment objects
class GlobalEnvironment: ObservableObject {
    
    @Published var display = "0"
    
    func receiveInput(calculatorButton: CalculatorButton) {
        self.display = calculatorButton.title
    }
    
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text(env.display )
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self) { button in
                    HStack {
                        ForEach(button, id: \.self) { button in
                            Button(action: {
                                self.env.receiveInput(calculatorButton: button)
                            }, label: {
                                Text(button.title)
                                    .font(.system(size: 32))
                                    .frame(width: button == .zero ? self.zeroButtonsWidth() : self.buttonsWidth(), height: self.buttonsWidth())
                                    .foregroundColor(.white)
                                    .background(button.background)
                                    .cornerRadius(self.buttonsWidth())
                                    .padding(2)
                            })
                        }
                    }
                }
            }
        }
    }
    
    func buttonsWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    func zeroButtonsWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
