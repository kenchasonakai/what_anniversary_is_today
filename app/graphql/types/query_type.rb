module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :wiki_anniversaries, [WikiAnniversaryType], null: false
    def wiki_anniversaries
      WikiAnniversary.all
    end

    field :find_all_wiki_anniversaries, [WikiAnniversaryType], null: false, description: "日付指定でwikiから取得した記念日を返す" do
      argument :date, String, "日付", required: true
    end
    def find_all_wiki_anniversaries(date:)
      WikiAnniversary.where(date: date)
    end


    field :user_anniversaries, [WikiAnniversaryType], null: false
    def user_anniversaries
      UserAnniversary.all
    end

    field :find_all_user_anniversaries, [WikiAnniversaryType], null: false, description: "日付指定でuserが作成した記念日を返す" do
      argument :date, String, "日付", required: true
    end
    def find_all_user_anniversaries(date:)
      UserAnniversary.where(date: date)
    end
  end
end
