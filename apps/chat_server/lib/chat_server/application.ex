defmodule ChatSever.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    port = 4040

    children = [
      {Task.Supervisor, name: ChatServer.TaskSupervisor},
      {Task, fn -> ChatServer.accept(port) end}
      # Starts a worker by calling: ChatSever.Worker.start_link(arg)
      # {ChatSever.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatSever.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
