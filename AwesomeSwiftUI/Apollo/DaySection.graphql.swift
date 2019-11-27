//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct DaySection: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment DaySection on DaySectionWidget {
      __typename
      date
      amountObject: amount {
        __typename
        ...Amount
      }
    }
    """

  public static let possibleTypes = ["DaySectionWidget"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("date", type: .nonNull(.scalar(String.self))),
    GraphQLField("amount", alias: "amountObject", type: .nonNull(.object(AmountObject.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, amountObject: AmountObject) {
    self.init(unsafeResultMap: ["__typename": "DaySectionWidget", "date": date, "amountObject": amountObject.resultMap])
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

  public var amountObject: AmountObject {
    get {
      return AmountObject(unsafeResultMap: resultMap["amountObject"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "amountObject")
    }
  }

  public struct AmountObject: GraphQLSelectionSet {
    public static let possibleTypes = ["Money"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(Amount.self),
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

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var amount: Amount {
        get {
          return Amount(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
