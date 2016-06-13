defmodule BracketPush do
  @left_brackets  ~r/[\[\{\(]/
  @right_brackets ~r/[\]\}\)]/
  @pairs          ["(": ")", "[": "]", "{": "}"]
  @doc """
 Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    do_check_brackets(str)
  end

  defp do_check_brackets(str) do
    pairs = {left, right} = extract_brackets(str)
    if length(left) == length(right) do
      match_pairs?(pairs)
    else
      false
    end
  end

  def right_before_left?({left, right}) do
    
  end

  def extract_brackets(str) do
    left = Regex.scan(@left_brackets,str,return: :index) |> List.flatten |> get_index(str)
    right = Regex.scan(@right_brackets, str,return: :index) |> List.flatten |> get_index(str)
    {left, right}
  end

  def get_index(list,from_string) do
    for {x, y} <- list do
      {String.slice(from_string,x,1), x}
    end
  end

  def match_pairs?({left, right}) do
    true
  end

  def compare_pair({{l_symbol, _},{r_symbol, _}}) do

  end
end
