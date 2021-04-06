//
//  ContentView.swift
//  zstak
//
//  Created by naeem alabboodi on 4/4/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var weather = "Soft"
    @State var timepoiling = 0
   
    let items:[String]=["Hard","Medium","Soft"]
    let eggTimes = ["Soft":300,"Medium":420,"Hard":720]
   
    var body: some View {
      
        VStack (spacing: 50){
            
            Spacer()
            Text(  "\(weather) "   + " \nTime remaining is "  )
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Capsule().fill(Color.orange).opacity(0.75))
                .onReceive(timer) { time in
                   
                    
                    if self.timepoiling > 0 {
                        self.timepoiling -= 1
                    }
                }
            Text("\(timepoiling)" + "\nSeconds   ")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                .background(
                        Capsule()
                            .fill(Color.blue)
                            .opacity(0.85)
                    )
                
            
         
          
            HStack(spacing: 10){
               
                ForEach(items,id:\.self){ item in
                    
                    Button(action: {
                        weather = item
                        switch weather {
                        case "Hard":
                           
                            timepoiling = eggTimes["Hard"]!
                            
                        case "Medium":
                            timepoiling = eggTimes["Medium"]!
                        case "Soft":
                            timepoiling = eggTimes["Soft"]!
                        default:
                            timepoiling = 100
                        }
                        
                        
                    }, label: {
                        
                        Image("\(item)").resizable()
                            
                            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    })
                    
                    
                    .onReceive(timer) { time in
                        if Int(weather) ?? 0 > 0 {weather = String( Int(weather)! - 1)}
                        
                    }
                    
                }
                
          
            }
          
            Spacer()
            Spacer()
        }
        
      
    }
   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
