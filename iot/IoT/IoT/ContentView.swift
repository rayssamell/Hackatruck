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
    //    @State var recebeS : String = ""
    //    @State var recebeS : Date?
    @State var testar = [1,2,3,4]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Line Chart")
                .font(.system(size: 16, weight: .medium))
            
            Chart{
                ForEach(viewModel.sensor.sorted { ($0.umidade) > ($1.umidade) }, id: \.self) { s in
           
                        
                        //                    let currentDate = TimeInterval(s.data!) / 1000
                        //                    let date = Date(timeIntervalSince1970: currentDate)
                        //                    LineMark(x: .value("Hora:", s.data!),
                        //                             y: .value("Umidade:", s.umidade!))
                    LineMark(x: .value("Hora:", s.data),
                                 y: .value("Umidade:", s.umidade))
                        
                        // .foregroundStyle(by: .value(s.umidade, <#_#>))
                    .annotation(position: .trailing) {
                            Text(String(s.umidade))
                                .foregroundColor(.gray)
                        }
                    
                    
                    
                }
            }
            //            .chartXScale(domain: 1730000000000...1744000000000)
            //            .aspectRatio(1, contentMode: .fit)
            //            .padding()
            //.chartLegend(.hidden)
            .frame(maxWidth: 300, maxHeight: 600)
        }
        .onAppear(){
            viewModel.fetch()
            //            let currentDate = TimeInterval(recebeS.data) / 1000
            //            let date = Date(timeIntervalSince1970: currentDate)
        }
        .frame(height: 360)
    }
}

#Preview {
    ContentView()
}
