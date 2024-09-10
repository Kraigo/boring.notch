//
//  HoverButton.swift
//  boringNotch
//
//  Created by Kraigo on 04.09.2024.
//

import SwiftUI

struct HoverButton: View {
    var icon: String
    var iconColor: Color = .white;
    var action: () -> Void
    
    @State private var isHovering = false

    var body: some View {
        Button(action: action) {
            Rectangle()
                .fill(.clear)
                .contentShape(Rectangle())
                .frame(width: 30, height: 30)
                .overlay {
                    Capsule()
                        .fill(isHovering ? Color.gray.opacity(0.3) : .clear)
                        .frame(width: 30, height: 30)
                        .overlay {
                            Image(systemName: icon)
                                .foregroundColor(iconColor)
                                .imageScale(.medium)
                        }
                }
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovering = hovering
        }
    }
}
