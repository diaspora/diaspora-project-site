begin
  stripe = YAML.load(File.read(File.join(File.dirname(__FILE__), '../stripe.yml')))
rescue
  stripe = {}
end

STRIPE_PUBLISHABLE_KEY = stripe["publishable"] || ENV['stripe_publishable']
Stripe.api_key = stripe["secret"] || ENV['stripe_secret']
