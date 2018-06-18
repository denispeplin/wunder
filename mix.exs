defmodule Wunder.MixProject do
  use Mix.Project

  def project do
    [
      app: :wunder,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
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

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:geo_postgis, "~> 2.0"},
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"},
      {:poison, "~> 3.1"},
      {:csv, "~> 2.0.0"}
    ]
  end
end
