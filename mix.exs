defmodule Typex.Mixfile do
  use Mix.Project

  def project do
    [app: :typex,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A module for checking the type and values of an argument",
     package: package,
     deps: deps()]
  end

  def package do
    [
      maintainers: [" Blackode"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/blackode/typex"}

    ]
  end


  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, github: "elixir-lang/ex_doc", override: true,only: :dev},
     {:earmark, "~> 1.0", only: :dev},
     {:dialyxir, "~> 0.3", only: [:dev]},

   ]
  end
end
