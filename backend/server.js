const express = require('express');
const axios = require('axios');
const cheerio = require('cheerio');
const OpenAI = require('openai');

const app = express();
app.use(express.json());

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
});

// Scrape reviews endpoint
app.get('/api/scrape-reviews/:businessId', async (req, res) => {
  try {
    const { businessId } = req.params;
    
    // TODO: Implement actual scraping logic
    // This would scrape Google, Yelp, etc.
    const reviews = await scrapeReviewsFromSources(businessId);
    
    res.json(reviews);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Generate tagline endpoint
app.post('/api/generate-tagline', async (req, res) => {
  try {
    const { reviews, reviewCount, averageRating } = req.body;
    
    const reviewText = reviews.join('\n\n');
    
    const completion = await openai.chat.completions.create({
      model: "gpt-4",
      messages: [
        {
          role: "system",
          content: "You are a creative marketing expert who creates bold, memorable taglines based on customer reviews. Create a single short tagline (under 10 words) that captures the essence of what customers love."
        },
        {
          role: "user",
          content: `Based on these ${reviewCount} reviews (average rating: ${averageRating}/5), create a bold tagline:\n\n${reviewText}`
        }
      ],
      max_tokens: 50,
      temperature: 0.8
    });
    
    const tagline = completion.choices[0].message.content.trim();
    
    res.json({ tagline });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Trigger scraping endpoint
app.post('/api/trigger-scraping', async (req, res) => {
  try {
    const { businessId, sources } = req.body;
    
    // Queue scraping job (use Bull, RabbitMQ, etc.)
    // This should run asynchronously
    
    res.json({ message: 'Scraping initiated', businessId, sources });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Sentiment analysis endpoint
app.post('/api/analyze-sentiment', async (req, res) => {
  try {
    const { reviews } = req.body;
    
    const completion = await openai.chat.completions.create({
      model: "gpt-4",
      messages: [
        {
          role: "system",
          content: "Analyze the sentiment of these reviews and provide a JSON response with positive, negative, and neutral percentages, plus key themes."
        },
        {
          role: "user",
          content: reviews.join('\n\n')
        }
      ],
      response_format: { type: "json_object" }
    });
    
    const sentiment = JSON.parse(completion.choices[0].message.content);
    
    res.json(sentiment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

// Helper function for scraping (implement based on your needs)
async function scrapeReviewsFromSources(businessId) {
  // Implement scraping logic here
  // Use puppeteer, playwright, or API integrations
  return [];
}
