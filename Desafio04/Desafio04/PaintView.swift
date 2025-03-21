//
//  PaintView.swift
//  Desafio04
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct PaintView: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea(edges:.top)
            Image(systemName: "paintbrush.pointed")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .background(Color.black)
                .frame(width: 300)
                .clipShape(Circle())
        }
    }
}

#Preview {
    PaintView()
}
