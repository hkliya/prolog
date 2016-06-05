/*
* 给定一只股票每天价格的序列prices，设计一个算法获得最大利润所有操作序列transactions。
* 规则如下：
* 1、每天最多买卖一次
* 2、每次买卖1股，最大持仓1股
* 3、有仓位才能卖出
* 4、卖出后，必须cooldown一天才能继续操作
* 
* 举例：
* prices = [1, 2, 3, 1, 3]
* maxProfit = 3
* transactions = [buy, sell, cooldown, buy, sell]
* 
* 如果某天不操作，为pass。
*/

belongs_to([], _).
belongs_to([Head|Tail], List) :-
  member(Head, List),
  belongs_to(Tail, List).

one_transaction_per_day(Prices, Transactions) :-
 same_length(Prices, Transactions).

sum(buy, 1).
sum(sell, -1).
sum(cooldown, 0).
sum(pass, 0).
sum([], 0).
sum([Head|Tail], Stocks) :-
  sum(Head, X),
  sum(Tail, Y), Stocks is X + Y.

hold_at_most_one_stock([]).
hold_at_most_one_stock([Head|Tail]) :-
  sum(Head, X),
  sum(Tail, Y),
  X + Y < 2,
  X + Y > -1,
  hold_at_most_one_stock(Tail).

should_cooldown_after_sell(Transactions) :-
  nextto(cooldown, sell, Transactions).

should_not_buy_at_the_end(Transactions) :-
  \+last(Transactions, buy).

should_not_sell_at_the_beginning(ReversedTransactions) :-
  \+last(ReversedTransactions, sell).

plan(Prices, Transactions) :-
  one_transaction_per_day(Prices, Transactions),
  belongs_to(Transactions, [buy, sell, cooldown, pass]),
  reverse(Transactions, ReversedTransactions),
  hold_at_most_one_stock(ReversedTransactions),
  should_cooldown_after_sell(ReversedTransactions),
  should_not_sell_at_the_beginning(ReversedTransactions).
