//
//  APIViwelModel.swift
//  iHome
//
//  Created by Student on 30/10/23.
//

import Foundation

struct Global {
    static var usuarios = [User]()
    static var usuariosAtuais = [User]()
    static var servicosAtuais = [Servico]()
    static var servicosAtuaisDeUsuarioAtual = [Servico]()
    static var userAtual = User()
}

struct API : Decodable {
    var users: [User]?
    var servicos: [Servico]?
    var avaliacoes: [AvaliacaoServico]?
    var userAtual: User?
}

struct Servico: Codable, Identifiable {
    var id: String?
    var _id: String?
    var _rev: String?
    var idOferecedor: String?
    var idContratador: String?
    var tipo: String?
    var nome: String?
    var metodo: String?
    var descricao: String?
    var numeroDeServicos: Int?
    var preco: Double?
    var servicoPic: String?
}

struct AvaliacaoServico: Codable, Identifiable {
    var id: String?
    var _id: String?
    var idAvaliador: String?
    var idAvaliado: String?
    var estrelas: Int?
    var descricao: String?
    var data: String?
}

struct User : Codable, Identifiable {
    var id: String?
    var _id: String?
    var _rev: String?
    var nome: String?
    var sobrenome: String?
    var profilePic: String?
    var descricao: String?
    var email: String?
    var senha: String?
    var telefone: String?
    var mediaAvaliacoes: Int?
    var verificado: Bool?
    var numeroTotaldeAvaliacoes: Int?
    var valor: Double?
    var metodo: String?
    var numeroServicosPrestados: Int?
}

class APIViewModel: ObservableObject {
    
    @Published var api = API(users: [User](), servicos: [Servico](), avaliacoes: [AvaliacaoServico](), userAtual: User())
    
    func fetchUsers() {
        guard let url = URL(string: "http://192.168.128.67:1880/getUsers/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    //logica condicional aqui
                    Global.usuarios = decodificado
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchUsuariosPorId(id: String) {
        guard let url = URL(string: "http://192.168.128.67:1880/getUser/?_id=\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    self?.api.users = decodificado
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchUserAtualPorId(id: String) {
        guard let url = URL(string: "http://192.168.128.67:1880/getUsers/?_id=\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode(User.self, from: data)
                
                DispatchQueue.main.async {
                    Global.userAtual = decodificado
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func postUser(usuario: User) {
        // Prepare URL
        let url = URL(string: "http://192.168.128.67:1880/postUser")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONEncoder().encode(usuario)
        request.httpBody = jsonData
        
        // Set HTTP Request Body
        print(jsonData!)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (jsonData, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
        }
        task.resume()
    }
    
    func putUser(usuario: User){
        // Prepare URL
        let url = URL(string: "http://192.168.128.67:1880/putUser")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONEncoder().encode(usuario)
        request.httpBody = jsonData
        // Set HTTP Request Body
        print(jsonData!)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (jsonData, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
        }
        task.resume()
    }
    
    func fetchServicos() {
        guard let url = URL(string: "http://192.168.128.67:1880/getServicos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode([Servico].self, from: data)
                
                DispatchQueue.main.async {
                    Global.servicosAtuais = decodificado
                    self?.api.servicos = decodificado
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchServicosByCategoria(categoria: String) {
        Global.usuariosAtuais = [User]()
        Global.servicosAtuais = [Servico]()
        guard let url = URL(string: "http://192.168.128.67:1880/getServicos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode([Servico].self, from: data)
                
                DispatchQueue.main.async {
                    for dec in decodificado {
                        if (dec.nome == categoria) {
                            for usu in Global.usuarios {
                                if (usu._id == dec.idOferecedor) {
                                    var usuario = usu
                                    usuario.valor = dec.preco
                                    usuario.metodo = dec.metodo
                                    Global.usuariosAtuais.append(usuario)
                                    Global.servicosAtuais.append(dec)
                                    self?.api.servicos?.append(dec)
                                }
                            }
                        }
                        
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchServicosByUser() {
        Global.servicosAtuaisDeUsuarioAtual = [Servico]()
        guard let url = URL(string: "http://192.168.128.67:1880/getServicos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                let decodificado = try JSONDecoder().decode([Servico].self, from: data)
                
                DispatchQueue.main.async {
                    for dec in decodificado {
                        
                        if (dec.idOferecedor == Global.userAtual._id) {
                            Global.servicosAtuaisDeUsuarioAtual.append(dec)
                        }
                        
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func postServicos(servico: Servico) {
            // Prepare URL
        let url = URL(string: "http://192.168.128.67:1880/postServico")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonData = try? JSONEncoder().encode(servico)
        request.httpBody = jsonData

        // Set HTTP Request Body
        print(jsonData!)

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (jsonData, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
        }
        task.resume()
    }
    
    func putServico(servico: Servico){
        // Prepare URL
        let url = URL(string: "http://192.168.128.67:1880/putServico")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONEncoder().encode(servico)
        request.httpBody = jsonData
        // Set HTTP Request Body
        print(jsonData!)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (jsonData, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
        }
        task.resume()
    }
    
    func deleteServico(servico: Servico){
        // Prepare URL
        let url = URL(string: "http://192.168.128.67:1880/deleteServico")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONEncoder().encode(servico)
        request.httpBody = jsonData
        // Set HTTP Request Body
        print(jsonData!)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (jsonData, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            var copia = Global.servicosAtuaisDeUsuarioAtual
            Global.servicosAtuaisDeUsuarioAtual = [Servico]()
            for service in copia {
                if (service._id! != servico._id) {
                    Global.servicosAtuaisDeUsuarioAtual.append(servico)
                }
            }
        }
        task.resume()
    }
    
}
