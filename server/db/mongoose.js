const mongoose = require('mongoose');

mongoose.Promise = global.Promise
let connectAndRetry = () => {
  return mongoose.connect(process.env.MONGODB_URI, (err) => {
    if (err) {
      console.error("Failed to connect, trying again in 5 secs", err)
      setTimeout(connectAndRetry, 5000);
    }
  })
} 
connectAndRetry();
module.exports = { mongoose };
