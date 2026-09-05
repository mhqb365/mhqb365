export const donationOptions = [
  {
    id: "momo",
    label: "Momo",
    value:
      "00020101021138630010A000000727013300069710250119PSP26140191000001690208QRIBFTTA53037045802VN62450515MOMOW2W818885850622_nNz-GQJAFMT_zAxWNu96w6304258E",
  },
  {
    id: "bank",
    label: "TP Bank",
    value:
      "0002010102111531397007040052044600000000416785938550010A000000727012500069704230111000041678590208QRIBFTTA5204513753037045802VN5918MAI HOANG QUOC BAO6006Ha Noi8707CLASSIC6304EA2F",
  },
  {
    id: "trx",
    label: "TRX or USDT in TRC20",
    value: "TQojJMM7eZZfewkJa6R4NiEMG3m1s2umyP",
  },
  {
    id: "pol",
    label: "POL or USDT in Polygon POS",
    value: "0xdfa5ab6d4f83cbf792ef640dc97df8a32cc93a4e",
  },
];

export const getDonationOption = (id) =>
  donationOptions.find((option) => option.id === id) ?? donationOptions[0];
