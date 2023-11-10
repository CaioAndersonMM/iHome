//
//  ContentView.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = APIViewModel()
    @State private var selectedTab = 1 // 1 representa a guia "Home"
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                SolicitacoesHome().tabItem{
                    Label("Serviços", systemImage: "dollarsign.circle.fill")
                }
                .tag(0)
                
                Home().tabItem{
                    Label("Home", systemImage: "list.bullet")
                } .tag(1)
                
                PerfilHome().tabItem{
                    Label("Perfil", systemImage: "person.circle.fill")
                }
                .tag(2)
                
            }
            
        }.onAppear {
            selectedTab = 1 // Seleciona automaticamente a guia "Home" ao iniciar o aplicativo
            model.fetchUserAtualPorId(id: "f9b17232cf881c19d21822b2ed8c3821")
            model.fetchUsers()
            model.fetchServicos()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){a in
                if(Global.userAtual._id != nil){
                    model.fetchServicosByUser()
                    a.invalidate()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1
        )
    }
}

