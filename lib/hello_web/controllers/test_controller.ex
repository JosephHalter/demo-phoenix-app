defmodule HelloWeb.TestController do
  use HelloWeb, :controller

  def batch(conn, %{"file" => %Plug.Upload{content_type: _content_type, filename: _filename, path: _path}}) do
    conn
      |> put_resp_content_type("application/vnd.api+json")
      |> send_resp(200, %{status: "ok"} |> Poison.encode!)
      |> halt
  end
end
