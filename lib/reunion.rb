class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.participants.sum do |participant|
        participant.last
      end
    end
  end

  def breakout
    values = {}
    @activities.each do |activity|
      activity.owed.each do |name, amt|
        values[name].nil? ? values[name] = amt : values[name] += amt
      end
    end

    values
  end
end
