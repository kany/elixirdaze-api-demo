# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirDaze.Repo.insert!(%ElixirDaze.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ElixirDaze.{Post, User, Repo}

Repo.transaction fn ->
  user1 =
    %User{}
    |> User.changeset(%{name: "Brian", email: "brian@example.com", password: "password", password_confirmation: "password"})
    |> Repo.insert!()

  user2 =
    %User{}
    |> User.changeset(%{name: "Stephanie", email: "steph@example.com", password: "password", password_confirmation: "password"})
    |> Repo.insert!()

  post1 =
    Ecto.build_assoc(user1, :posts)
    |> Post.changeset(%{title: "Jimmy cracks corn and I don't care", body: Elixilorem.words(100), published_at: "2016-1-1"})
    |> Repo.insert!()

  post2 =
    Ecto.build_assoc(user1, :posts)
    |> Post.changeset(%{title: "Kylo Ren is emo", body: Elixilorem.words(100), published_at: "2016-2-10"})
    |> Repo.insert!()

  post3 =
    Ecto.build_assoc(user2, :posts)
    |> Post.changeset(%{title: "Kylo Ren is emo", body: Elixilorem.words(100), published_at: "2016-1-10"})
    |> Repo.insert!()
end
