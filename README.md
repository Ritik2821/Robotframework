# ROBOT FRAMEWORK
## About Robot Framework

[Robot Framework](https://robotframework.org/) is an open-source test automation framework that is widely used for both web and API testing. It utilizes a keyword-driven testing approach, which means tests are created using keywords that represent actions or verifications. Robot Framework supports various libraries for different types of testing, including:

- **Web Testing**: Using **SeleniumLibrary**, you can automate interactions with web applications, such as clicking buttons, filling forms, and verifying page content.
- **API Testing**: With libraries like **RequestsLibrary**, you can automate API calls, check responses, and validate status codes and data.

Robot Framework is simple to use, highly readable, and supports integration with other testing tools and frameworks.

## Web Testing for Sauce Labs Demo Site

This repository contains automated test cases for the Sauce Labs demo site using Robot Framework with SeleniumLibrary.

## Test Cases

### 1. Valid Login Test For All Users
Logs into the Sauce Labs demo site using valid credentials for multiple users and verifies successful login.

### 2. End-to-End Testing
Automates the process of logging in, selecting a product, proceeding to checkout, and verifying the success message.

## Keywords

- **Proceed to Checkout**: Clicks the shopping cart icon and navigates to the checkout page.
- **Enter Checkout Information**: Automates entering shipping details (first name, last name, postal code).
- **Verify the Success Message**: Verifies the success message after completing the checkout.

## Requirements

- Python 3.x
- Robot Framework
- SeleniumLibrary
- WebDriver for Chrome (or your chosen browser)

Install dependencies:

```bash
pip install robotframework selenium

