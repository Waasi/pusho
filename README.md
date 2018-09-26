# Pusho

An Open Source, Language Agnostic and Fault-Tolerant Push Notification Service

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
	"payload": "Hack The Planet!"
}
```

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