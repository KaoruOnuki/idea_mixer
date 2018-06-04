ActiveRecord::Schema.define(version: 20180604065744) do

  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string "card_one"
    t.string "card_two"
    t.text "idea_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
