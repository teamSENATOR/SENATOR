--begin
local function run(msg, matches)
  if is_sudo(msg) then
 if matches[1]:lower() == "send" and matches[2] and matches[3] then
  local send_file = "./"..matches[2].."/"..matches[3]
  tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, send_file, '@Dev_Hussein5_6')
 end
 if matches[1]:lower() == "جلب ملف" and matches[2] then
     local plug = "./plugins/"..matches[2]..".lua"
  tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, plug, '@Dev_Hussein5_6')
    end
  end
end

return {
  patterns = {
  "^([Ss][Ee][Nn][Dd]) (.*) (.*)$",
  "^(جلب ملف) (.*)$"
  },
  run = run
}