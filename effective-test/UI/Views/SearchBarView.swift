//
//  SearchBarView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

enum SearchBarState {
    case begin
    case search
    
    var cornerRadius: CGFloat {
        return switch self {
            case .begin, .search:
                16
        }
    }
    
    var backgroundColor: Color {
        return switch self {
            case .begin:
                Color("BasicGrey4", bundle: .main)
            case .search:
                Color("GreySearchBar", bundle: .main)
        }
    }
    
    var leadingImage: Image {
        return switch self {
            case .begin:
                Image("MagnifyingGlass", bundle: .main)
            case .search:
                Image("Airplane2", bundle: .main)
        }
    }
    
    var shouldUseShadow: Bool {
        return switch self {
            case .begin, .search:
                true
        }
    }
    
    var isText: Bool {
        return switch self {
            case .begin:
                true
            case .search:
                false
        }
    }
    
    var isTwoImages: Bool {
        return switch self {
            case .begin:
                false
            case .search:
                true
        }
    }
    
    var secondLeadingImage: Image {
        return switch self {
            case .search:
                Image("MagnifyingGlass", bundle: .main)
            default:
                Image("", bundle: nil)
        }
    }
    
    var leadingPadding: CGFloat {
        return switch self {
            case .begin:
                8
            case .search:
                16
        }
    }
}

extension Character {
    var isCyrillic: Bool {
        return ("А"..."я").contains(self) || "Ё" == self || "ё" == self
    }
}

struct SearchBarView: View {
    let state: SearchBarState
    
    @Binding var fromPlace: String
    @Binding var toPlace: String
    
    var body: some View {
        ZStack {
            if self.state.shouldUseShadow {
                RoundedRectangle(cornerRadius: self.state.cornerRadius)
                    .foregroundStyle(self.state.backgroundColor)
                    .shadow(color: .black, radius: 4, x: 0, y: 4)
            } else {
                RoundedRectangle(cornerRadius: self.state.cornerRadius)
                    .foregroundStyle(self.state.backgroundColor)
            }
            HStack {
                if !self.state.isTwoImages {
                    state.leadingImage
                        .frame(width: 24, height: 24)
                }
                VStack(alignment: .leading) {
                    if self.state.isText {
                        Text(fromPlace.isEmpty ? "Откуда - Москва" : fromPlace)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(toPlace == "Откуда - Москва" ? Color("SecondaryText", bundle: .main) : .white)
                    } else {
                        HStack(spacing: 8) {
                            if self.state.isTwoImages {
                                state.leadingImage
                                    .frame(width: 24, height: 24)
                            }
                            TextField("Откуда - Москва", text: _fromPlace)
                        }
                    }
                    Rectangle()
                        .foregroundStyle(Color("Separator", bundle: .main))
                        .frame(height: 1)
                    if self.state.isText {
                        Text(toPlace.isEmpty ? "Куда - Турция" : toPlace)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(toPlace.isEmpty ? Color("SecondaryText", bundle: .main) : .white)
                    } else {
                        HStack(spacing: 8) {
                            if self.state.isTwoImages {
                                state.secondLeadingImage
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.white)
                            }
                            TextField("Куда - Турция", text: _toPlace)
                        }
                    }
                }
            }
            .padding(.leading, self.state.leadingPadding)
            .padding(.trailing, 16)
            .padding(.vertical, 16)
        }
    }
}
