//
//  ContentView.swift
//  Slot Machine
//
//  Created by Justice Ekeke on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    private  var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var bet = 5
    
    var body: some View {
        
        ZStack
        {
            Rectangle()
            .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
            
            
            VStack
            {
              Spacer()
                
                //title
                HStack
                {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.green)
                    
                    Text("SLOT MACHINE")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.green)
                }.scaleEffect(2)
                
                Spacer()
                
                //credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //cards
                HStack
                {
                    Spacer()
                    
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                
                Spacer()
                
                //Button
                Button(action: {
                    
                    //change slot image
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
                    {
                        //win
                        self.credits += self.bet * 10
                    }
                    else{
                        self.credits -= self.bet
                    }
                    
                }) {
                    Text("SPIN")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading,.trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                //Reset Button
                Button(action: {
                    
                    //Reset slot image
                    self.numbers = [0, 0, 0]
                    self.credits = 1000
                    
                }) {
                    Text("Reset")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,5)
                        .padding([.leading,.trailing], 25)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
