//
//  SearchBarState.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
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
