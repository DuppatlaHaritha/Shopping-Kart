# WhatsApp and Payment Integration Instructions

## WhatsApp (Twilio)
1. Create a Twilio account and enable the WhatsApp sandbox or WhatsApp Business API.
2. Obtain Account SID and Auth Token and set them in `application.properties`:
   ```
   app.twilio.accountSid=YOUR_SID
   app.twilio.authToken=YOUR_TOKEN
   ```
3. Update `WhatsappController` to call Twilio's REST API or use Twilio Java SDK.

## Razorpay (example for India)
1. Create Razorpay account and get Key ID and Key Secret.
2. Set in `application.properties`:
   ```
   app.razorpay.key=YOUR_KEY
   app.razorpay.secret=YOUR_SECRET
   ```
3. Implement server-side order creation by calling Razorpay Orders API and return order id to client.

Security: never commit keys to public repos. Use environment variables or secrets manager for production.

