//
//  Model.swift
//  mapTest
//
//  Created by Giovanni Russo on 14/06/22.
//
import SwiftUI

struct MyTip : Identifiable{
    
    var id: Int
    
    var title : String
    var Immagine : String
}

var littleTip = [MyTip(id: 1, title: "Set a timer for your shower", Immagine: "1"),
    MyTip(id: 2, title: "Eat more vegetables", Immagine: "2"),
    MyTip(id: 3, title: "Turn off the lights you don't use", Immagine: "3"),
    MyTip(id: 4, title: "Reuse old stuff", Immagine: "4")
]
