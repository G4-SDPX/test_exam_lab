from flask import Flask, request

import math

app = Flask(__name__)

@app.route('/is_prime/<int:x>')
def is_prime(x):
  """
  ตรวจสอบว่า x เป็นจำนวนเฉพาะหรือไม่

  Args:
    x: จำนวนเต็ม

  Returns:
    True ถ้า x เป็นจำนวนเฉพาะ
    False ถ้า x ไม่ไช่จำนวนเฉพาะ
  """
  
  if x < 2:
    return False

  return str(all(x % i for i in range(2, int(math.sqrt(x)) + 1)))

if __name__ == '__main__':
  app.run()
