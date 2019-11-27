//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct DaySectionWidgetFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment DaySectionWidgetFragment on DaySectionWidget {
      __typename
      date
      amount {
        __typename
        value
        currencyCode
      }
    }
    """

  public static let possibleTypes = ["DaySectionWidget"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("date", type: .nonNull(.scalar(String.self))),
    GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, amount: Amount) {
    self.init(unsafeResultMap: ["__typename": "DaySectionWidget", "date": date, "amount": amount.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var amount: Amount {
    get {
      return Amount(unsafeResultMap: resultMap["amount"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "amount")
    }
  }

  public struct Amount: GraphQLSelectionSet {
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
}
