//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct TransactionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment TransactionFragment on TransactionWidget {
      __typename
      transaction {
        __typename
        id
        title
        type
        amount {
          __typename
          value
          currencyCode
        }
      }
      image {
        __typename
        iconName
      }
    }
    """

  public static let possibleTypes = ["TransactionWidget"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("transaction", type: .nonNull(.object(Transaction.selections))),
    GraphQLField("image", type: .object(Image.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(transaction: Transaction, image: Image? = nil) {
    self.init(unsafeResultMap: ["__typename": "TransactionWidget", "transaction": transaction.resultMap, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var transaction: Transaction {
    get {
      return Transaction(unsafeResultMap: resultMap["transaction"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "transaction")
    }
  }

  public var image: Image? {
    get {
      return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "image")
    }
  }

  public struct Transaction: GraphQLSelectionSet {
    public static let possibleTypes = ["Transaction"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
      GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, title: String, type: TransactionType, amount: Amount) {
      self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "title": title, "type": type, "amount": amount.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var title: String {
      get {
        return resultMap["title"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "title")
      }
    }

    public var type: TransactionType {
      get {
        return resultMap["type"]! as! TransactionType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
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

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("iconName", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(iconName: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Image", "iconName": iconName])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var iconName: String? {
      get {
        return resultMap["iconName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "iconName")
      }
    }
  }
}
