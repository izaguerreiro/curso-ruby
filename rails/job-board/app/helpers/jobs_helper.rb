module JobsHelper
	def job_title(job)
		title = h(job.title)

		if job.premium
			title + content_tag(:strong, " (premium)")
		else
			title
		end
	end
end