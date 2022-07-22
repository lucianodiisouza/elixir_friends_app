defmodule FriendsApp.CLI.MenuChoice do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.MenuItems

  def start do
    Shell.cmd("clear")
    Shell.info('Choose an option:')

    menu_itens = MenuItems.all()

    find_menu_item_by_index = &Enum.at(menu_itens, &1, :error)

    menu_itens
    |> Enum.map(& &1.label)
    |> display_options()
    |> generate_question()
    |> Shell.prompt()
    |> parse_answer()
    |> find_menu_item_by_index.()
    |> confirm_menu_item()
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  defp generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Choose one of the options above [#{options}]\n"
  end

  defp parse_answer(answer) do
    case Integer.parse(answer) do
      :error -> invalid_option()
      {option, _} -> option - 1
    end
  end

  defp invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option picked!")
    Shell.prompt("Press ENTER to try again...")
    start()
  end

  defp confirm_menu_item(chosen_menu_item) do
    case chosen_menu_item do
      :error -> invalid_option()
      _ -> confirm_message(chosen_menu_item)
    end
  end

  defp confirm_message(chosen_menu_item) do
    Shell.cmd("clear")
    Shell.info('You choose... [#{chosen_menu_item.label}]')

    if Shell.yes?("Confirm?") do
      Shell.info('...#{chosen_menu_item.label}')
    else
      start()
    end
  end
end
