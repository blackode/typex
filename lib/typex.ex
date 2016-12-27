defmodule Typex do
  @moduledoc ~S"""
  #####   #   #  #####   ######  #    #
    #      # #   #    #  #        #  #
    #       #    #    #  #####     ##
    #       #    #####   #         ##
    #       #    #       #        #  #
    #       #    #       ######  #    #
    
    This module helps in finding the type of an argument passed with some basic information.
    It also helps with more info like emptiness

  """

  @doc ~S"""
  Returns  a string representation of the type of a passed argument

  ## Examples
  
      iex> Typex.typeof(:nil)
      'Nil'
      iex> Typex.typeof(nil)
      'Nil'
      iex> Typex.typeof(Nil)
      'Atom'
      iex> Typex.typeof(%{})
      'Map'
      iex> Typex.typeof([])
      'List'

  """
  @spec typeof(any()) :: char_list

  def typeof(arg), do: _typeof(arg)
  defp _typeof(arg) when is_nil(arg), do: 'Nil'
  defp _typeof(arg) when is_boolean(arg), do: 'Boolean'
  defp _typeof(arg) when is_map(arg), do: 'Map'
  defp _typeof(arg) when is_list(arg), do: 'List'
  defp _typeof(arg) when is_binary(arg), do: 'Binary'
  defp _typeof(arg) when is_bitstring(arg), do: 'Bitstring'
  defp _typeof(arg) when is_float(arg), do: 'Float'
  defp _typeof(arg) when is_function(arg), do: 'Function'
  defp _typeof(arg) when is_integer(arg), do: 'Integer'
  defp _typeof(arg) when is_pid(arg), do: 'Pid'
  defp _typeof(arg) when is_port(arg), do: 'Port'
  defp _typeof(arg) when is_reference(arg), do: 'Reference'
  defp _typeof(arg) when is_tuple(arg), do: 'Tuple'
  defp _typeof(arg) when is_atom(arg), do: 'Atom'

  @doc ~S"""
  Returns the map with some basic information of an argument passed for an example empty list or empty map etc..

  ## Examples
                          
      iex> Typex.type_info(:nil)
      %{type: 'Nil',value: :nil}
      iex> Typex.type_info(nil)
      %{type: 'Nil',value: nil}
      
      iex> Typex.type_info(true)
      %{type: 'Boolean',value: true}
      iex> Typex.type_info(false)
      %{type: 'Boolean',value: false}

      iex> Typex.type_info(%{})
      %{type: 'Map',empty: true,value: %{}}
      iex> Typex.type_info(%{name: "Blackode"})
      %{type: 'Boolean',empty: false,value: %{name: "Blackode"}}


  """
  @spec type_info(any()) :: map

  def type_info(arg), do: _type_info(arg)

  defp _type_info(arg) when is_nil(arg) do 
    %{type: 'Nil',value: arg}
  end

  defp _type_info(arg) when is_boolean(arg) do
      %{type: "Boolean",value: arg}
  end

  defp _type_info(arg) when is_map(arg) do 
      case arg do
      %{}-> %{type: "Map",empty: true,value: %{}}
      map-> %{type: "Map",empty: false,value: map}
      end
  end
  defp _type_info(arg) when is_list(arg), do: 'List'
  defp _type_info(arg) when is_binary(arg), do: 'Binary'
  defp _type_info(arg) when is_bitstring(arg), do: 'Bitstring'
  defp _type_info(arg) when is_float(arg), do: 'Float'
  defp _type_info(arg) when is_function(arg), do: 'Function'
  defp _type_info(arg) when is_integer(arg), do: 'Integer'
  defp _type_info(arg) when is_pid(arg), do: 'Pid'
  defp _type_info(arg) when is_port(arg), do: 'Port'
  defp _type_info(arg) when is_reference(arg), do: 'Reference'
  defp _type_info(arg) when is_tuple(arg), do: 'Tuple'
  defp _type_info(arg) when is_atom(arg), do: 'Atom'

end
