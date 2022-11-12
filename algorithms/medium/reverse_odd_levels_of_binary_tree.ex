# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  @spec reverse_odd_levels(root :: TreeNode.t() | nil) :: TreeNode.t() | nil
  def reverse_odd_levels(root) do
    {l, r} = reverse_odd_levels(root.left, root.right, 1)
    %{root | left: l, right: r}
  end

  def reverse_odd_levels(nil, nil, _level), do: {nil, nil}

  def reverse_odd_levels(node1, node2, level) do
    {u, v} = if rem(level, 2) == 1, do: {node2.val, node1.val}, else: {node1.val, node2.val}

    {l1, r2} = reverse_odd_levels(node1.left, node2.right, level + 1)
    {r1, l2} = reverse_odd_levels(node1.right, node2.left, level + 1)
    {%{node1 | val: u, left: l1, right: r1}, %{node2 | val: v, left: l2, right: r2}}
  end
end
