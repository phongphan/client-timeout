# Test Client Drops

Testing the client volunteering close the connection mid request.

We could simulate client closes connection by using curl timeout:

        curl -m 1 http://localhost:3000/delay/5


# Result

| Project                           | Handler Exit Immediately |
| --------------------------------- |:------------------------:|
| elixir-phoenix-async-unlink       |            N             |
| elixir-phoenix-dynamic-supervisor |            N             |
| elixir-phoenix                    |            Y             |
| erlang-cowboy                     |            Y             |
| go-gin                            |            N             |
| node-express                      |            N             |
| rust-actix                        |            N             |
| rust-warp                         |            N             |

It needs to be considered when you have long transaction, requires resources cleanup, or needs to call to the 3rd party non-repeatable endpoints.

