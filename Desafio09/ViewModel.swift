//
//  ViewModel.swift
//  Desafio09
//
//  Created by Turma01-26 on 27/03/25.
//

import Foundation

class ViewModel: ObservableObject {
   
    @Published var series: [Series] = []
    
    func fetch(){
        
        guard let url = URL(string: "http://127.0.0.1:1880/GetSerie") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with:url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Series].self, from: data)
                
                DispatchQueue.main.async {
                    self?.series = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
