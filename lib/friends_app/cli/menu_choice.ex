defmodule FriendsApp.CLI.MenuChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info('Choose an option:')

    menu_itens = FriendsApp.CLI.MenuItems.all()

    find_menu_item_by_index = &Enum.at(menu_itens, &1)

    menu_itens
    |> Enum.map(& &1.label)
    |> display_options()
    |> generate_question
    |> Shell.prompt()
    |> parse_answer
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
    {option, _} = Integer.parse(answer)
    option - 1
  end

  defp confirm_menu_item(chosen_menu_item) do
    Shell.cmd("clear")
    Shell.info('You choose... [#{chosen_menu_item.label}]')

    if Shell.yes?("Confirm?") do
      Shell.info('...#{chosen_menu_item.label}')
    else
      start()
    end
  end
end
