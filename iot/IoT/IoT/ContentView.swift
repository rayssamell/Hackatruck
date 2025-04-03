//
//  ContentView.swift
//  IoT
//
//  Created by Turma01-26 on 01/04/25.
//

import SwiftUI
import Charts


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Sensor de Umidade")
                .font(.system(size: 16, weight: .medium))
            
            Chart {
                ForEach(viewModel.sensor.sorted { ($0.data) > ($1.data) }, id: \.self) { s in
                    LineMark(x: .value("Hora:", formatDate(s.data)),
                                 y: .value("Umidade:", s.umidade))
                    
                }
                .lineStyle(.init(lineWidth: 2))
                    .symbol(Circle().strokeBorder(lineWidth: 2))
                    .foregroundStyle(.blue)
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(maxWidth: 300, maxHeight: 600)
        }
        .onAppear(){
            viewModel.fetch()
        }
        .frame(height: 360)
    }
    private func formatDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        // Converte a string para um objeto Date
        if let dateObj = dateFormatter.date(from: date) {
            // Formata o objeto Date para exibir apenas a hora
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: dateObj)
        } else {
            return "Data inválida"
        }
    }
}

#Preview {
    ContentView()
}
