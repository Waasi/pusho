defmodule Mix.Tasks.Generate.Key do
  use Mix.Task

  def run([]), do: IO.puts("\nError: missing length argument")
  def run([0]), do: IO.puts("\nError: missing length argument")
  def run([length]) do
    IO.puts("\nGenerateed API Key")
    IO.puts("==================\n")

    length
    |> String.to_integer()
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> IO.puts()
  end
end