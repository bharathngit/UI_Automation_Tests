require 'logger'
require_relative '../../automation_core/properties'
require_relative '../../automation_core/logger'

require_relative '../../automation_core/selenium_actions'
require_relative '../page_locator_modules/zip_check_locators'

include ZipCheckLocators

class ZipCheckHelper < ActionWrapper

  def verify_zip_check_form(zipcode)
    $logger.info(__method__) {"started."}
    flag = false
    #  First Zip check form validation
    wait_for_element( ZIP_CHECK_FORM,"ZIP_CHECK_FORM")
    wait_for_element( ZIP_CODE_INPUT_ONE, "ZIP_CODE_INPUT_ONE")
    is_element_displayed?(ZIP_CODE_INPUT_ONE, "ZIP_CODE_INPUT_ONE")
    type(ZIP_CODE_INPUT_ONE, zipcode, "ZIP_CODE_INPUT_ONE")
    is_element_displayed?(ZIPCHECK_GETSTARTED_BTN_ONE, "ZIPCHECK_GETSTARTED_BTN_ONE")
    click(ZIPCHECK_GETSTARTED_BTN_ONE, "ZIPCHECK_GETSTARTED_BTN_ONE")
    # Verify whether a modal is displayed and then close
    wait_until_displayed(AVAILABLE_STORES_MODAL, "AVAILABLE_STORES_MODAL")
    flag = is_element_displayed? AVAILABLE_STORES_MODAL_TWOWEEKS_MSG, "Two weeks Free Message"
    short_delay
    click AVAILABLE_STORES_MODAL_CLOSE_BTN, "MODAL CLOSE BTN"
    wait_until_disappears(AVAILABLE_STORES_MODAL, "AVAILABLE_STORES_MODAL")
    # Scroll down to the second form
    scroll_to_element ZIP_CODE_INPUT_TWO, 'ZIP_CODE_INPUT_TWO'
    flag = verify_second_zip_form(zipcode)
    $logger.info(__method__) {"ends."}
    flag
  rescue Selenium::WebDriver::Error::MoveTargetOutOfBoundsError => m
    $logger.error(__method__) {"#{ExceptionFormatter.pretty_exception(m)}"}
    js_scroll_into_view ZIP_CODE_INPUT_TWO, 'ZIP_CODE_INPUT_TWO'
    verify_second_zip_form(zipcode)
  rescue StandardError => e
    $logger.error(__method__) {": failed."}
    $logger.error(__method__) {"#{ExceptionFormatter.pretty_exception(e)}"}
    false
  end

  def verify_second_zip_form(zipcode)
    $logger.info(__method__) {"ends."}
    flag = false
    # Second Zip check form validation
    wait_until_displayed(ZIP_CODE_INPUT_TWO, "ZIP_CODE_INPUT_TWO")
    type(ZIP_CODE_INPUT_TWO, zipcode, "ZIP_CODE_INPUT_TWO")
    is_element_displayed?(ZIPCHECK_GETSTARTED_BTN_TWO, "ZIPCHECK_GETSTARTED_BTN_TWO")
    click(ZIPCHECK_GETSTARTED_BTN_TWO, "ZIPCHECK_GETSTARTED_BTN_TWO")
    # Verify whether a modal is displayed and then close
    wait_until_displayed(AVAILABLE_STORES_MODAL, "AVAILABLE_STORES_MODAL")
    flag = is_element_displayed? AVAILABLE_STORES_MODAL_TWOWEEKS_MSG, "Two weeks Free Message"
    short_delay
    click AVAILABLE_STORES_MODAL_CLOSE_BTN, "MODAL CLOSE BTN"
    wait_until_disappears(AVAILABLE_STORES_MODAL, "AVAILABLE_STORES_MODAL")
    $logger.info(__method__) {"ends."}
    flag
  rescue StandardError => e
    $logger.error(__method__) {": failed."}
    $logger.error(__method__) {"#{ExceptionFormatter.pretty_exception(e)}"}
    false
  end
end
