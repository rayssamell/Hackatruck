//
//  ListView.swift
//  Desafio04
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack{
            Color.color.ignoresSafeArea()
            VStack{
                VStack(alignment: .leading){
                    Text("List")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                VStack{
                    List{
                        HStack{
                            Text("Item " )
                            Spacer()
                            Image(systemName: "paintbrush")
                        }
                        HStack{
                            Text("Item ")
                            Spacer()
                            Image(systemName: "paintbrush.pointed")
                        }
                        HStack{
                            Text("Item ")
                            Spacer()
                            Image(systemName: "paintpalette")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ListView()
}
