atom_feed do |feed|
  feed.title(t 'pages.planet.headline')
  feed.updated(@entries.first.updated_at)

  for entry in @entries
    feed.entry(entry, :url => entry.url) do |feeditem|
      feeditem.title(entry.title)

      feeditem.author do |author|
        author.name entry.author
      end

      feeditem.content(entry.body, :type => 'html')
    end
  end
end
