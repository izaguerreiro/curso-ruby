atom_feed language: 'en-US' do |feed|
	feed.title 'Jobs Board'
	feed.updated @last_updated

	@jobs.each do |job|
		feed.entry(job) do |entry|
			entry.url url_for(job)
			entry.title job.title
			entry.content job.description
			entry.updated(job.updated_at.strftime('%Y-%m-%dT%H:%M:%SZ'))
			
			entry.author do |author|
				author.name job.company.name
			end
		end
	end
end