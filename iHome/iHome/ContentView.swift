//
//  ContentView.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            PayHome().tabItem{
                Label("Pagamentos", systemImage: "dollarsign.circle.fill")
            }
           
            Home().tabItem{
                Label("Home", systemImage: "list.bullet")
            }
          
            PerfilHome().tabItem{
                Label("Perfil", systemImage: "person.circle.fill")
            }

    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
