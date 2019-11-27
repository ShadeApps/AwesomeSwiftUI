//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class TransactionListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query TransactionList {
      dailyTransactionsFeed {
        __typename
        ...DaySection
        ...Transaction
      }
    }
    """

  public let operationName = "TransactionList"

  public var queryDocument: String { return operationDefinition.appending(DaySection.fragmentDefinition).appending(Amount.fragmentDefinition).appending(Transaction.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("dailyTransactionsFeed", type: .list(.object(DailyTransactionsFeed.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(dailyTransactionsFeed: [DailyTransactionsFeed?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "dailyTransactionsFeed": dailyTransactionsFeed.flatMap { (value: [DailyTransactionsFeed?]) -> [ResultMap?] in value.map { (value: DailyTransactionsFeed?) -> ResultMap? in value.flatMap { (value: DailyTransactionsFeed) -> ResultMap in value.resultMap } } }])
    }

    public var dailyTransactionsFeed: [DailyTransactionsFeed?]? {
      get {
        return (resultMap["dailyTransactionsFeed"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [DailyTransactionsFeed?] in value.map { (value: ResultMap?) -> DailyTransactionsFeed? in value.flatMap { (value: ResultMap) -> DailyTransactionsFeed in DailyTransactionsFeed(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [DailyTransactionsFeed?]) -> [ResultMap?] in value.map { (value: DailyTransactionsFeed?) -> ResultMap? in value.flatMap { (value: DailyTransactionsFeed) -> ResultMap in value.resultMap } } }, forKey: "dailyTransactionsFeed")
      }
    }

    public struct DailyTransactionsFeed: GraphQLSelectionSet {
      public static let possibleTypes = ["DaySectionWidget", "TransactionWidget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(DaySection.self),
        GraphQLFragmentSpread(Transaction.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
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

        public var daySection: DaySection? {
          get {
            if !DaySection.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
            return DaySection(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap += newValue.resultMap
          }
        }

        public var transaction: Transaction? {
          get {
            if !Transaction.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
            return Transaction(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
