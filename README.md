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

### Subscribe a client to receive notifications

JS Example:

**Install `phoenix-socket` with npm like so: `npm install phoenix-socket`

```JavaScript
import { Socket } from "phoenix-socket";

const clientFingerprint = 'watagata';
let socket = new Socket("ws://localhost:4000/socket", {
  logger: ((kind, msg, data) => { console.log(`${kind}: ${msg}`, data) })
});

socket.connect({user_id: "123"});
var chan = socket.channel(`notification:${clientFingerprint}`, {})
chan.join();

chan.on(`notification:${clientFingerprint}`, { msg } => {
  // handle message here
  console.log(msg);
})
```

### Send Push Notifications

To send a push notification to a client send
an http post request to `http://localhost/api/notifications`
with a payload with the following structure:

```JavaScript
{
	"fingerprint": "watagata",
	"payload": "Hack The Planet!",
  "signature": "calculated_signature_goes_here"
}
```

A signature property should be appended to the payload calculated
with the generated api key using an hmac sha256 function on the payload.

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