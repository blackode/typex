defmodule Typex do
  @moduledoc ~S"""
                           _____                      
                          |_   _|   _ _ __   _____  __
                            | || | | | '_ \ / _ \ \/ /
                            | || |_| | |_) |  __/>  < 
                            |_| \__, | .__/ \___/_/\_\
                                |___/|_|              

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

      iex> Typex.typeof(%{})
      'Map'
      iex> Typex.typeof(%{name: "Blackode"})
      'Map'

      iex> Typex.typeof([])
      'List'
      iex> Typex.typeof([1,2,3])
      'List'
      iex> Typex.typeof([1,2,3,[4]])
      'List'
      iex> Typex.typeof('hello')
      'List'

      iex> Typex.typeof(fn()-> :hello end)
      'Function'

      iex> Typex.typeof(self())
      'Pid'

      iex> Typex.typeof({1,2,3})
      'Tuple'

      iex> Typex.typeof(:hello)
      'Atom'
      iex> Typex.typeof(Hello)
      'Atom'
      iex> Typex.typeof(Nil)
      'Atom'

      iex> Typex.typeof(1)
      'Integer'
      iex> Typex.typeof(-1)
      'Integer'
      iex> Typex.typeof(0)
      'Integer'

      iex> Typex.typeof(1.0)
      'Float'
      iex> Typex.typeof(-1.0)
      'Float'
      iex> Typex.typeof(-0.0)
      'Float'

      iex> Typex.typeof("hello")
      'Binary'
      iex> Typex.typeof(<<1::8>>)
      'Binary'

      iex> Typex.typeof(<<1::3>>)
      'Bitstring'
      iex> Typex.typeof(<<1::3,2::8>>)
      'Bitstring'

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
      %{type: 'Map',empty: false,value: %{name: "Blackode"}}

      iex> Typex.type_info([])
      %{type: 'List',empty: true,value: []}
      iex> Typex.type_info([1,2,3,4])
      %{type: 'List',empty: false,value: [1,2,3,4]}
      iex> Typex.type_info([1,2,[3,4]])
      %{type: 'List',empty: false,value: [1,2,[3,4]],desc: 'Nested List'}

      iex> Typex.type_info("Blackode")
      %{type: 'Binary',value: "Blackode"}
      iex> Typex.type_info(<<1::8>>)
      %{type: 'Binary',value: <<1::8>>}
      iex> Typex.type_info(<<1::8,2::8>>)
      %{type: 'Binary',value: <<1::8,2::8>>}

      iex> Typex.type_info(<<1::3>>)
      %{type: 'Bitstring',value: <<1::3>>}
      iex> Typex.type_info(<<1::8,2::3>>)
      %{type: 'Bitstring',value: <<1::8,2::3>>}

      iex> Typex.type_info(1.0)
      %{type: 'Float',value: 1.0}
      iex> Typex.type_info(1.5)
      %{type: 'Float',value: 1.5}
      iex> Typex.type_info(-1.5)
      %{type: 'Float',value: -1.5}
      iex> Typex.type_info(0.0)
      %{type: 'Float',value: 0.0}
      iex> Typex.type_info(-0.0)
      %{type: 'Float',value: -0.0}

      iex> Typex.type_info(-1)
      %{type: 'Integer',value: -1}
      iex> Typex.type_info(0)
      %{type: 'Integer',value: 0}
      iex> Typex.type_info(1)
      %{type: 'Integer',value: 1}

      iex> Typex.type_info({:name,"Blackode"})
      %{type: 'Tuple',value: {:name,"Blackode"}}

      iex> Typex.type_info(:blackode)
      %{type: 'Atom',value: :blackode}
      iex> Typex.type_info(Blackode)
      %{type: 'Atom',value: Blackode}

  """
  @spec type_info(any()) :: map

  def type_info(arg), do: _type_info(arg)

  defp _type_info(arg) when is_nil(arg) do 
    %{type: 'Nil',value: arg}
  end

  defp _type_info(arg) when is_boolean(arg) do
      %{type: 'Boolean',value: arg}
  end

  defp _type_info(arg) when is_map(arg) do 
      cond do
      arg==%{}->
          %{type: 'Map',empty: true,value: %{}}
      true-> %{type: 'Map',empty: false,value: arg}
      end
  end

  defp _type_info(arg) when is_list(arg) do 
    case arg do
        []-> %{type: 'List',empty: true,value: []}
        list-> 
            flag =Enum.any?(list,fn(x)-> is_list(x) end)
            if(flag) do
                %{type: 'List',empty: false,value: arg, desc: 'Nested List'}
            else 
                %{type: 'List',empty: false,value: arg}
            end
    end
  end

  defp _type_info(arg) when is_binary(arg), do: %{type: 'Binary', value: arg}
  defp _type_info(arg) when is_bitstring(arg), do: %{type: 'Bitstring',value: arg} 
  defp _type_info(arg) when is_float(arg), do: %{type: 'Float',value: arg}
  defp _type_info(arg) when is_function(arg), do: %{type: 'Function',value: arg}
  defp _type_info(arg) when is_integer(arg), do: %{type: 'Integer',value: arg}
  defp _type_info(arg) when is_pid(arg), do: %{type: 'Pid',value: arg}
  defp _type_info(arg) when is_port(arg), do: %{type: 'Port',value: arg}
  defp _type_info(arg) when is_reference(arg), do: %{type: 'Reference',value: arg}
  defp _type_info(arg) when is_tuple(arg), do: %{type: 'Tuple',value: arg}
  defp _type_info(arg) when is_atom(arg), do: %{type: 'Atom',value: arg}

end
