math.randomseed(os.time())

local home_dir = os.getenv("HOME")
local downloads = home_dir .. "/Downloads/"

local emoji = {"<3", ":P", ":)", "(─‿─)", ":O", ">⩊<"}

local rules = {
    { dir = "Images/",  exts = {"jpg", "png", "jpeg", "webp", "gif", "svg"} },
    { dir = "Documents/", exts = {"pdf", "docx", "txt", "md"} },
    { dir = "Archives/", exts = {"zip", "rar", "tar", "gz", "7zip"} }
}

print("Starting Cleaning...")

for _, rule in ipairs(rules) do
    local target_dir = downloads .. rule.dir
    os.execute("mkdir -p " .. target_dir)

    for _, ext in ipairs(rule.exts) do 
        local cmd = string.format(
            "bash -c 'shopt -s nocaseglob; cp %s*.%s %s 2>/dev/null && rm %s*.%s 2>/dev/null'", 
            downloads, ext, target_dir, downloads, ext
        )
        
        os.execute(cmd)
    end
end

local total_emojis = #emoji
local random_emoji = emoji[math.random(1, total_emojis)]

print("Done! " .. random_emoji)
