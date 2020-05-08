ActiveRecord::Schema.define(version: 2020_05_06_001629) do

  create_table "rides", force: :cascade do |t|
    t.integer "shredder_id"
    t.integer "trail_id"
    t.integer "time"
  end

  create_table "shredders", force: :cascade do |t|
    t.string "name"
    t.integer "skill"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.integer "difficulty"
  end

end
