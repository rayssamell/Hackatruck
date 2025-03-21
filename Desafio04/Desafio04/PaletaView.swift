//
//  PaletaView.swift
//  Desafio04
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct PaletaView: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea(edges:.top)
            Image(systemName: "paintpalette")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.gray)
                .background(Color.black)
                .clipShape(Circle())
            
                    
        }
    }
}

#Preview {
    PaletaView()
}
