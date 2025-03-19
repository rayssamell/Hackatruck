//
//  ex02.swift
//  Aula1_Rayssa
//
//  Created by Turma01-26 on 19/03/25.
//

import SwiftUI

struct ex02: View {
    var body: some View {
        HStack{
            Image("foto")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding()
            VStack {
                Text("Hackatruck")
                    .foregroundColor(.red)
                Text("77 Universidades")
                    .foregroundColor(.blue)
                Text("5 regiões do Brasil")
                    .foregroundColor(.yellow)
            }
        }.padding()
    }
}

#Preview {
    ex02()
}
