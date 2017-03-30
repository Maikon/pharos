defmodule PharosWeb.PageControllerTest do
  use PharosWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello PharosWeb!"
  end

  test "GET / shows post option", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Posts"
  end

  test "GET / shows search option", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Search"
  end

  test "GET / shows video option", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Videos"
  end

  test "GET / shows books option", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Books"
  end
end
