//
//  MainView.swift
//  HelpCoding
//
//  Created by jabko on 06/04/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    init() { _ = Dependencies() }
           
    var body: some View {
        List {
            
            if vm.searchResult.contains(where: { $0.type == .iphone} ) {
                iPhoneSection
            }
            
            if vm.searchResult.contains(where: { $0.type == .ipad}) {
                iPadSection
            }
           
        }
        .navigationTitle("APPLE SHOP")
        .animation(.default, value: vm.searchTerm)
        .searchable(text: $vm.searchTerm, prompt: "Find a device")
        .onChange(of: vm.searchTerm) { newValue in
            vm.search(newValue)
        }
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack { ContentView() }
    }
}


extension MainView {
    
    private func header(title: DeviceType) -> some View {
        Text(title.rawValue)
            .font(.largeTitle)
            .textCase(.none)
            .frame(maxWidth: .infinity)
            .padding()
    }
    
    private var iPhoneSection: some View {
        Section(header: header(title: .iphone)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .iphone {
                    Text(dev.name)
                }
            }
        }
    }
    
    private var iPadSection: some View {
        Section(header: header(title: .ipad)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .ipad {
                    Text(dev.name)
                }
            }
        }
    }
    
}
