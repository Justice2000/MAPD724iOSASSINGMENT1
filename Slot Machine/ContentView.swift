/*
 *Program Name: SlotMachine Game
 *Date Last Modified: 06/02/2022
 *Description: A simple Slot machine game that has a credits and bet counter.
 *Revision History: Added functionality to UI design.
 *Author: Justice Ekeke
 *Student ID: 301160908
 *Date: Febuary 06, 2022
 *
 *Author: Shrijan Karki
 *Student ID: 301222636
 *Date: Febuary 06, 2022
 *
 *Author: Basil Farooq
 *Student ID: 301201128
 *Date: Febuary 06, 2022
 *
 */

import SwiftUI

struct ContentView: View {
    
    private  var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    @State private var score = 0
    private var bet = 5
    
    var body: some View {
        
        NavigationView
        {
            ZStack
            {
                Rectangle()
                    .foregroundColor(Color(red: 255/255, green: 200/255, blue: 64/255))
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
                    VStack
                    {
                        
                        HStack
                        {
                            Text("Credits: " + String(credits))
                                .foregroundColor(.black)
                                .padding(.all,10)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(20)
                            
                            Text("Current Bet: 5")
                                .foregroundColor(.black)
                                .padding(.all,10)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(20)
                        }
                        Text("High Score: " + String(score))
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    //slot cards
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
                    VStack
                    {
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
                                self.score += self.bet * 10
                            }
                            else{
                                self.credits -= self.bet
                            }
                            
                        }) {
                            Text("SPIN")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,20)
                                .padding([.leading,.trailing], 40)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        HStack{
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
                        
                        
                        //Quit Button
                        Button(action: {
                            
                            //app close logic
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                            }
                        }) {
                            Text("Quit")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,5)
                                .padding([.leading,.trailing], 25)
                                .background(Color.gray)
                                .cornerRadius(20)
                        }
                        }
                        
                        HStack
                        {
                            Spacer()
                            NavigationLink(destination: HelpView(), label: { Text("Help")
                            }).padding(.all,5)
                                .padding([.leading,.trailing], 25)
                                .background(Color.white.opacity(0))
                        }
                        
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct HelpView: View {
    
    var body: some View {
        ZStack
        {
            Rectangle()
                .foregroundColor(Color(red: 255/255, green: 200/255, blue: 64/255))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack
            {
                HStack
                {
                    
                    Text("INSTRUCTIONS")
                        .bold()
                        .foregroundColor(.white)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                Text("HELP")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
