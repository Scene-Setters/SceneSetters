const mongoose = require("mongoose");

const flatSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: String,
  city: {
    type: String,
    required: true,
  },
  area: {
    type: String,
    required: true,
  },
  exactLocation: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  capacity: Number,
  amenities: [String],
  photos: [String],
  owner: {
    type: mongoose.Schema.Types.Mixed,
    ref: "User",
    required: true,
  },
  type: {
    type: String,
    enum: ["Rent", "Share"],
    required: true,
  },
  preference: {
    type: String,
  },
  viewersCount: {
    type: Number,
    default: 0,
  },
  isPaid: { 
    type: Boolean,
    default: false,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  updatedAt: Date,
});

module.exports = mongoose.model("Flat", flatSchema);
