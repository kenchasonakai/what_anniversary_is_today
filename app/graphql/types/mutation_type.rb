module Types
  class MutationType < Types::BaseObject
    field :create_user_anniversary, mutation: Mutations::CreateUserAnniversary
  end
end
