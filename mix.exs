defmodule Wunder.MixProject do
  use Mix.Project

  def project do
    [
      app: :wunder,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Wunder.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:geo_postgis, "~> 2.0"},
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"},
      {:poison, "~> 3.1"},
      {:csv, "~> 2.0.0"},
      {:ex_machina, "~> 2.2", only: :test}
    ]
  end
end
