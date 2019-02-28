class Action < ApplicationRecord
    has_many :ships
    has_many :captains, through: :ships

    scope :battles, -> { where(action_type: "Combat")}
    scope :captures, -> { where(action_type: "Capture")}
    scope :newly_commed, -> { where(action_type: "Newly Commissioned")}
end
