import { describe, expect, it } from "vitest";
import { donationOptions, getDonationOption } from "./donationOptions";

describe("donationOptions", () => {
  it("contains mock donation QR options with labels and values", () => {
    expect(donationOptions.length).toBeGreaterThanOrEqual(3);

    const labels = new Set(donationOptions.map((option) => option.label));

    expect(labels.size).toBe(donationOptions.length);
    donationOptions.forEach((option) => {
      expect(option.id).toMatch(/^[a-z0-9-]+$/);
      expect(option.label.length).toBeGreaterThan(0);
      expect(option.value.length).toBeGreaterThan(0);
    });
  });

  it("returns the first donation option for an unknown id", () => {
    expect(getDonationOption("unknown")).toBe(donationOptions[0]);
  });
});
