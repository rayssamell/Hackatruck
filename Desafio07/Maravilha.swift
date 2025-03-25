//
//  Maravilha.swift
//  Desafio07
//
//  Created by Turma01-26 on 25/03/25.
//

import SwiftUI

struct Maravilha: View {
    @State var m: Location
    
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()
            
            VStack{
                AsyncImage(url: URL(string: m.foto)) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width: 300, height: 200)
                .clipShape(Rectangle())
                .padding()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
               
                VStack{
                    Text(m.nome)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.brown)
                    Text(m.description)
                        .clipShape(Rectangle())
                        .foregroundColor(.black)
                        .background(.brown)
                        .font(.subheadline)
                        .bold()
                        .padding()
                }
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    Maravilha(m: Location(nome: "", foto: "", description: "", latitude: 0.0, longitude: 0.0))
}
