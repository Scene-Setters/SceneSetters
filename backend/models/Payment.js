const mongoose = require('mongoose');

const paymentSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User', // Reference to the User model
    required: true,
  },
  flat: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Flat', // Reference to the Flat model
    required: true,
  },
  isPaid: {
    type: Boolean,
    default: false, // Initialize to false, indicating not paid initially
  },
});

const Payment = mongoose.model('Payment', paymentSchema);

module.exports = Payment;
