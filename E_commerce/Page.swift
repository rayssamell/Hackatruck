//
//  Page.swift
//  E_commerce
//
//  Created by Turma01-26 on 31/03/25.
//

import SwiftUI

struct Page: View {
    @State var p: Loja
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .bottomTrailing, endPoint: .center)
                .ignoresSafeArea()
            VStack {
                Text(p.nome!)
                    .foregroundStyle(.white)
                    .font(.headline)
                AsyncImage(url: URL(string: p.image!)) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width: 300, height: 300)
                VStack(alignment: .leading){
                    Text("R$ \(p.preco!, specifier: "%.2f")")
                        .foregroundColor(.orange)
                    Text(p.descricao!)
                    .foregroundColor(.white)
                    HStack{
                        Image(systemName: "storefront")
                        Text("\(p.vendedor!)")
                           
                    }  .foregroundColor(.white)
                }
               
                
            }
            .padding(40)
        }
    }
}

