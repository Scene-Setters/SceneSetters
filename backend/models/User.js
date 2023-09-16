const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  fullname: {
    type: String,
    required: true,
  },
  sex: {
    type: String,
  },
  age: {
    type: Number,
    required: true,
  },
  maretialStatus: {
    type: String,
    required: false,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  proof: {
    type: String,
    required: false,
  },
  image: {
    type: String,
    default: null,
  },
  password: {
    type: String,
    required: true,
    minlength: 8,
  },
  phoneNumber: {
    type: String,
    unique: true,
    sparse: true,
    required: true
  },
  bookmarkedPosts: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Flat",
    },
  ],
});

// set toJSON method to not to return hashed password
userSchema.set("toJSON", {
  transform: (document, returnedDocument) => {
    returnedDocument.id = document._id.toString();
    delete returnedDocument._id;
    // delete returnedDocument.password;
    delete returnedDocument.__v;
  },
});

module.exports = mongoose.model("User", userSchema);
