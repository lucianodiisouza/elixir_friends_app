defmodule FriendsApp.CLI.Menu.Itens do
  alias FriendsApp.CLI.Menu

  def all,
    do: [
      %Menu{label: 'Add a friend', id: :create},
      %Menu{label: 'Show a friend', id: :read},
      %Menu{label: 'Update a friend', id: :update},
      %Menu{label: 'Delete a friend', id: :delete}
    ]
end
