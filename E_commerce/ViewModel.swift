//
//  ViewModel.swift
//  E_commerce
//
//  Created by Turma01-26 on 29/03/25.
//

import Foundation

class ViewModel: ObservableObject {
   
    @Published var produtos: [Loja] = []
    
    func fetch(){
        
        guard let url = URL(string: "http://127.0.0.1:1880/GetSerie") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with:url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Loja].self, from: data)
                
                DispatchQueue.main.async {
                    self?.produtos = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
