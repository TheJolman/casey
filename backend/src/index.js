import express from "express";

const app = express();
app.use(express.json());

app.get("/ping", (_req, res) => {
  res.json({ pong: "🏓" });
});

app.post("/echo", (req, res) => {
  const { text } = req.body;
  res.json({ text });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`API listening on http://0.0.0.0:${PORT}`);
});
