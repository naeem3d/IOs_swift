//
//  ContentView.swift
//  zstak
//
//  Created by naeem alabboodi on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    @State var secondPass = 0.0
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var weather = "Soft"
    @State var timepoiling = 0.0
    @State var progress = 0.0
   
    let items:[String]=["Hard","Medium","Soft"]
    let eggTimes = ["Soft":30,"Medium":42,"Hard":72]
   
    var body: some View {
      
        VStack (spacing: 50){
            
            Spacer()
            Text(  "\(weather) "   + " \nTime remaining is "  )
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Capsule().fill(Color.orange).opacity(0.75))
                
            ZStack{
            Circle().stroke(lineWidth: 80)
                .opacity(0.25)
                .foregroundColor(Color.red)
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .rotation(Angle(degrees: 270))
                .trim(from: 0.0, to: CGFloat(progress))
                   .stroke(style: StrokeStyle(lineWidth: 80, lineJoin: .round))
                   .foregroundColor(Color.red)
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
                Text(String(format: "%.0f %%", min(Double(self.progress), 1.0)*100))
                .font(.largeTitle)
                .bold()
                .onReceive(timer) { _ in
                    if self.secondPass < timepoiling {
                        secondPass += 1
                        progress = secondPass/timepoiling
                    }
                          }
            }
            Spacer()
            HStack(spacing: 10){
               
                ForEach(items,id:\.self){ item in
                    
                    Button(action: {
                        weather = item
                        switch weather {
                        case "Hard":
                           
                            timepoiling = Double(eggTimes["Hard"]!)
                            secondPass = 0
                            
                        case "Medium":
                            timepoiling = Double(eggTimes["Medium"]!)
                            secondPass = 0
                        case "Soft":
                            timepoiling = Double(eggTimes["Soft"]!)
                            secondPass = 0
                        default:
                            timepoiling = 100
                            secondPass = 0
                        }
                        
                        
                    }, label: {
                        
                        Image("\(item)").resizable()
                            
                            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
