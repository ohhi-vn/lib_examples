import Config

config :libcluster,
  topologies: [
    local_epmd: [
      # The selected clustering strategy. Required.
      strategy: Cluster.Strategy.Epmd,
      # Configuration for the provided strategy. Optional.
      config: [
        hosts: [
        :"remote@127.0.0.1",
        :"example@127.0.0.1"
        ]
      ]
    ]
  ]

config :simple_example, :remote_wrapper,
  # nodes: [:"remote@127.0.0.1"],
  nodes: {ClusterHelper, :get_nodes, [:api]},
  error_handling: false,
  select_mode: :round_robin,
  module: RemoteNode.Interface,
  functions: [
    # {function_name, arity, opts}
    {:say_hello, 0},
    {:say_hello_to, 1},
    {:say_hello, 0, [new_name: :private_hello, private: true]},
    {:say_hello_to_with_age, 2, [new_name: :hello_with_name_age]},
    {:raise_exception, 0, [new_name: :fail, retry: 1]}
  ]

config :cluster_helper,
  roles: [:client],
  scope: :my_cluster
