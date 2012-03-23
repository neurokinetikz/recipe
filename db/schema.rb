# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110421213655) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "course_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["source_type", "source_id"], :name => "index_images_on_source_type_and_source_id"
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "recipe_order"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructions", ["recipe_id"], :name => "index_instructions_on_recipe_id"

  create_table "item_ingredients", :force => true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.integer  "item_order"
    t.integer  "ingredient_id"
    t.string   "quantity"
    t.string   "unit"
    t.string   "preparation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_ingredients", ["ingredient_id"], :name => "index_item_ingredients_on_ingredient_id"
  add_index "item_ingredients", ["item_type", "item_id"], :name => "index_item_ingredients_on_item_type_and_item_id"
  add_index "item_ingredients", ["preparation"], :name => "index_item_ingredients_on_preparation_id"
  add_index "item_ingredients", ["unit"], :name => "index_item_ingredients_on_unit_id"

  create_table "kitchens", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", :force => true do |t|
    t.integer  "list_id"
    t.string   "listable_type"
    t.integer  "listable_id"
    t.integer  "list_order"
    t.string   "quantity"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_items", ["list_id"], :name => "index_list_items_on_list_id"
  add_index "list_items", ["listable_type", "listable_id"], :name => "index_list_items_on_listable_type_and_listable_id"
  add_index "list_items", ["unit_id"], :name => "index_list_items_on_unit_id"

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meal_recipes", :force => true do |t|
    t.integer  "meal_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meal_recipes", ["meal_id"], :name => "index_meal_recipes_on_meal_id"
  add_index "meal_recipes", ["recipe_id"], :name => "index_meal_recipes_on_recipe_id"

  create_table "meals", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meals", ["user_id"], :name => "index_meals_on_user_id"

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.string   "noteable_type"
    t.integer  "noteable_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["noteable_type", "noteable_id"], :name => "index_notes_on_noteable_type_and_noteable_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "recipes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cuisine_id"
    t.integer  "course_id"
    t.string   "name",               :null => false
    t.text     "description"
    t.integer  "preparation_time"
    t.integer  "cooking_time"
    t.integer  "serves"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "recipes", ["course_id"], :name => "index_recipes_on_course_id"
  add_index "recipes", ["cuisine_id"], :name => "index_recipes_on_cuisine_id"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
