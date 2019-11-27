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
        ...DaySectionWidgetFragment
        ...TransactionFragment
      }
    }
    """

  public let operationName = "TransactionList"

  public var queryDocument: String { return operationDefinition.appending(DaySectionWidgetFragment.fragmentDefinition).appending(TransactionFragment.fragmentDefinition) }

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
        GraphQLFragmentSpread(DaySectionWidgetFragment.self),
        GraphQLFragmentSpread(TransactionFragment.self),
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

        public var daySectionWidgetFragment: DaySectionWidgetFragment? {
          get {
            if !DaySectionWidgetFragment.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
            return DaySectionWidgetFragment(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap += newValue.resultMap
          }
        }

        public var transactionFragment: TransactionFragment? {
          get {
            if !TransactionFragment.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
            return TransactionFragment(unsafeResultMap: resultMap)
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
