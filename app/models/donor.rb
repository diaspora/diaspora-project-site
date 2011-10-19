class Donor < ActiveRecord::Base
  validate :presence => :stripe_token

  def self.create_with_payment(opts)
    if has_valid_payment?(opts)
      self.create(:stripe_token => opts[:stripeToken], :name => opts[:name], :email => opts[:email])
    end
  end

  def self.has_valid_payment?(opts)
    amount = (opts[:amount].to_s.gsub(/[^0-9\.]/, '').to_f*100).to_i

    Stripe::Charge.create(
        :amount => amount,
        :card => opts[:stripeToken],
        :currency => 'usd',
        :description => nil
    )
  end

end
