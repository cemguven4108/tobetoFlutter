void main() {
  print(myFactorial(14));
}

int myFactorial(int nbr) {
  if (nbr < 0) return -1;
  if (nbr == 0) return 1;

  int total = 1;
  for (int i = 1; i <= nbr; i++) {
    total = total * i;
  }
  return total;
}
