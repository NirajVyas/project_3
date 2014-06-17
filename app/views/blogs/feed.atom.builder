atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated
   
  @blogposts.each do |blogpost|
    next if blogpost.updated_at.blank?
     
    feed.entry(blog) do |entry|
      entry.url blog_url(blogpost)
      entry.title blog.name
      entry.content blog.content, :type => 'html'
      entry.updated(blog.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
     
      entry.author do |author|
        author.name("Your Author") # could be in your DB, or just static
      end
    end
  end
end