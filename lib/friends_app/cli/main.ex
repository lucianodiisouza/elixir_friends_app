defmodule FriendsApp.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_app do
    Shell.cmd("clear")
    welcome_message()
    Shell.prompt("Press enter to continue...")
    starts_menu_choice()
  end

  defp welcome_message do
    Shell.info("============= Friends App =============")
    Shell.info("Welcome to your personal contacts book!")
    Shell.info("=======================================")
  end

  defp starts_menu_choice do
    FriendsApp.CLI.Menu.Choice.start()
  end
end
