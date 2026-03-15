extends Node2D

class_name TradingSystem

var markets = {"station_alpha": {"name": "Station Alpha", "location": Vector2(100, 100), "goods": {"water": {"price": 50, "stock": 100}, "minerals": {"price": 75, "stock": 50}, "fuel": {"price": 100, "stock": 200}}}, "asteroid_belt": {"name": "Asteroid Belt", "location": Vector2(400, 200), "goods": {"minerals": {"price": 40, "stock": 500}, "water": {"price": 80, "stock": 30}, "electronics": {"price": 150, "stock": 20}}}, "beta_station": {"name": "Beta Station", "location": Vector2(600, 400), "goods": {"electronics": {"price": 200, "stock": 50}, "fuel": {"price": 110, "stock": 150}, "minerals": {"price": 85, "stock": 75}}}}

var trade_routes = [{"from": "station_alpha", "to": "asteroid_belt", "distance": 350, "reward": 200}, {"from": "asteroid_belt", "to": "beta_station", "distance": 400, "reward": 300}, {"from": "beta_station", "to": "station_alpha", "distance": 450, "reward": 250}]

func get_market(market_name: String) -> Dictionary:
    return markets.get(market_name, {})

func get_all_markets() -> Dictionary:
    return markets

func buy_from_market(market_name: String, item: String, quantity: int, player_money: int) -> Dictionary:
    var market = get_market(market_name)
    if market.is_empty() or not item in market["goods"]:
        return {"success": false, "message": "Item not found"}

    var good = market["goods"][item]
    var total_cost = good["price"] * quantity
    if player_money < total_cost:
        return {"success": false, "message": "Not enough money"}
    if good["stock"] < quantity:
        return {"success": false, "message": "Not enough stock"}

    good["stock"] -= quantity
    return {"success": true, "cost": total_cost, "item": item, "quantity": quantity}

func sell_to_market(market_name: String, item: String, quantity: int) -> Dictionary:
    var market = get_market(market_name)
    if market.is_empty() or not item in market["goods"]:
        return {"success": false, "message": "Item not accepted", "profit": 0}

    var good = market["goods"][item]
    var profit = good["price"] * quantity
    good["stock"] += quantity
    return {"success": true, "profit": profit, "item": item, "quantity": quantity}