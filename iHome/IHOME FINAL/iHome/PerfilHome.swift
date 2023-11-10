//
//  PerfilHome.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct PerfilHome: View {
    @StateObject var model = APIViewModel()
    @State var vetor = [Servico]()
    @State var category = ""
    
    @State var subcategories: [SubcategoryConstrucao] = [
        SubcategoryConstrucao(name: "Alvenaria", imageName: "alvenaria"),
        SubcategoryConstrucao(name: "Torneiras", imageName: "torneira"),
        SubcategoryConstrucao(name: "Chuveiros", imageName: "chuveiro"),
        SubcategoryConstrucao(name: "Tomadas", imageName: "tomada"),
        SubcategoryConstrucao(name: "Ponto de Luz", imageName: "pontodeluz"),
        SubcategoryConstrucao(name: "Forros", imageName: "forro"),
        SubcategoryConstrucao(name: "Rebocos", imageName: "reboco"),
        SubcategoryConstrucao(name: "Ceramica", imageName: "ceramica"),
        SubcategoryConstrucao(name: "Portas", imageName: "porta"),
        SubcategoryConstrucao(name: "Estruturas Hidráulica", imageName: "encanamento"),
        SubcategoryConstrucao(name: "Estruturas Elétricas", imageName: "estruturaeletrica")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                VStack(alignment: .leading){
                    HStack{
                        if (!Global.userAtual.verificado!) {
                            Image("\(Global.userAtual.profilePic!)")
                                .padding(.bottom, 40.0)
                        } else {
                            Image("\(Global.userAtual.profilePic!)")
                                .padding([.leading, .bottom], 40.0)
                                .overlay(){
                                    Image(systemName: "checkmark.seal.fill").foregroundColor(.cyan)
                                        .font(.system(size: 48))
                                        .padding(.top, 80)
                                        .padding(.leading, 150.0)
                                }
                        }
                        
                        VStack{
                            VStack{
                                
                                Text("Alterar Foto Editar Nome").font(.footnote).fontWeight(.black).foregroundColor(Color("azul")).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 150.0).background(.white).cornerRadius(10)
                                
                                if (!Global.userAtual.verificado!) {
                                    Text("Verificar Perfil").font(.footnote).fontWeight(.black).foregroundColor(Color("azul")).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 150.0).background(.white)
                                        .cornerRadius(10)
                                }
                                
                                NavigationLink(destination: Avaliacao()){
                                    
                                    Text("Ver Avaliações").font(.footnote).fontWeight(.black).foregroundColor(Color("azul")).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 150.0).background(.white)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.leading, 20.0)
                        }
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("\(Global.userAtual.nome!)").font(.title).fontWeight(.black).foregroundColor(.white)
                        HStack{
                            HStack{
                                ForEach(1...Global.userAtual.mediaAvaliacoes!, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                .padding(.vertical, 5.0)
                            } //Estrelas
                            Text("Serviços Ofertados").fontWeight(.black).foregroundColor(.white).padding(.leading, 60.0)
                        }
                        
                        ScrollView{
                            ForEach(vetor, id: \.self._id) { item in
                                VStack{
                                    
                                    VStack{
                                        HStack(alignment: .top){
                                            Image(item.servicoPic!).resizable().frame(width: 170.0, height: 170.0).scaledToFit()
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .trailing){
                                                Text("\(item.tipo!) de \(item.nome!)").font(.caption).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding([.top, .leading, .bottom], 5.0)
                                                    .padding(.trailing, 30.0)
                                                
                                                VStack(alignment: .trailing){
                                                    Text("R$ \(String(format: "%.2f", item.preco!))").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0) .background(Color(red: 0x00/255, green: 0x3F/255, blue: 0x06/255).opacity(0.86)).cornerRadius(2)
                                                    
                                                    Text("\(item.metodo!)").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0)   .background(Color(red: 0x57/255, green: 0x3F/255, blue: 0x24/255)).cornerRadius(2)

                                                }
                                                
                                                VStack{
                                                    EditScreenButton(title: "Editar   ")
                                                        .padding(.top, 5)
                                                    Button("Excluir") {
                                                        model.deleteServico(servico: item)
                                                    }   .padding()
                                                        .frame(height: 30.0)
                                                        .background(Color(#colorLiteral(red: 0.7431372549, green: 0.1549019608, blue: 0.1450980392, alpha: 0.8)))
                                                        .foregroundColor(.white)
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5)
                                                        .font(.callout)
                                                        .fontWeight(.bold)
                                                    
                                                }
                                            }
                                            .padding(.leading, 10.0)
                                        }.background(.white).padding(.top, 2)
                                    }
                                    
                                }
                            }
                            NavigationLink(destination: AdicionarServicos()){
                                Text("Criar Novo Serviço")
                                    .multilineTextAlignment(.center)
                                    .frame(width: 190.0, height: 20.0)
                                    .padding()
                                    .background(Color(#colorLiteral(red: 0.2431372549, green: 0.4549019608, blue: 0.1450980392, alpha: 0.8)))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.vertical, 10.0)
                                    .font(.title3)
                                    .fontWeight(.black)
                            }
                            
                        }
                        
                    }
                    .padding(.leading)
                    
                }.onAppear() {
                    
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ a  in
                        if(Global.servicosAtuaisDeUsuarioAtual != nil){
                            vetor = Global.servicosAtuaisDeUsuarioAtual
                            a.invalidate()
                        }
                    }
                }
                
            }
        }
        
    }
}


struct EditScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
        }
        .padding()
        .frame(height: 30.0)
        .background(Color(#colorLiteral(red: 0.0431372549, green: 0.1549019608, blue: 0.9450980392, alpha: 0.8)))
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .font(.caption2)
    }
}


struct DeleteScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
        }
        .padding()
        .frame(height: 30.0)
        .background(Color(#colorLiteral(red: 0.7431372549, green: 0.1549019608, blue: 0.1450980392, alpha: 0.8)))
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .font(.caption2)
    }
}

struct PerfilHome_Previews: PreviewProvider {
    static var previews: some View {
        PerfilHome()
    }
}
