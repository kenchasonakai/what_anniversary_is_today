module Types
  class UserAnniversaryType < Types::BaseObject
    field :id, ID, null: false
    field :date, String, null: true
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
