defmodule SimpleExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_example,
      version: "0.1.0",
      elixir: "~> 1.15",
      config_path: "config/config.exs",
      lockfile: "mix.lock",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {SimpleExample.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.5"},
      {:cluster_helper, "~> 0.1"},
      {:easy_rpc, "~> 0.5"}
    ]
  end
end
