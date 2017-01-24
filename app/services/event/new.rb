class Event
  class New

    def self.call
      new.call
    end

    def call
      Event.new(
        started_at: date_with_specified_hour(Event::DEFAULT_STARTED_AT_HOURS),
        finished_at: date_with_specified_hour(Event::DEFAULT_FINISHED_AT_HOURS)
      )
    end

    private

    def date_with_specified_hour(hour)
      DateTime.now.change({hour: hour, min: 0, sec: 0})
    end

  end
end
