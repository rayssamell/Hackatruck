//
//  Personagem.swift
//  Desafio08
//
//  Created by Turma01-26 on 26/03/25.
//

import SwiftUI

struct Personagem: View {
    @State var p: HaPo
    
    var body: some View {
        ZStack{
            Color(.vinho)
                .ignoresSafeArea()
            
            VStack{
                AsyncImage(url: URL(string: p.image!)) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width: 300, height: 300)
                .clipShape(Rectangle())
                
                Spacer()
            }
            VStack{
                Text(p.name!)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(30)
                HStack{
                    Text(p.house!)
                    Text(p.dateOfBirth!)
                }
                .font(.subheadline)
                HStack{
                    Text(p.patronus!)
                    Text(p.gender!)
                }
                .font(.subheadline)
               
                Text(p.ancestry!)
                Text(p.actor!)
            }
            .bold()
            .foregroundStyle(.white)
        }
    }
}

