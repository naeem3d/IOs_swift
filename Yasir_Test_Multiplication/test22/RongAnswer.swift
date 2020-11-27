//
//  RongAnswer.swift
//  test22
//
//  Created by naeem alabboodi on 10/8/20.
//

import SwiftUI

struct RongAnswer: View {
  
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationView{
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Corect Answer :").font(.system(size: 30)).foregroundColor(.white)
               Spacer(minLength: 30)
                Text("\(user.score)").font(.system(size: 60)).foregroundColor(.white)
                Spacer(minLength: 30)
                Image("notRight")
                Spacer(minLength: 200)
                    .padding()
            }
        }
    }
       
    }
}

struct RongAnswer_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
