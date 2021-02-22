//
//  ContentView.swift
//  calculator
//
//  Created by Darryn Jacobs on 2021/02/21.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
        ["AC", "±", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", ",", "="]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text("42")
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self) { button in
                    HStack {
                        ForEach(button, id: \.self) { button in
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: self.buttonsWidth(), height: self.buttonsWidth())
                                .foregroundColor(.white)
                                .background(Color.yellow)
                                .cornerRadius(50)
                                .padding(2)
                        }
                    }
                }
            }
        }
    }
    
    func buttonsWidth() -> CGFloat {
        return 80
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
