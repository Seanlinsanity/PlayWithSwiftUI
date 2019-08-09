//
//  ContentView.swift
//  PlaySwiftUI
//
//  Created by SEAN on 2019/6/16.
//  Copyright © 2019 seanlin. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let name, message: String
    let imageName: String
}

struct ContentView : View {
    let users: [User] = [
        .init(id: 0, name: "Stephen Curry", message: "I am the best shooter in NBA. Nobody is better on three point than me. I am just a legend in the league now.", imageName: "curry"),
        .init(id: 1, name: "Klay Thomphson", message: "I will be back on the court soon", imageName: "klay"),
        .init(id: 2, name: "Lebron James", message: "Keep fighting! Keep fighting", imageName: "lebron")
    ]
    var body: some View {
        NavigationView{
            List {
                Text("Players").font(.largeTitle)
                ForEach(users.identified(by: \.id)) { user in
                    UserRow(user: user)
                }
            }
        }.navigationBarTitle(Text("Gloden State Warriors"))
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
                //.clipped()
            VStack (alignment: .leading){
                Text(user.name).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
                }.padding(.init(top: 0, leading: 8, bottom: 0, trailing: 0))
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
