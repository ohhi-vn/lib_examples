import Config

config :simple_example, :remote_defrpc,
  nodes: [:"remote@127.0.0.1"],
  #nodes: {ClusterHelper, :get_nodes, [:api]},
  select_mode: :round_robin
