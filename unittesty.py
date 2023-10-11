import unittest

from app.app import is_prime

class TestIsPrime(unittest.TestCase):

  def test_is_prime_17(self):
    self.assertEqual(is_prime(17), 'True')

  def test_is_prime_36(self):
    self.assertEqual(is_prime(36), 'False')

  def test_is_prime_13219(self):
    self.assertEqual(is_prime(13219), 'True')

if __name__ == "__main__":
    unittest.main()