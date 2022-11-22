vim.api.nvim_create_user_command(
	"JiraLink",
	':read !echo "- https://servisbot.atlassian.next/browse/$(git branch --show-current)"',
	{}
)
