class Message < ActiveRecord::Base

  attr_accessor :read_at

  validates :title, :content, presence: true

  state_machine :state, initial: :unread do
    event :read do
      transition unread: :read
    end

    event :archive do
      transition any => :archived
    end

    after_transition on: :read do |message|
      message.read_at = Time.now
    end

    around_transition to: :archive do |message|
      message.archived_at = Time.now
    end
  end
end
