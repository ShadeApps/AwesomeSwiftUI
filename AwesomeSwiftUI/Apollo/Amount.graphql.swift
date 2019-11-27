//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct Amount: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment Amount on Money {
      __typename
      value
      currencyCode
    }
    """

  public static let possibleTypes = ["Money"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("value", type: .nonNull(.scalar(String.self))),
    GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(value: String, currencyCode: CurrencyCode) {
    self.init(unsafeResultMap: ["__typename": "Money", "value": value, "currencyCode": currencyCode])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var value: String {
    get {
      return resultMap["value"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }

  public var currencyCode: CurrencyCode {
    get {
      return resultMap["currencyCode"]! as! CurrencyCode
    }
    set {
      resultMap.updateValue(newValue, forKey: "currencyCode")
    }
  }
}
