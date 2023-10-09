from flask import Flask, request

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
    return "False"

  for i in range(2, int(x ** 0.5) + 1):
    if x % i == 0:
      return "False"
  return "True"

if __name__ == '__main__':
  app.run(debug=True)