atom_feed do |feed|
  feed.title(t 'pages.blog.headline')
  feed.updated(@blogposts.first.updated_at)

  @blogposts.each do |blogpost|
    feed.entry(blogpost, :url => blog_url(blogpost)) do |entry|
      entry.title(blogpost.title)

      entry.author do |author|
        author.name('Diaspora* Foundation')
      end

      entry.content(markdownify(blogpost.content), :type => 'html')
    end
  end
end
