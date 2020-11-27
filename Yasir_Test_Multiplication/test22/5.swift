//
//  ContentView.swift
//  test22
//
//  Created by naeem alabboodi on 10/7/20.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow,.gray,.green]
   
    var body: some View {
        NavigationView{
            
            GeometryReader { fullView in
                Image("GoodLuck").font(.system(size: 200))      .position(x:200,y:30)
                   
                   
                  
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(2..<11) { index in
                            GeometryReader { geo in
                                NavigationLink(destination:multiplication(number: index)){
                                    RoundedRectangle(cornerRadius: 25)
                                   
                                    .fill(self.colors[index % 9])
                                    .frame(height: 250)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 4) / 10), axis: (x: 0, y: 1, z: 0))
                                    .position(x: geo.size.width / 2, y: geo.size.height / 3)
                                    
                                        .overlay( Text("Table: \(index)")  .position(x: geo.size.width / 2, y: geo.size.height / 3))
                                       
                                    .font(.system(size: 30))
                                    .font(.system(.caption))
                                    .foregroundColor(.white)
                            }
                            }
                            .frame(width: 150)
                        }
                        }
                    
                    }
                .position(x:200,y:500)
                    .padding(.horizontal, (fullView.size.width - 150) / 16)
                }
            }
            .navigationTitle("Table multiplication")
            .edgesIgnoringSafeArea(.all)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
