# Twitter

A module named `Search` needs to be implemented which fulfils the following contract:

```
@spec for_topic(map) :: list(%Result{})

For example:

iex> Search.for_topic(%{topic: "pizza", amount: 1})
iex> [
%{__struct__: Result,
  description: "actual tweet content",
  link: "link-to-tweet",
  title: "chosen title",
  source: "twitter"}
 ]

```


