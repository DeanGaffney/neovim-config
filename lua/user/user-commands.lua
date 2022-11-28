vim.api.nvim_create_user_command(
	"JiraLink",
	-- First line is blank, and the output is placed on the second line, so delete the first line
	":execute 'read !echo \"- https://servisbot.atlassian.next/browse/$(git branch --show-current)\"' | normal ggdd",
	{}
)
