defmodule Get do
  def run(url) do
    :ok = :inets.start()

    :httpc.request(url)
    |> parse()
  end

  defp parse({:ok, {{_, 200, _}, _headers, body}}) do
    IO.puts(body)
  end

  defp parse({:ok, {_, status, _}, _headers, body}) do
    IO.puts("Error! Status: #{status}")
    IO.puts("Body: #{body}")
  end

  defp parse({:error, err}),
    do: IO.puts("Request error: #{err}")
end

Get.run("http://httpbin.org")
