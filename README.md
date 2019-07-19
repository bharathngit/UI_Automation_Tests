# UiAutomation

This is a test automation project developed for the QA assignment for 'shipt'. This project consists of automation framework developed in ruby and rspec tests.

## Installation

Download the project from github and then in the project folder execute:

    $ bundle install

Once all the necessary gems are installed you can start running the tests.

## Usage

To Change the browser on which the tests are run, replace the constant 'BROWSER' of Properties module accordingly, in /lib/automation_core/properties.rb file.

To run tests use 'rake spec'.

## Development

The framework is developed on the lines of page object model design pattern. Under which each webpage will have its own helper classes and locators modules. They are placed in '/lib/ui_automation' folder.
