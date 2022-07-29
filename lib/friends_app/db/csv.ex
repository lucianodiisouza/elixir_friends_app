defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSVParser

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _} -> Shell.info(">>> READ <<<<")
      %Menu{id: :delete, label: _} -> Shell.info(">>> DELETE <<<<")
      %Menu{id: :update, label: _} -> Shell.info(">>> UPDATE <<<<")
    end

    FriendsApp.CLI.Menu.Choice.start()
  end

  defp create do
    collect_data()
    |> Map.values()
    |> wrap_in_list()
    |> CSVParser.dump_to_iodata
    |> save_csv_file()
  end

  defp collect_data do
    Shell.cmd("clear")

    %{
      name: prompt_message("Type contact name:"),
      email: prompt_message("Type contact email:"),
      phone: prompt_message("Type contact phone:")
    }
  end

  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim
  end

  defp wrap_in_list(list) do
    [list]
  end

  defp save_csv_file(data) do
    File.write!("#{File.cwd!}/friends.csv", data, [:append])
  end
end
