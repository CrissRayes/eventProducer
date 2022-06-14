class Group < ApplicationRecord
  has_many :concerts, dependent: :destroy
  enum :group_type, [:banda, :hombres, :mujeres], default: :banda
  
  def to_s
    name
  end

  def concerts_count
    @group = Group.find(id)
    @group.concerts.count

  end

  def total_audience
    @group = Group.find(id)
    @group.concerts.sum(:audience)
  end

  def max_audience
    @group = Group.find(id)
    @group.concerts.maximum(:audience)
  end

  def this_month_concerts
  end

end
