class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, cost)
    @participants[person] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost/(@participants.count)
  end

  def owed
    monies_owed = {}
    @participants.each do |participant|
      monies_owed[participant.first] = split - participant.last
    end

    monies_owed
  end
end
