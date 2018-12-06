# Typex

Data type finder with some useful data like whether data is empty, map with no values, empty list. such hints are returned to get the idea of data. 
## Installation

[available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `typex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:typex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `typex` is started before your application:

    ```elixir
    def application do
      [applications: [:typex]]
    end
    ```

