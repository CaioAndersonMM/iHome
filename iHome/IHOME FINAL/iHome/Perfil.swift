//
//  Perfil.swift
//  TelaConstrucao
//
//  Created by Student05 on 01/11/23.
//

import SwiftUI
struct StartScreenButton3: View {
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
        .frame(width: 160.0, height: 10.0)
        .shadow(radius: 5)
        .padding([.top, .bottom],   4)
        .font(.caption2)
    }
}
struct SheetView: View {
    @State var usuario: User
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("azul"))
            
            VStack{
                VStack{
                    Text("Descrição do Profissional").font(.title).fontWeight(.bold).foregroundColor(.white).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                VStack{
                    Text("\(usuario.descricao!)")
                        .font(.title).fontWeight(.bold).foregroundColor(.white)
                }
                Spacer()
            }
            
            
        }
        
    }
}
struct Perfil: View {
    @State var usuario: User
    @State private var isShowingAlert = false
    @State private var isNavigatingToSolicitacoesHome = false
    @State private var showingSheet = false
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle().foregroundColor(Color("azul"))
                    .ignoresSafeArea(.all)
                
                VStack{
                    VStack{
                        Image(usuario.profilePic!).resizable().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 180.0, height: 180.0).scaledToFit().cornerRadius(10)
                            .padding(.bottom, 40.0)
                            .overlay(){
                                Image(systemName: "checkmark.seal.fill").foregroundColor(.cyan)
                                    .font(.system(size: 48))
                                    .padding(.top, 80)
                                    .padding(.leading, 120.0)
                            }
                    }//foto
                    
                    
                    
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("\(usuario.nome!) \(usuario.sobrenome!)").fontWeight(.black).foregroundColor(.white).font(.title2)
                                
                            }
                            HStack{
                                ForEach(1...usuario.mediaAvaliacoes!, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                
                            } //Estrelas
                            
                            
                        }
                        .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        
                        VStack {
                            Button("Contratar") {
                                isShowingAlert = true
                            }.padding()
                                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.4549019608, blue: 0.1450980392, alpha: 0.8)))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .frame(width: 160.0, height: 10.0)
                                .shadow(radius: 5)
                                .padding(.vertical,   4)
                                .font(.title)
                                .fontWeight(.bold)
                                .alert(isPresented: $isShowingAlert) {
                                    Alert(
                                        title: Text("Profissional Contratado"),
                                        message: Text("Parabéns! O profissional foi contratado."),
                                        dismissButton: .default(Text("OK")) {
                                            isNavigatingToSolicitacoesHome = true
                                        }
                                    )
                                }
                            NavigationLink("", destination: SolicitacoesHome(), isActive: $isNavigatingToSolicitacoesHome)
                        }
                        
                        
                    } // Nome & Rating
                    
                    
                    HStack(alignment: .top){
                        
                        VStack{
                            
                            VStack{
                                Text("Valor de serviço:")
                                    .fontWeight(.black)
                                Text("\(String(format: "%2.f", usuario.valor!))").font(.title2).fontWeight(.black)
                            }.frame(width: 240, height: 100)
                                .background(
                                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                                        .fill(Color.white) // Cor do plano de fundo (branco)
                                        .clipShape(PartialRoundedCorners(corners: [.topRight, .bottomRight], radius: 50))
                                )
                            VStack{
                                Text("Serviços prestados:").fontWeight(.black)
                                Text("\(usuario.numeroServicosPrestados!)").font(.title2).fontWeight(.black)
                                
                            }.frame(width: 240, height: 100)
                                .background(
                                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                                        .fill(Color.white) // Cor do plano de fundo (branco)
                                        .clipShape(PartialRoundedCorners(corners: [.topRight, .bottomRight], radius: 50))
                                )
                            
                            VStack{
                                Text("Avaliaçoes:").fontWeight(.black)
                                Text("\(usuario.numeroTotaldeAvaliacoes!)").font(.title2).fontWeight(.black)
                                
                            }
                            .frame(width: 240, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 0, style: .continuous)
                                    .fill(Color.white) // Cor do plano de fundo (branco)
                                    .clipShape(PartialRoundedCorners(corners: [.topRight, .bottomRight], radius: 50))
                            )
                            
                        }
                        
                        
                        Spacer()
                        
                        VStack(alignment: .trailing){
                            Button {
                                showingSheet.toggle()
                                
                            } label: {
                                Image(systemName: "list.bullet.rectangle.fill").foregroundColor(.white).padding(.trailing).font(.system(size: 36))
                            }.foregroundColor(.white)
                                .sheet(isPresented: $showingSheet) {
                                    SheetView(usuario: usuario)
                                }
                            
                            Button("Descrição")
                            {
                                showingSheet.toggle()
                            }.foregroundColor(.white).controlSize(.large)
                                .sheet(isPresented: $showingSheet) {
                                    SheetView(usuario: usuario)
                                }.fontWeight(.black)
                            
                        }.padding(.trailing, 20)
                    }
                    .padding(.top, 50) // Inferior
                    
                }
            }
        }
    }
    struct Perfil_Previews: PreviewProvider {
        static var previews: some View {
            Perfil(usuario: User())
        }
    }
    
    struct PartialRoundedCorners: Shape {
        var corners: UIRectCorner
        var radius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
}
