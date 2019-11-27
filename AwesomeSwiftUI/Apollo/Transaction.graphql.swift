//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct Transaction: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment Transaction on TransactionWidget {
      __typename
      transactionObject: transaction {
        __typename
        id
        title
        type
        amountObject: amount {
          __typename
          ...Amount
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
    GraphQLField("transaction", alias: "transactionObject", type: .nonNull(.object(TransactionObject.selections))),
    GraphQLField("image", type: .object(Image.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(transactionObject: TransactionObject, image: Image? = nil) {
    self.init(unsafeResultMap: ["__typename": "TransactionWidget", "transactionObject": transactionObject.resultMap, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var transactionObject: TransactionObject {
    get {
      return TransactionObject(unsafeResultMap: resultMap["transactionObject"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "transactionObject")
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

  public struct TransactionObject: GraphQLSelectionSet {
    public static let possibleTypes = ["Transaction"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
      GraphQLField("amount", alias: "amountObject", type: .nonNull(.object(AmountObject.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, title: String, type: TransactionType, amountObject: AmountObject) {
      self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "title": title, "type": type, "amountObject": amountObject.resultMap])
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
