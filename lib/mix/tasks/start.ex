defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Start [Friends APP]"

  @spec run(any) :: :eof | binary | charlist | {:error, any}
  def run(_), do: FriendsApp.CLI.Main.start_app()
end
