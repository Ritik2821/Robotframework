# keywords.py
from SeleniumLibrary import SeleniumLibrary
import sys
import os

# Add the automation folder to the Python path so locators can be imported
sys.path.append(os.path.join(os.path.dirname(__file__), 'Automation'))

import locators  # Import the locators.py file

def click_element_and_wait(locator):
    """
    Custom keyword to click an element.
    It waits for the element to be visible before clicking it.
    """
    selenium_lib = SeleniumLibrary()  # Initialize SeleniumLibrary
    selenium_lib.wait_until_element_is_visible(locator)  # Wait for element to be visible
    selenium_lib.click_element(locator)  # Click the element
    print(f"Element clicked with locator: {locator}")

def search_in_google(search_text):
    """
    Custom keyword to perform a search on Google using the provided search text.
    It uses the locators defined in the locators.py file.
    """
    selenium_lib = SeleniumLibrary()
    selenium_lib.input_text(locators.SEARCH_BOX, search_text)  # Use the SEARCH_BOX locator
    selenium_lib.click_element(locators.SEARCH_BUTTON)  # Use the SEARCH_BUTTON locator
    print(f"Search performed with text: {search_text}")
