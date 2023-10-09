import unittest

from app import is_prime

class TestIsPrime(unittest.TestCase):

  def test_true_when_x_is_17(self):
    self.assertEqual(is_prime(17), "True")

  def test_false_when_x_is_36(self):
    self.assertEqual(is_prime(36), "False")

  def test_true_when_x_is_13219(self):
    self.assertEqual(is_prime(13219), "True")

if __name__ == '__main__':
  unittest.main()