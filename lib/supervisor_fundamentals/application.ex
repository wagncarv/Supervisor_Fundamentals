defmodule SupervisorFundamentals.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.inspect "Iniciando a evolução !!"
    children = [
      %{id: :foo, start: {SupervisorFundamentals, :start_link, [{:foo, 0, 0}]}},
      %{id: :bar, start: {SupervisorFundamentals, :start_link, [{:bar, 0, 0}]}},
      %{id: :wagner, start: {SupervisorFundamentals, :start_link, [{:wagner, 0, 0}]}}
      # Starts a worker by calling: SupervisorFundamentals.Worker.start_link(arg)
      # {SupervisorFundamentals.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SupervisorFundamentals.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
