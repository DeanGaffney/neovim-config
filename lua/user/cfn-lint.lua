local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local check_exit_code = function(code, stderr)
	local success = code <= 1

	if not success then
		-- can be noisy for things that run often (e.g. diagnostics), but can
		-- be useful for things that run on demand (e.g. formatting)
		print(stderr)
	end

	return success
end

return {
	name = "cfn-lint",
	meta = {
		url = "https://github.com/aws-cloudformation/cfn-lint",
		description = "Validate AWS CloudFormation yaml/json templates against the AWS CloudFormation Resource Specification",
	},
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "yaml", "json" },
	generator = null_ls.generator({
		command = "cfn-lint",
		args = { "--format", "parseable", "-" },
		to_stdin = true,
		from_stderr = true,
		format = "line",
		check_exit_code = check_exit_code,
		on_output = helpers.diagnostics.from_pattern(
			[[:(%d+):(%d+):(%d+):(%d+):(([IEW]).*):(.*)]],
			{ "row", "col", "end_row", "end_col", "code", "severity", "message" },
			{
				severities = {
					E = helpers.diagnostics.severities["error"],
					W = helpers.diagnostics.severities["warning"],
					I = helpers.diagnostics.severities["information"],
				},
			}
		),
	}),
}
