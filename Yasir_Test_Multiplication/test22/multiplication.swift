//
//  multiplication.swift
//  test22
//
//  Created by naeem alabboodi on 10/7/20.
//

import SwiftUI
import AVFoundation


extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}


struct multiplication: View {
   
    @ObservedObject var naeem = User()
    var number : Int
   
    @State var bombSoundEffect: AVAudioPlayer!
    @State var allTries = 0
    @State var isRongAnswer = false
    @State var isShowingDetailview = false
    @State var Score = 0
    @State var result2 = ""
    @State var result  = ""
    @State  var  randomInt = Int.random(in: 1..<10)
 
    var body: some View {
        NavigationView{
        ZStack{
           
            NavigationLink(destination:GoodJob()
                              .navigationBarHidden(true)
                              .onAppear{
                                DispatchQueue.main.asyncAfter(deadline:.now() + 1){
                                    self.isShowingDetailview = false
                                }
                              } , isActive:$isShowingDetailview){EmptyView()}
            NavigationLink(destination:RongAnswer()
                              .navigationBarHidden(true)
                              .onAppear{
                                DispatchQueue.main.asyncAfter(deadline:.now() + 1){
                                    self.isRongAnswer = false
                                }
                              } , isActive:$isRongAnswer){EmptyView()}
            
            RadialGradient(gradient: Gradient(colors: [.white, .blue]), center: .center, startRadius: 2, endRadius: 650).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Color.offWhite.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Color.background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom))
            VStack (alignment: .center){
                
                HStack () {
                    VStack(){
                        
                        
                        Text(" \(number) ").padding()
                            .font(.system(size: 40))
                            .cornerRadius(20)
                            .background(Color.offWhite)
                            .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.6), radius: 10, x: -5, y: -5)
                            .padding()
                          
                        Text("Score : \(Score) / \(allTries)").padding()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 30))
                      
                        HStack{
                            
                            Text("\(randomInt)") .font(.system(size: 70))
                                .padding()
                                .cornerRadius(20)
                                .background(Color.offWhite)
                                
                                .shadow(color: Color.gray.opacity(0.7), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.6), radius: 10, x: -5, y: -5)
                            
                            Text("X").font(.system(size: 50)).padding()
                            
                            Text("\(number)").font(.system(size: 70)).padding()
                                
                                .cornerRadius(20)
                                .background(Color.offWhite)
                                .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.6), radius: 10, x: -5, y: -5)
                            
                        }
                        
                    }.padding()
                    
                    
                }
                Text("=").font(.system(size: 50))
                
                TextField("Enter Result", text: $result2).keyboardType(.numbersAndPunctuation)
                   
                    .multilineTextAlignment(.center)
                    .background(Color.offWhite)
                    .foregroundColor(.green)
                    .padding(.trailing, 1.0)
                    .frame(width: 300, height: 50)
                    .font(.system(size: 50)).frame(width: 250, height: 81, alignment: /*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.6), radius: 10, x: -5, y: -5)
                   
                   
                

                Button(action: {
                    allTries += 1
                    result = String("\(randomInt * number)")
                   
                    if (result2 == result){
                        Score += 1
                        playSound(soundName: "success")
                        
                        isShowingDetailview = true
                        
                    }else {
                        print("Rong naeem")
                        isRongAnswer = true
                        print("Hi naeem ")
                        playSound(soundName: "fail-trombone-01")
                        naeem.score = randomInt * number
                        print("rong")
                    }
                    randomInt = Int.random(in: 1..<10)
                    result2 = ""
                
                }) {
                    
                    Text("Check Answer ").font(.system(size: 40))
                        .cornerRadius(20)
                        .padding()
                      
                        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.white, lineWidth: 5)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.6), radius: 10, x: -5, y: -5)
                        )
                }
                Spacer(minLength: 100)
                
            }      .position(x:200,y:180)
        }
    }
        //very important step hear
        
        .environmentObject(naeem)
        
    }

     func playSound(soundName: String) {
       
     
        let url = URL(fileURLWithPath: Bundle.main.path(forResource:soundName,ofType: "mp3")!)

    do{
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect.play()
            
    }catch{
        print("error")
    }
        
        
    }
    
}



struct multiplication_Previews: PreviewProvider {
    
    static var previews: some View {
        multiplication(number:6)
    }
}

