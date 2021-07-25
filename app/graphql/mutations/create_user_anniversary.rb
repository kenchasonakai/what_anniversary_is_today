module Mutations
  class CreateUserAnniversary < BaseMutation
    field :user_anniversary, Types::UserAnniversaryType, null: false

    argument :name, String, required: true
    argument :date, String, required: true

    def resolve(**args)
      user_anniversary = UserAnniversary.create!(args)
      {
        user_anniversary: user_anniversary
      }
    end
  end
end
