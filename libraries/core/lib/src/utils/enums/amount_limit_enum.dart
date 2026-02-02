/// Sample Enum Implementation
enum SomeEnums {
  sample1(50000),
  sample2(400000),
  walletToWallet(1000000),
  scanToSend(50000);

  const SomeEnums(this.value);
  final double value;
}
