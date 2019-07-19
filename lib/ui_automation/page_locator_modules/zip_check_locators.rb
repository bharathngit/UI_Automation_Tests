
module ZipCheckLocators

  ZIP_CHECK_FORM		      = { id: 'zip-check-form' }
  ZIP_CODE_INPUT_ONE			  	= { xpath: '(//form[@id="zip-check-form"]/input)[1]' }
	ZIPCHECK_GETSTARTED_BTN_ONE	= { xpath: '(//form[@id="zip-check-form"]/button)[1]' }
  ZIP_CODE_INPUT_TWO			  	= { xpath: '(//form[@id="zip-check-form"]/input)[3]' }
  ZIPCHECK_GETSTARTED_BTN_TWO	= { xpath: '(//form[@id="zip-check-form"]/button)[3]' }

  AVAILABLE_STORES_MODAL  = { css: 'article[id = "available-stores-modal"]'}
  AVAILABLE_STORES_MODAL_CLOSE_BTN  = { css: 'article>button[title="Close"]'}
  AVAILABLE_STORES_MODAL_TWOWEEKS_MSG  = { xpath: '//h2[text()="Try 2 weeks free."]'}


end
