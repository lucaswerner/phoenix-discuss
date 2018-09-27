defmodule Discuss.CommentsChannel do
    use Discuss.Web, :channel

    def join(name, _params, socket) do
        {:ok, %{key: "there"}, socket}
    end

    def handle_in(name, message, socket) do
        IO.puts("+++++++")
        IO.puts(name)
        IO.inspect(message)
        IO.puts("+++++++")

        {:reply, :ok, socket}
    end
end