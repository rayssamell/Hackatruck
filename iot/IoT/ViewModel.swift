//
//  ViewModel.swift
//  IoT
//
//  Created by Turma01-26 on 01/04/25.
//

import Foundation

class ViewModel: ObservableObject {
   
    @Published var sensor: [Sensor] = []
    
    func fetch(){
        
        guard let url = URL(string: "http://192.168.128.85:1880/iotget") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with:url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Sensor].self, from: data)
                
                DispatchQueue.main.async {
                    self?.sensor = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
