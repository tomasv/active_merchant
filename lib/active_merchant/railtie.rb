module ActiveMerchant
  class Railtie < Rails::Railtie
    initializer "action view helper" do
      ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)
    end
  end
end
