import redis
r = redis.Redis(host='localhost', port=6379, decode_responses=True)

def add_to_cart(user_id, product_id, qty=1):
    key = f"cart:{user_id}"
    r.hincrby(key, product_id, qty)
    r.expire(key, 60 * 60 * 24)   # 24-hour cart TTL

def get_cart(user_id):
    return r.hgetall(f"cart:{user_id}")