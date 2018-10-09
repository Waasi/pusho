# Pusho

An Open Source, Language Agnostic and Fault-Tolerant Push Notification Service

# Configuration

For security reasons Pusho requires the definition of an API Key
as an environment variable for the key: `PUSHO_API_KEY`

Pusho ships with an API Key Generator task that can be invoked as:

```shell
> mix generate.key 64

Generateed API Key
==================

<api_key_will_be_around_here>

> export PUSHO_API_KEY=<generated_api_key>
```

The suggested length is 64 but any other integer value can be used.

# Usage

To Consume the Service you can use the following client libraries:

- JavaScript => [Pusho JS](https://github.com/Waasi/pusho-js)
- Ruby => Comming Soon
- Python => Comming Soon

# Development Setup

1. `git clone https://github.com/Waasi/pusho.git`
2. `mix deps.get`
3. `mix phx.server`

# Tests

1. `mix deps.get`
2. `mix test`

# Contributing

1. Fork it ( https://github.com/[my-github-username]/pusho/fork )
2. Create your feature branch (git checkout -b feature/my_new_feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request