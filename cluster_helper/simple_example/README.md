# SimpleExample

This will use `easy_rpc` to call to `RemoteNode.Interface`.

## Guide

Need to run with `remote_node` to test.
Follow README.md in `remote_node` to start remote node.

config for wrapper in config.exs file. Check config path `config :simple_example, :remote_wrapper`.

Wrapper module is used in `remote_wrapper.ex` file.

```Elixir
mix deps.get


iex --name example@127.0.0.1 --cookie need_to_change_this -S mix

# make sure connected to remote node by cmd:
Node.list()
# return [:"remote@127.0.0.1"]

ClusterHelper.get_nodes(:api)
# return [:"remote@127.0.0.1"]

ClusterHelper.all_nodes()
# return [:"example@127.0.0.1", :"remote@127.0.0.1"]
```
