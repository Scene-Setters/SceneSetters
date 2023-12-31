const upload = require("../middlewares/uploads");
const Flat = require("../models/Flat");
const User = require("../models/User");
const Payment = require("../models/Payment");

const getAllPosts = async (req, res, next) => {
  try {
    const posts = await Flat.find().sort({ createdAt: -1 });
    res.json({
      data: posts,
    });
  } catch (error) {
    next(error);
  }
};

const getAllBookmarkedPosts = async (req, res) => {
  try {
    const userId = req.user.id;

    // Find the user by userId and populate the bookmarkedPosts field
    const user = await User.findById(userId).populate("bookmarkedPosts");

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    const bookmarkedPosts = user.bookmarkedPosts.map((post) => {
      const createdAt = new Date(post.createdAt);
      const currentTime = new Date();
      const timeDifference = Math.abs(currentTime - createdAt);

      let formattedTime;
      if (timeDifference < 60000) {
        formattedTime = Math.floor(timeDifference / 1000) + " seconds ago";
      } else if (timeDifference < 3600000) {
        formattedTime = Math.floor(timeDifference / 60000) + " minutes ago";
      } else if (timeDifference < 86400000) {
        formattedTime = Math.floor(timeDifference / 3600000) + " hours ago";
      } else {
        formattedTime = Math.floor(timeDifference / 86400000) + " days ago";
      }

      return {
        ...post.toObject(),
        formattedCreatedAt: formattedTime,
        isBookmarked: true, // Since it's a bookmarked post, set isBookmarked to true
      };
    });

    res.status(200).json({ data: bookmarkedPosts });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

// Get posts uploaded by current user
const getPostsUploadedByCurrentUser = async (req, res, next) => {
  try {
    const userId = req.user.id;

    const posts = await Flat.find({ "owner.id": userId }).sort({
      createdAt: -1,
    });

    res.json({
      data: posts,
    });
  } catch (error) {
    next(error);
  }
};

let uploadedFilename; // Shared variable to store the uploaded filename

const uploadFlatPhoto = async (req, res, next) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: "Please upload a file" });
    }

    // Save the post cover image and get the filename
    const filename = req.file.filename;

    uploadedFilename = filename; // Store the filename in the shared variable

    res.status(200).json({ success: true, data: filename });
  } catch (error) {
    next(error);
  }
};

const createPostForRent = async (req, res, next) => {
  const {
    title,
    description,
    city,
    area,
    exactLocation,
    price,
    capacity,
    amenities,
    photos,
    type,
    preference,
  } = req.body;
  const owner = req.user;

  try {
    if (!title || !description || !city || !area || !exactLocation || !price) {
      return res
        .status(400)
        .json({ error: "Please fill in all required fields" });
    }

    const flatData = {
      title,
      description,
      city,
      area,
      exactLocation,
      price,
      capacity,
      amenities,
      photos,
      owner: owner,
      type: "Rent",
      preference,
    };

    // Create the flat document in the database
    const flat = await Flat.create(flatData);
    res.status(201).json(flat);
  } catch (error) {
    next(error);
  }
};

const createPostForShare = async (req, res, next) => {
  const {
    title,
    description,
    city,
    area,
    exactLocation,
    price,
    capacity,
    amenities,
    photos,
    type,
    preference,
  } = req.body;
  const owner = req.user;

  try {
    if (!title || !description || !city || !area || !exactLocation || !price) {
      return res
        .status(400)
        .json({ error: "Please fill in all required fields" });
    }

    const flatData = {
      title,
      description,
      city,
      area,
      exactLocation,
      price,
      capacity,
      amenities,
      photos,
      owner: owner,
      type: "Share",
      preference,
    };

    // Create the flat document in the database
    const flat = await Flat.create(flatData);
    res.status(201).json(flat);
  } catch (error) {
    next(error);
  }
};

const getPostsForShare = async (req, res) => {
  try {
    const sharePosts = await Flat.find({ type: "Share" }).sort({
      createdAt: -1,
    });

    res.status(200).json({ data: sharePosts });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

const getPostsForRent = async (req, res) => {
  try {
    const rentPosts = await Flat.find({ type: "Rent" }).sort({
      createdAt: -1,
    });

    res.status(200).json({ data: rentPosts });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

const increaseViewsCount = async (req, res, next) => {
  try {
    const postId = req.params.post_id;

    const userId = req.user.id;

    // Find the flat by ID
    const flat = await Flat.findById(postId);

    const payment = await Payment.findOne({ user: userId, flat: postId });

    if (!flat) {
      return res.status(404).json({ error: "Flat not found" });
    }

    // Increment the viewsCount
    flat.viewersCount = (flat.viewersCount || 0) + 1;

    // Save the updated flat document
    await flat.save();

    // Determine the isPaid status based on the payment record
    const isPaid = payment ? payment.isPaid : false;

    // Add the 'isPaid' field to the post data
    const postData = {
      ...flat.toObject(),
      isPaid,
    };

    // Return the post data
    res.json({ data: postData });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

const getPostById = async (req, res, next) => {
  try {
    const postId = req.params.post_id;

    const userId = req.user.id;

    // Check if there is a payment record matching the user and post
    const payment = await Payment.findOne({ user: userId, flat: postId });

    // Retrieve the post
    const post = await Flat.findById(postId);

    if (!post) {
      return res.status(404).json({ error: "Post not found" });
    }

    // Determine the isPaid status based on the payment record
    const isPaid = payment ? payment.isPaid : false;

    // Add the 'isPaid' field to the post data
    const postData = {
      ...post.toObject(),
      isPaid,
    };

    // Return the post data
    res.json({ data: postData });
  } catch (error) {
    next(error);
  }
};

const deletePostById = (req, res, next) => {
  Flat.findByIdAndDelete(req.params.post_id)
    .then((reply) => res.status(204).end())
    .catch(next);
};

const searchPosts = (req, res, next) => {
  const { query } = req.query;

  Flat.find({
    $or: [
      { city: { $regex: query, $options: "i" } },
      { area: { $regex: query, $options: "i" } },
    ],
  })
    .then((posts) => {
      if (posts.length === 0) {
        // No posts found
        res.json({ message: "No posts found" });
      } else {
        // Matching posts found
        res.json({
          data: posts,
        });
      }
    })
    .catch((error) => {
      next(error);
    });
};

const bookmarkPost = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const postId = req.params.post_id;

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (user.bookmarkedPosts.includes(postId)) {
      return res.status(400).json({ error: "Post is already bookmarked" });
    }

    user.bookmarkedPosts.push(postId);
    await user.save();

    res.status(201).json({ message: "Post bookmarked successfully" });
  } catch (error) {
    next(error);
  }
};

const removeBookmark = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const postId = req.params.post_id;

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (!user.bookmarkedPosts.includes(postId)) {
      return res.status(400).json({ error: "Post is not bookmarked" });
    }

    user.bookmarkedPosts = user.bookmarkedPosts.filter(
      (bookmark) => bookmark.toString() !== postId
    );
    await user.save();

    res.json({ message: "Bookmark removed successfully" });
  } catch (error) {
    next(error);
  }
};

const createPayment = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const postId = req.params.post_id;

    // Create a new payment document
    const payment = new Payment({
      user: userId, // Reference to the User model
      flat: postId, // Reference to the Flat model
      isPaid: true, // You can set this to true if the payment is successful
    });

    // Save the payment document to the database
    await payment.save();
    res.json(payment);
  } catch (error) {
    next(error);
  }
};

module.exports = {
  getAllPosts,
  getAllBookmarkedPosts,
  getPostsUploadedByCurrentUser,
  uploadFlatPhoto,
  createPostForRent,
  createPostForShare,
  getPostsForShare,
  getPostsForRent,
  getPostById,
  deletePostById,
  searchPosts,
  bookmarkPost,
  removeBookmark,
  createPayment,
  increaseViewsCount,
};
