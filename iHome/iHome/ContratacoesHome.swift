//
//  ContratacoesHome.swift
//  iHome
//
//  Created by Student07 on 01/11/23.
//

import SwiftUI



struct Profissional{
    var nome: String?
    var sobrenome: String?
    var profilePic: String?
    var email: String?
    var senha: String?
    var telefone: String?
    //var servicosOferecidos: [Servico]?
    //var servicosContratados: [Servico]?
    //var avaliacao: [Avaliacao]?
    var mediaAvaliacoes: Int?
    var verificado: Bool?
    var numeroTotaldeAvaliacoes: Int?
    var descricao: String?
}


struct ContratacoesHome: View {
    @State var category = ""
    @State var valor = 10
    
    
    @State var profissionais: [Profissional] = [
        Profissional(nome: "João", sobrenome: "Silva", profilePic: "joao_pic", email: "joao@example.com", senha: "senha123", telefone: "123-456-7890", mediaAvaliacoes: 4, verificado: true, numeroTotaldeAvaliacoes: 20, descricao: "maior pinto do rio"),
        Profissional(nome: "Maria", sobrenome: "Pereira", profilePic: "maria_pic", email: "maria@example.com", senha: "senha456", telefone: "987-654-3210", mediaAvaliacoes: 5, verificado: true, numeroTotaldeAvaliacoes: 30, descricao: "maioral do piaui"),
        // Adicione mais profissionais aqui
    ]
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                
                
                ScrollView{
                    VStack(alignment: .leading){
                        HStack{
                            Text("Profissionais").font(.title).fontWeight(.black).foregroundColor(.white)
                            Spacer()
                            
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .frame(width: 40.0, height: 39.0).background(.white).cornerRadius(10)
                        }
                        .padding(.horizontal, 30.0)
                        
                    }
                   
                    ForEach(profissionais, id: \.nome) { item in
                        
                        VStack(alignment: .trailing){
                            
                                VStack{
                                    HStack(alignment: .top){
                                        Image(item.profilePic!).resizable().frame(width: 190.0, height: 180.0).scaledToFit()
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing){
                                            Text(item.nome!).font(.title2).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding(.top, 30.0)
                                            Text(item.descricao!).font(.callout).fontWeight(.medium).foregroundColor(Color("azul")).multilineTextAlignment(.trailing)
                                            
                                            HStack{
                                                
                                                ForEach(1...item.mediaAvaliacoes!, id: \.self) { _ in
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color("azul"))
                                                }
                                                .padding(.vertical, 5.0)
                                                
                                            }
                                            
                                            Text("R$ \(valor) por m™").font(.title3).fontWeight(.black).foregroundColor(Color("azul")).padding(.top)
                                            
                                        }
                                        .padding(.trailing, 20.0)
                                        
                                    }
                                }.background(.white).padding(.top, 2)
                            
                            .padding(.top, 20.0)
                            
                            NavigationLink(destination: PerfilHome()){
                                StartScreenButton(title: "Escolher")
                            }

                        }
                    }
                }.background(Color("azul"))
                
            }
            
        }
    }
}

struct StartScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.2431372549, green: 0.4549019608, blue: 0.1450980392, alpha: 0.8)))
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(width: 150.0, height: 20.0)
        .shadow(radius: 5)
        .padding([.top, .bottom], 8)
        .font(.caption2)
    }
}

struct ContratacoesHome_Previews: PreviewProvider {
    static var previews: some View {
        ContratacoesHome()
    }
}
