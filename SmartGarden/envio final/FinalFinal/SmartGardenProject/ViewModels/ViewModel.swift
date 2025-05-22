//
//  ViewModel.swift
//  SmartGarden
//
//  Created by Turma01-26 on 07/04/25.
//

import Foundation
import Combine
import CoreLocation
import CoreLocationUI
import SwiftUI

class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    //Weather
    private var cancellable: AnyCancellable?
    @Published var weather: WeatherResponse?
    @Published var isLoading: Bool = false
    @Published var isLoadingLocation: Bool = false
    let locationManager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    
    //Plantas
    @Published var plantName: String = ""
    @Published var confidence: String = ""
    @Published var plantDetails: [PlantaInfo] = []
    @Published var errorMessage: String? = ""
    
    @Published var plantas: [PlantData] = []
    @Published var selectedPlant: PlantData?
    
    
    //Sensor Umidade
    // Variável que armazena o valor da umidade recebido
    @Published var umidade: [Sensor] = []
    
    
    
    // Limites de umidade ajustáveis
    //    @Published var minIdeal = 30
    //    @Published var maxIdeal = 30
    
    
    var umidadeAtual: Int? {
        guard let ultimaUmidade = umidade.last else {
            print("A lista de umidade está vazia.")
            return nil
        }
        
        let umidadeString = ultimaUmidade.umidade
        print("Valor da umidade: \(umidadeString)")
        
        if umidadeString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            print("A umidade está vazia ou contém apenas espaços.")
            return nil
        }
        
        // Tenta converter a string para Double
        if let umidadeDouble = Double(umidadeString) {
            // Arredonda para o inteiro mais próximo
            let umidadeInt = Int(umidadeDouble.rounded())
            return umidadeInt
        } else {
            print("Falha ao converter a umidade para Double. Valor recebido: \(umidadeString)")
            return nil
        }
    }
    
    
    
    
    
    
    private enum APIKEY {
        static let key = "9dbaac0b772398458442cb93d628a73a"
        static let plantKey = "xmu9pL2SVMU1EZ032WwBfxTSgUfDcY7kThPcqS1Ra1urZ02Pt6"
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // ---------------- Dados Weather --------------//
    func fetchWeather(city: String) {
        isLoading = true
        
        let baseURL = "https://api.openweathermap.org/data/2.5/weather"
        
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(APIKEY.key)&units=metric") else {
            fatalError("URL inválida")
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Erro ao buscar o clima: \(error)")
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { weather in
                self.weather = weather
            })
    }
    
    
    func fetchWeatherr(latitude: Double, longitude: Double) {
        isLoading = true
        
        let baseURL = "https://api.openweathermap.org/data/2.5/weather"
        
        guard let url = URL(string: "\(baseURL)?lat=\(latitude)&lon=\(longitude)&appid=\(APIKEY.key)&units=metric") else {
            fatalError("URL inválida")
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Erro ao buscar o clima: \(error)")
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { weather in
                self.weather = weather
            })
    }
    
    
    func requestLocation() {
        isLoadingLocation = true
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        self.location = location.coordinate
        
        
        fetchWeatherr(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        isLoadingLocation = false
        locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isLoadingLocation = false
        print("Falha ao obter a localização: \(error.localizedDescription)")
    }
    
    
    
    // ----------------- Dados Planta API -------------------//
    
    func addPlant(_ plant: PlantData) {
        plantas.append(plant)
        
        guard let url = URL(string: "http://192.168.128.87:1880/PlantaPost") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(plant)
            request.httpBody = jsonData
        } catch {
            print(error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            
            do {
                let parsed = try JSONDecoder().decode(PlantData.self, from: data)
                DispatchQueue.main.async {
                    self?.plantas.append(parsed)
                }
            } catch {
                print(error)
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                print("Planta adicionada com sucesso!")
            } else {
                print("Não foi possível adicionar a planta :( \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            }
        }
        task.resume()
    }
    
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.87:1880/PlantaGet") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode([PlantData].self, from: data)
                
                DispatchQueue.main.async {
                    self?.plantas = parsed
                    // Selecionar a primeira planta (ou a lógica desejada)
                    self?.selectedPlant = parsed.first
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

  
    
            
         
    
    
    // ----------------- Dados Sensor Umidade -------------------//
    func fetchUmidade() {
        isLoading = true
        errorMessage = ""
        
        guard let url = URL(string: "http://192.168.128.87:1880/SensorGet") else {
            self.errorMessage = "URL inválida."
            self.isLoading = false
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Erro de rede: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "Dados não recebidos."
                    return
                }
                
                do {
                    let sensores = try JSONDecoder().decode([Sensor].self, from: data)
                    self?.umidade = sensores
                } catch {
                    self?.errorMessage = "Erro ao decodificar os dados."
                }
            }
        }
        task.resume()
    }
    
    /*
    func corParaUmidade() -> Color {
        guard let valor = umidadeAtual, let selectedPlant = selectedPlant else {
            print("Valor de umidadeAtual ou selectedPlant é nil")
            return .gray
        }
        
        let minIdeal = selectedPlant.umidadeMinIdeal
        let maxIdeal = selectedPlant.umidadeMaxIdeal
        
        print("Valor da umidade: \(valor), minIdeal: \(minIdeal), maxIdeal: \(maxIdeal)")
        
        if valor > maxIdeal {
            return .blue
        } else if valor < (minIdeal / 2){
            return .red
        } else if valor < minIdeal && valor > (minIdeal / 2) {
            return .yellow
        } else {
            return Color(red: 0.0, green: 0.5, blue: 0.0) 
        }
    }

    func mensagemParaUmidade() -> String? {
        guard let valor = umidadeAtual, let selectedPlant = selectedPlant else {
            print("Valor de umidadeAtual ou selectedPlant é nil")
            return nil
        }
        
        let minIdeal = selectedPlant.umidadeMinIdeal
        let maxIdeal = selectedPlant.umidadeMaxIdeal
        
        print("Valor da umidade: \(valor), minIdeal: \(minIdeal), maxIdeal: \(maxIdeal)")
        
        if valor > maxIdeal {
            return "Afogou-se :("
        } else if valor < minIdeal {
            return "É preciso regar a planta!"
        } else {
            return "Sua planta está feliz! :)"
        }
        print(valor)
        print(selectedPlant.umidadeMaxIdeal)
        print(selectedPlant.umidadeMinIdeal)
    }

    func imagemParaUmidade() -> String {
        guard let valor = umidadeAtual, let selectedPlant = selectedPlant else {
            print("Valor de umidadeAtual ou selectedPlant é nil")
            return "green warning" 
        }

        let minIdeal = selectedPlant.umidadeMinIdeal
        let maxIdeal = selectedPlant.umidadeMaxIdeal
        
        if valor > maxIdeal {
            return "blue warning"
        } else if valor < minIdeal && valor > (minIdeal / 2) {
            return "yellow warning"
        } else if valor < (minIdeal / 2) {
            return "red warning"
        } else {
            return "green warning"
        }
    }
*/
    
    func corParaUmidade(for plant: PlantData) -> Color {
        guard let valor = umidadeAtual else {
            print("Valor de umidadeAtual é nil")
            return .gray
        }

        let minIdeal = plant.umidadeMinIdeal
        let maxIdeal = plant.umidadeMaxIdeal

        print("Valor da umidade: \(valor), minIdeal: \(minIdeal), maxIdeal: \(maxIdeal)")

        if valor > maxIdeal {
            return .blue
        } else if valor < (minIdeal / 2) {
            return .red
        } else if valor < minIdeal {
            return .yellow
        } else {
            return Color(red: 0.0, green: 0.5, blue: 0.0)
        }
    }

    func mensagemParaUmidade(for plant: PlantData) -> String? {
        guard let valor = umidadeAtual else {
            print("Valor de umidadeAtual é nil")
            return nil
        }

        let minIdeal = plant.umidadeMinIdeal
        let maxIdeal = plant.umidadeMaxIdeal

        print("Valor da umidade: \(valor), minIdeal: \(minIdeal), maxIdeal: \(maxIdeal)")

        if valor > maxIdeal {
                return "Afogou-se :("
            } else if valor < (minIdeal / 2) {
                return "Urgente: regar agora!"
            } else if valor < minIdeal {
                return "É preciso regar a planta!"
            } else {
                return "Sua planta está feliz! :)"
            }
    }

    func imagemParaUmidade(for plant: PlantData) -> String {
        guard let valor = umidadeAtual else {
            print("Valor de umidadeAtual é nil")
            return "green warning"
        }

        let minIdeal = plant.umidadeMinIdeal
        let maxIdeal = plant.umidadeMaxIdeal

        if valor > maxIdeal {
            return "blue warning"
        } else if valor < (minIdeal / 2) {
            return "red warning"
        } else if valor < minIdeal {
            return "yellow warning"
        } else {
            return "green warning"
        }
    }

    
}
