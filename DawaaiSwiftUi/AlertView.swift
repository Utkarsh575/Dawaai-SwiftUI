//
//  AlertView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 22/02/24.
//

import SwiftUI

struct AlertView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button("click here"){
            showAlert.toggle()
            
        }.alert(isPresented: $showAlert, content: {
            getAlert()
        })
        
    }
}

func getAlert() -> Alert{
    return Alert(title: Text("Time take your medicine ! 🚨"), message: Text("DOLO 650"), primaryButton: .destructive(Text("Done"), action: {
        print("done")
    }), secondaryButton: .cancel(Text("Snooze")))
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
