require_relative '../lib/automation_core/logger'
require_relative '../lib/automation_core/properties.rb'
require_relative '../lib/ui_automation/page_helper_components/zip_check_helper'



RSpec.describe UiAutomation do
  # Hooks
  before(:all) do
    # Create the new ZipCheckHelper object.  The initialize method creates
    # the BrowserDriver instance.  Open the browser
    # and navigate to the Pivot login page.
    @zc_ckr = ZipCheckHelper.new
    @zc_ckr.open_browser
    @zc_ckr.get_url(Properties::LOGIN_URL)
  end

  after(:all) do
    # Disconnect from the browser and end session
    @zc_ckr.teardown
  end

  # Tests ######################################################################

  it "verify zip checker form is working as expected", :skip => false do
    expect(@zc_ckr.verify_zip_check_form "95123").not_to be false
  end


end
