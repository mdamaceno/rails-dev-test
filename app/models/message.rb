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

    after_transition to: :read do |message|
      message.read_at = Time.current
    end
  end
end
