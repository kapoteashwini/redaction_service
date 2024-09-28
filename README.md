# Redaction Service

## Application API's Details

- **POST /redact**: Accepts arbitrary text in the request body and returns the received text with any word that is in a defined, configurable list, changed to 'REDACTED' in the response body.
- **GET /redact**: Identifies itself as 'Redaction Service' by returning a single String 'Redaction Service' in the response body
- **Logging**: To a log *redaction.log* file, with a timestamp, and the text from the request prior to redaction

## Requirements

- ruby 3.2.0
- rails 7.1.4
- SQLite3


## Follow the below steps to stat the application.

```bash
git clone https://github.com/kapoteashwini/redaction_service.git
cd redaction_service
bundle install
rails db:migrate
rails db:seed
rails s
