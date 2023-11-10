//
//  AdicionarServicos.swift
//  iHome
//
//  Created by Student07 on 06/11/23.
//

import SwiftUI

struct AdicionarServicos: View {
    @StateObject var model = APIViewModel()
    @State private var selection = ""
    @State private var selection2 = ""
    
    @State private var valor = 0.0
    @State private var metodo = "Método"
    
    let categories = ["Categorias", "Pinturas", "Consertos", "Limpezas", "Construções"]
    
    let subcategories1 = ["Paredes", "Pisos", "Móveis", "Envernizar", "Grafites"]
    let subcategories2 = ["Móveis", "Forro", "Piso", "Portas", "Torneiras", "Chuveiros", "Tomadas", "Ponto De Luz", "Canos", "Fechaduras"]
    
    let subcategories3 = ["Roupas", "Estofados", "Vidros", "Espaços", "Louças", "Piscinas"]
    
    let subcategories4 = ["Alvenarias", "Torneiras", "Chuveiros", "Tomadas", "Ponto de Luz", "Forros", "Rebocos", "Assentamento", "Portas", "Estrutura Eletricas", "Estrutura Hidraulica"]
    
    var selectedSubcategories: [String] {
        switch selection {
        case "Categoria":
            return []
        case "Pinturas":
            return subcategories1
        case "Consertos":
            return subcategories2
        case "Limpezas":
            return subcategories3
        case "Construções":
            return subcategories4
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationStack{

        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
            VStack{
                HStack{
                    Image("gabriel")
                        .resizable()
                        .padding(.trailing)
                        .frame(width: 130.0, height: 110.0)
                    VStack{
                        VStack{
                            Text("Adicionar Serviços").font(.title3).fontWeight(.black).foregroundColor(.white).multilineTextAlignment(.center)
                        }
                    }
                }
                .padding(.top, 20.0)
                
                Divider()
                    .background(Color.white)
                    .frame(height: 20)
                
                VStack{
                    HStack{
                        Picker("Select a Category", selection: $selection) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }.accentColor(.white) // Set the selected indicator and other elements' color
                        
                        Picker("Select a Subcategory", selection: $selection2) {
                            ForEach(selectedSubcategories, id: \.self) {
                                Text($0)
                            }
                        }.accentColor(.white) // Set the selected indicator and other elements' color
                    }
                    
                    TextField("Valor", value: $valor, formatter: NumberFormatter())
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(hex: 0x2077C8).opacity(0.46))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    TextField("Metodo", text: $metodo).frame(width: 300.0, height: 50.0)
                        .background(Color(hex: 0x2077C8).opacity(0.46))
                        .foregroundColor(.white).cornerRadius(6).multilineTextAlignment(.center)
                    NavigationLink(destination: PerfilHome()){
                        
                        
                        Button("Criar Serviço") {
                            model.postServicos(servico: Servico(idOferecedor: Global.userAtual._id, tipo: selection, nome: selection2, metodo: metodo, descricao: "teste", numeroDeServicos: 1, preco: valor, servicoPic: selection.dropLast().lowercased()))
                        }
                    }
                    .frame(width: 200)
                    .padding()
                    .background(Color(red: 0x00 / 255, green: 0x61 / 255, blue: 0xBA / 255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.top, 20.0)
                    
                    //LoginScreenButton(title: "Criar Serviço")
                    
                    
                }
                .frame(width: 0.0)
                Spacer()
                
            }
        }
            
        }
    }
}

struct AdicionarServicos_Previews: PreviewProvider {
    static var previews: some View {
        AdicionarServicos()
    }
}
