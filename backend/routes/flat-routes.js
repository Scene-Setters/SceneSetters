const express = require("express");
const router = express.Router();
const flatController = require("../controllers/flat-controller");
const { verifyUser } = require("../middlewares/auth");
const upload = require("../middlewares/uploads");

router
  .route("/")
  .get(flatController.getAllPosts)
  .put((req, res) => res.status(405).json({ error: "Method not allowed" }))
  .delete((req, res) => res.status(405).json({ error: "Method not allowed" }));

router.route("/rent").post(verifyUser, flatController.createPostForRent);

router.route("/share").post(verifyUser, flatController.createPostForShare);

router.route("/rent").get(verifyUser, flatController.getPostsForRent);

router.route("/share").get(verifyUser, flatController.getPostsForShare);

router.post(
  "/uploadPostCover",
  verifyUser,
  upload,
  flatController.uploadFlatPhoto
);

// Get posts uploaded by current user
router.get(
  "/my-posts",
  verifyUser,
  flatController.getPostsUploadedByCurrentUser
);

// Get all bookmarked posts
router.get("/bookmarked-posts", flatController.getAllBookmarkedPosts);

// Search posts
router.get("/search", flatController.searchPosts);

router
  .route("/:post_id")
  .get(flatController.getPostById)
  .post(flatController.createPayment)
  .delete(flatController.deletePostById);

// Bookmark a post
router.post("/bookmark/:post_id", verifyUser, flatController.bookmarkPost);

// Remove bookmark from a post
router.delete("/bookmark/:post_id", verifyUser, flatController.removeBookmark);

module.exports = router;
