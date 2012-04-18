require File.dirname(__FILE__) + '/../../test_helper'

class DibsModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of Dibs::Notification, Dibs.notification('name=cody')
  end
end 
