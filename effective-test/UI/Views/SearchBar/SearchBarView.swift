//
//  SearchBarView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

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
                                .foregroundStyle(
                                    fromPlace.isEmpty ? .secondaryText : .white
                                )
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
                                .foregroundStyle(
                                    toPlace.isEmpty ? .secondaryText : .white
                                )
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
            .onChange(of: fromPlace) {
                guard !fromPlace.filter({ !$0.isCyrillic }).isEmpty else { return }
                
                fromPlace = fromPlace.filter({ $0.isCyrillic })
            }
            .onChange(of: toPlace) {
                guard !toPlace.filter({ !$0.isCyrillic }).isEmpty else { return }
                
                toPlace = toPlace.filter({ $0.isCyrillic })
            }
        }
    }
}
