defmodule ChatServer.Command do
  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

    iex> ChatServer.Command.parse "CREATE shopping\r\n"
    {:ok, {:create, "shopping"}}
  """
  def parse(line) do
    case String.split(line) do
      ["CREATE", bucket] -> {:ok, {:create, bucket}}
    end
  end
end
