exception Negative_Amount

let change amount =
  if amount < 0 then
    raise Negative_Amount
  else
    let denominations = [25; 10; 5; 1] in
    let rec aux remaining denominations =
      match denominations with
      | [] -> []
      | d :: ds -> (remaining / d) :: aux (remaining mod d) ds
    in
    aux amount denominations

let first_then_apply (array: 'a list) (predicate: 'a -> bool) (consumer: 'a -> 'b): 'b =
  match List.find_opt predicate array with
  | Some x -> consumer x
  | None -> None

let powers_generator base = 
  let rec generate_from power () =
    Seq.Cons (power, generate_from (power * base))
  in
  generate_from 1

let meaningful_line_count filename =
  let meaningful_line line = 
    let trimmed = String.trim line in
    String.length trimmed > 0 && not (String.starts_with ~prefix:"#" trimmed)
  in

  let the_file = open_in filename in
  let finally () = close_in the_file in

  let rec count_lines count =
    try
      let line = input_line the_file in 
      if meaningful_line line then
        count_lines (count + 1)
      else
        count_lines count
    with
    | End_of_file -> count
  in

  Fun.protect ~finally (fun () -> count_lines 0)

type shape = 
  | Sphere of float
  | Box of float * float * float

let volume s = 
  match s with
  | Sphere r -> Float.pi *. (r ** 3.0) *. 4.0 /. 3.0
  | Box (l, w, h) -> l *. w *. h

let surface_area s =
  match s with
  | Sphere r -> 4.0 *. (r**2.0) *. Float.pi
  | Box (l, w, h) -> 2.0 *. l *. w +. 2.0 *. l *. h +. 2.0 *. w *. h

type 'a binary_search_tree = 
  | Empty
  | Node of 'a binary_search_tree * 'a * 'a binary_search_tree

let rec size tree =
  match tree with
  | Empty -> 0
  | Node (left, _, right) -> 1 + size left + size right

let rec contains data tree =
  match tree with
  | Empty -> false
  | Node (left, value, right) -> data == value || contains data left || contains data right

let rec insert comparable tree =
  match tree with
  | Empty -> Node (Empty, comparable, Empty)
  | Node (left, value, right) ->
    if comparable < value then 
      Node (insert comparable left, value, right)
    else if comparable > value then 
      Node (left, value, insert comparable right)
    else
      Node (left, value, right)

let rec inorder tree =
    match tree with
    | Empty -> []
    | Node (left, value, right) -> inorder left @ [value] @ inorder right