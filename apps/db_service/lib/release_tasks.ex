defmodule :release_tasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:db_service)

    path = Application.app_dir(:db_service, "priv/repo/migrations")

    Ecto.Migrator.run(DbService.Repo, path, :up, all: true)

    :init.stop()
  end
end
