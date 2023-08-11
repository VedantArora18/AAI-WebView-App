//
//  ContentView.swift
//  AAIProject
//
//  Created by Vedant Arora on 04/08/23.
//

import SwiftUI
import WebKit
struct ContentView: View {
    @State private var showWebView = false
    private let urlString: String = "https://www.aai.aero/"
    var body: some View {
        
        VStack(spacing: 40) {
            WebView(url: URL(string: urlString)!).frame(height: 700.0)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 20.0, x: 5, y:5)
            }
        Link(destination: URL(string: urlString)!, label:{
            Text("Open in a new Window")
                .foregroundColor(.blue)
        })
        
        Button ("Open in a sheet"){
            showWebView.toggle()
        }
        .sheet(isPresented: $showWebView){
            WebView(url: URL(string: urlString)!)
        }
        Spacer()
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
