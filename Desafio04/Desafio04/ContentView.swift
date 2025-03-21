//
//  ContentView.swift
//  Desafio04
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
                BrushView()
                    .tabItem {
                        Label("Rosa", systemImage:"paintbrush.fill")
                    }
                PaintView()
                    .tabItem {
                        Label("Azul", systemImage:"paintbrush.pointed.fill")
                    }
                PaletaView()
                .tabItem{
                    Label("Cinza", systemImage:"paintpalette.fill")
                }
                ListView()
                    .tabItem {
                        Label("Lista", systemImage:"list.bullet")
                    }
        }
    }
}

#Preview {
    ContentView()
}
