module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :wiki_anniversaries, [Types::WikiAnniversaryType], null: false
    def wiki_anniversaries
      WikiAnniversary.all
    end
  end
end
