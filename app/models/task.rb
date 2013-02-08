class Task  < ActiveRecord::Base
  attr_accessible :title, :iscompleted, :priority
end
