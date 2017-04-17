defmodule PharosWeb.SearchControllerTest do
  use PharosWeb.ConnCase

  test "GET /search shows landing page for searches", %{conn: conn} do
    conn = get conn, "/search"
    assert html_response(conn, 200) =~ "topic"
    assert html_response(conn, 200) =~ "amount"
  end

  test "POST /search redirects", %{conn: conn} do
    conn = post conn, "/search", topic: "a-topic", amount: "2"
    assert conn.status == 302
  end

  test "GET /search displays previous search", %{conn: conn} do
    post conn, "/search", topic: "a-title", amount: "3"
    conn = get conn, "/search"

    assert html_response(conn, 200) =~ "<strong>Topic:"
    assert html_response(conn, 200) =~ "a-title"
  end
end
