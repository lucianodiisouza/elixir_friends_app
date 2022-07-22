defmodule FriendsApp.CLI.MenuItems do
  alias FriendsApp.CLI.Menu

  def all,
    do: [
      %Menu{label: 'Add a friend', id: :create},
      %Menu{label: 'Show a friend', id: :show},
      %Menu{label: 'Update a friend', id: :update},
      %Menu{label: 'Delete a friend', id: :delete}
    ]
end
