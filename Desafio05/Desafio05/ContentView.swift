//
//  ContentView.swift
//  Desafio05
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.azulescuro.ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 120)
                    
                        .padding(100)
                    NavigationLink(destination: Modo1()){
                        Text("Modo 1")
                    }
                    .frame(width: 200, height: 100)
                    .background(Color.pink)
                    .clipShape(Rectangle())
                    .cornerRadius(15)
                    
                    NavigationLink(destination: Modo2()){
                        Text("Modo 2")
                    }
                    .frame(width: 200, height: 100)
                    .background(Color.pink)
                    .clipShape(Rectangle())
                    .cornerRadius(15)
                    
                    NavigationLink(destination: Modo3()){
                        Text("Modo 3")
                    }
                    .frame(width: 200, height: 100)
                    .background(Color.pink)
                    .clipShape(Rectangle())
                    .cornerRadius(15)
                }
            }.foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ContentView()
}
