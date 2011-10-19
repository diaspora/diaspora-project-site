keys = YAML.load(File.read(File.join(File.dirname(__FILE__), '../stripe.yml')))

STRIPE_PUBLISHABLE_KEY = keys['publishable']
Stripe.api_key = keys['secret']