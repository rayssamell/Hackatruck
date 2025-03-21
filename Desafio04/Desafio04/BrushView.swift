//
//  BrushView.swift
//  Desafio04
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct BrushView: View {
    var body: some View {
            ZStack{
                Color.pink.ignoresSafeArea(edges:.top)
                Image(systemName: "paintbrush")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(Color.pink)
                    .background(Color.black)
                    .clipShape(Circle())
            }
    }
}

#Preview {
    BrushView()
}
