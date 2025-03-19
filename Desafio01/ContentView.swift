//
//  ContentView.swift
//  Aula1
//
//  Created by Turma01-26 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
                Rectangle()
                    .fill(.red)
                    .frame(width:100, height: 100)
                
            }.frame(width: 250, height: 600)
            VStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
            }.frame(width: 250, height: 400)
        }
        HStack{
            VStack {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
            }.frame(width: 250, height: 600)
            VStack {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 100, height: 100)
            }.frame(width: 250, height: 600)
        }
    }
}

#Preview {
    ContentView()
}
