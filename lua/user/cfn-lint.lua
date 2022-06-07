local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

local handle_cfn_lint_output = function(params)
	local parser = helpers.diagnostics.from_pattern(
    ":(%d+):(%d+):(%d+):(%d+):(([EW]).*):(.*)",
    { "row", "col", "end_row", "end_col", "code", "severity", "message"},
    { 
      severities ={
        "E": helpers.diagnostics.severities["error"],
        "W": helpers.diagnostics.severities["warning"],
        "I": helpers.diagnostics.severities["information"]
      }
    }
  )

	return parser({ output = params })
end

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
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "yaml" },
	generator = null_ls.generator({
		command = "cfn-lint",
		args = { "--format", "parseable", "-" },
		to_stdin = true,
		from_stderr = true,
		format = "line",
		check_exit_code = check_exit_code,
		on_output = handle_cfn_lint_output,
	}),
}
