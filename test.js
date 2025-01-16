const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

// Middleware for parsing JSON
app.use(bodyParser.json());

// In-memory variable to store chat messages
let chatMessages = "\n";

// Root endpoint with instructions
app.get("/", (req, res) => {
  res.send(
    "Welcome to the Joseph's Chat API!\n" +
      "Use the following endpoints:\n" +
      "1. PUT /submit - Submit a message. Send a JSON object {username: 'string', message: 'string'}.\n" +
      "2. GET /chat - View the chat board.\n\n" +
      "Copy this if you have curl to submit a message!\n\n" +
      "curl -X PUT http://localhost:3000/submit \\\n" +
      "-H \"Content-Type: application/json\" \\\n" +
      "-d \'{\"username\": \"JohnDoe\", \"message\": \"Hello, world!\"}\'\n\n"
  );
});

// PUT endpoint to submit messages
app.put("/submit", (req, res) => {
  const { username, message } = req.body;

  if (!username || !message) {
    return res.status(400).send("Invalid request. Both 'username' and 'message' are required.");
  }

  // Append the message to the in-memory variable
  chatMessages += `${username}: ${message}\n`;

  res.status(200).send("Message submitted successfully!\n");
});

// GET endpoint to view chat messages
app.get("/chat", (req, res) => {
  res.type("text/plain").send(chatMessages || "No messages yet!");
});

// Start the server
app.listen(port, () => {
  console.log(`Chat API server is running at http://localhost:${port}`);
});
