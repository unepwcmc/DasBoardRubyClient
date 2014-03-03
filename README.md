# DasboardClient

Simple adaptor to allow posting stats to DasBoard.

## Installation

    gem 'dasboard_client', require: false

## Config
Create a `config/dasboard.yml` file in your Rails project which looks like:

```YAML
  production:
    instance: http://<your dasboard instance>
    metrics:
      <your_metric_name>: <metric_id>
      <another_metric_name>: <metric_id>
```

For each metric you wish to post to, you must specify both a friendly name
(`your_metric_name`) and the ID of that metric on dasboard (which you can find
from /metrics/:id)

## Posting stats

```ruby
require 'dasboard_client'

DasboardClient.post_stat(:your_metric_name, 50)
```

The above code will post the value '50' to the named metric. You may optionally
specify a time if your metric value does not refer to now.

```ruby
DasboardClient.post_stat(:another_metric_name, 60, 5.days.ago)
```
