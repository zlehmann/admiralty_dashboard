module ActionsHelper
    def action_ship(action)
        ship = Ship.find(action.ship_id)
    end
end
