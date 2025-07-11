//
//  OSButton.swift
//  OnlineStore
//
// Created by Md Imran Ali on 11/07/25.
//


import SwiftUI
struct OSButton:View {
    var text:Text
    var body: some View {
        text       
            .frame(width: 260, height: 50)
            .background(.brandPrimary)
            .foregroundStyle(.white).clipShape(RoundedRectangle(cornerRadius: 10))
            .fontWeight(.medium)
    }
}


