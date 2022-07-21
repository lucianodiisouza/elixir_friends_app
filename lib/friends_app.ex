defmodule FriendsApp do
  @moduledoc """
  Documentation for `FriendsApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FriendsApp.hello()
      :world

  """
  def hello do
    :world
  end

  def meu_ambiente do
    case Mix.env() do
      :prod -> "Ambiente de Produção"
      :dev -> "Ambiente de Desenvolvimento"
      :test -> "Ambiente de Teste"
    end
  end
end
