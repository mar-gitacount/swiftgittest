//
//  ContentView.swift
//  testfirebase
//
//  Created by 市川マサル on 2022/10/10.
//
//ここで投稿一覧を表示させる
import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State var message = ""
    var body: some View {
        VStack {
            Text(message).padding().onAppear{
                let ref = Database.database().reference()
                ref.child("message").getData {(error, snapshot)in
                    if let error = error {
                        print("Error getting data \(error)")
                        self.message = "test"
                        return
                    }
                    else if let snapshot = snapshot {
                        if snapshot.exists(){
                            guard let message = snapshot.value as? String else{
                                self.message = "test"
                                return
                            }
                            self.message = message
                        }
                    }
                    self.message = message
                }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!!!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
