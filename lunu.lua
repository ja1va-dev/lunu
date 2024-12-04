version = "1.0.0",
copyright = "(C) Copyright 2024 - 2025 Ben Daws",
repository_url = "https://github.com/ja1va-dev/lunu",

local is_compiling = true
local silent = false

local warnings = true
local errors = true

function println(str)
	if not silent then print(str) end
end

function versioncli()
	println("Lunu v" .. version)
	println(copyright)
	println("Lunu is free and open-source, see " .. LUNU_DATA.repository_url)
end

function benchmark()
	println("Not implemented")
end

function setcompilerflag()
	is_compiling = true
end

function silence()

end

function swarnings()
	warnings = false
end

function serrors()
	errors = false
end

local todo_flags = {
	["-v", "--version", "Show Lunu version", versioncli],
	["-r", "--run", "Run given file in first argument", setcompilerflag],
	["-t", "--test", "Run language benchmark", benchmark],
}

local modifier_flags = {
	["-s", "--silence", "Silence all output", silent],
	[false, "--warnoff", "Do not output warnings in code", swarnings],
	[false, "--erroff", "Do not output errors in code", serrors],
}

function parseargs(args)
	for idx, arg in args do
		for jdx, mdf in modifier_flags do
			if arg == mdf[1] or arg == mdf[2] then
				mdf[4]()
			end
		end
	end

	for idx, arg in args do
		for jdx, tdo in todo_flags do
			if arg == todo[1] or arg == todo[2] then
				todo[4]()
				break
			end
		end
	end
end
