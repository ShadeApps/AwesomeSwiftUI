//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum CurrencyCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case gbp
  case rub
  case usd
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GBP": self = .gbp
      case "RUB": self = .rub
      case "USD": self = .usd
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .gbp: return "GBP"
      case .rub: return "RUB"
      case .usd: return "USD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CurrencyCode, rhs: CurrencyCode) -> Bool {
    switch (lhs, rhs) {
      case (.gbp, .gbp): return true
      case (.rub, .rub): return true
      case (.usd, .usd): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CurrencyCode] {
    return [
      .gbp,
      .rub,
      .usd,
    ]
  }
}

public enum TransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case regular
  case cashback
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REGULAR": self = .regular
      case "CASHBACK": self = .cashback
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .regular: return "REGULAR"
      case .cashback: return "CASHBACK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionType, rhs: TransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.regular, .regular): return true
      case (.cashback, .cashback): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionType] {
    return [
      .regular,
      .cashback,
    ]
  }
}
