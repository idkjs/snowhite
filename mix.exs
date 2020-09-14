defmodule Snowhite.MixProject do
  use Mix.Project

  @github "https://github.com/nicklayb/snowhite"
  @description "Smart mirror framework"
  @version "0.1.1"
  def project do
    [
      app: :snowhite,
      version: @version,
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      source_url: @github,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs(),
      description: @description,
      package: package()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => @github
      },
      files: ["assets/css", "lib", "config", "priv", "mix.exs", "mix.lock"],
      maintainers: ["Nicolas Boisvert"]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.5.4"},
      {:phoenix_live_view, "~> 0.13.0"},
      {:floki, ">= 0.0.0", only: :test},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0", only: :dev},
      {:timex, "~> 3.6.2"},
      {:httpoison, "~> 1.7"},
      {:elixir_feed_parser, "~> 2.1.0"},
      {:sweet_xml, "~> 0.6.6"},
      {:eqrcode, "~> 0.1.7"},
      {:bitly, "~> 0.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "overview",
      extra_section: "GUIDES",
      groups_for_modules: groups_for_modules(),
      extras: extras(),
      groups_for_extras: groups_for_extras()
    ]
  end

  defp extras do
    [
      "guides/getting_started",
      "guides/modules"
    ]
  end

  defp groups_for_extras do
    [
      "Getting started": ~r/guides\/getting_started\/.?/,
      Modules: ~r/guides\/modules\/.?/
    ]
  end

  defp groups_for_modules do
    [
      Modules: [
        Snowhite.Modules.Clock,
        Snowhite.Modules.Weather.Current,
        Snowhite.Modules.Weather.Forecast,
        Snowhite.Modules.Rss
      ],
      Servers: [
        Snowhite.Modules.Clock.Server,
        Snowhite.Modules.Rss.Server,
        Snowhite.Modules.Weather.Server
      ],
      Helpers: [
        Snowhite.Helpers.Casing,
        Snowhite.Helpers.Decoder,
        Snowhite.Helpers.Html,
        Snowhite.Helpers.List,
        Snowhite.Helpers.Map,
        Snowhite.Helpers.Module,
        Snowhite.Helpers.Path,
        Snowhite.Helpers.TaskRunner,
        Snowhite.Helpers.Timing
      ],
      Clients: [
        OpenWeather
      ]
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
