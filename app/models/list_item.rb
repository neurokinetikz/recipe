class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :listable, :polymorphic => true
  belongs_to :unit
end
