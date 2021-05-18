defmodule Get do
  def run(url) do
    :ok = :inets.start()

    :httpc.request(url)
    |> parse()
  end

  defp parse({:ok, {{_, 200, _}, _headers, body}}) do
    IO.puts(body)
  end

  defp parse({:ok, {{_, status, msg}, _headers, _body}}) do
    IO.puts("Error! Status: #{status}")
    IO.puts("Message: #{msg}")
  end

  defp parse({:error, err}),
    do: IO.puts("Request error: #{err}")
end

Get.run("your_endpoint")
