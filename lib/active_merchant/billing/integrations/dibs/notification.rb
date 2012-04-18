require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Dibs
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          def complete?
            !transaction_id.blank?
          end
          
          def order_id
            params['orderid']
          end 

          def transaction_id
            params['transact']
          end
          
          # the money amount we received in X.2 decimal.
          def gross
            params['amount']
          end
          
          def currency
            params['currency']
          end          

          # Was this a test transaction?
          def test?
            params['test'] == 'test'
          end

          def acknowledge      
            true
          end
 private

          # Take the posted data and move the relevant data into a hash
          def parse(post)
            @raw = post
            for line in post.split('&')
              key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
              params[key] = value
            end
          end
        end
      end
    end
  end
end
