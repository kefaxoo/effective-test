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
    case searchResults
    
    var cornerRadius: CGFloat {
        return 16
    }
    
    var backgroundColor: Color {
        return switch self {
            case .begin:
                .basicGrey4
            case .search, .searchResults:
                .greySearchBar
        }
    }
    
    var leadingImage: Image {
        return switch self {
            case .begin:
                Image(.magnifyingGlass)
            case .search:
                Image(.airplane2)
            case .searchResults:
                Image(.arrowLeft)
        }
    }
    
    var shouldUseShadow: Bool {
        return switch self {
            case .begin, .search:
                true
            default:
                false
        }
    }
    
    var isText: Bool {
        return switch self {
            case .begin, .searchResults:
                true
            default:
                false
        }
    }
    
    var isTwoImages: Bool {
        return switch self {
            case .search:
                true
            default:
                false
        }
    }
    
    var secondLeadingImage: Image {
        return switch self {
            case .search:
                Image(.magnifyingGlass)
            case .searchResults:
                Image(.move)
            default:
                Image("", bundle: nil)
        }
    }
    
    var leadingPadding: CGFloat {
        return switch self {
            case .begin, .searchResults:
                8
            default:
                16
        }
    }
    
    var removeImage: Image {
        return switch self {
            case .search, .searchResults:
                Image(.xMark)
            default:
                Image("", bundle: .main)
        }
    }
    
    var isTopTrailingImage: Bool {
        return switch self {
            case .searchResults:
                true
            default:
                false
        }
    }
    
    var isRemoveMode: Bool {
        return switch self {
            case .search, .searchResults:
                true
            default:
                false
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
    
    var backDidTap: (() -> Void)? = nil
    var moveDidTap: (() -> Void)? = nil
    
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
                    if self.state == .searchResults {
                        state.leadingImage
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                self.backDidTap?()
                            }
                    } else {
                        state.leadingImage
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                self.backDidTap?()
                            }
                    }
                }
                VStack(alignment: .leading) {
                    if self.state.isText {
                        HStack {
                            Text(fromPlace.isEmpty ? "Откуда - Москва" : fromPlace)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(toPlace == "Откуда - Москва" ? .secondaryText : .white)
                            Spacer()
                            if self.state.isTopTrailingImage {
                                state.secondLeadingImage
                                    .frame(width: 24, height: 24)
                                    .onTapGesture {
                                        self.moveDidTap?()
                                    }
                            }
                        }
                    } else {
                        HStack(spacing: 8) {
                            if self.state.isTwoImages {
                                state.leadingImage
                                    .frame(width: 24, height: 24)
                            }
                            TextField("Откуда - Москва", text: _fromPlace)
                            Spacer()
                        }
                    }
                    Rectangle()
                        .foregroundStyle(.separatorCustom)
                        .frame(height: 1)
                    if self.state.isText {
                        HStack {
                            Text(toPlace.isEmpty ? "Куда - Турция" : toPlace)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(toPlace.isEmpty ? .secondaryText : .white)
                            Spacer()
                            if self.state.isRemoveMode {
                                state.removeImage
                                    .frame(width: 24, height: 24)
                            }
                        }
                    } else {
                        HStack(spacing: 8) {
                            if self.state.isTwoImages {
                                state.secondLeadingImage
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.white)
                            }
                            TextField("Куда - Турция", text: _toPlace)
                            Spacer()
                            if self.state.isRemoveMode {
                                state.removeImage
                                    .frame(width: 24, height: 24)
                            }
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
