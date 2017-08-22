local function modadd(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
       return '[♦️] اهلآ وسهلآ بك😻✋️\n[♦️] انت لست المطور ❌'
else
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.chat_id_)] then
if not lang then
     return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] المجموعه بلفعل تم تفعيلها📍✅'
else
  end
end
        -- create data array in moderation.json
      data[tostring(msg.chat_id_)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          welcome = 'yes'
          },
   mutes = {
                  mute_fwd = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no'
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.chat_id_)] = msg.chat_id_
      save_data(_config.moderation.data, data)
    if not lang then
       return '[♦️] اهلا وسهلا بك 😻✋️\n[♦️]  تـم تـفـعـيـل الـمـجـمـوعـه 📍✅'
else
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '[♦️] اهلا وسهلا بك 😻✋️ \n[♦️] أنـت لـسـت الـمـطـور ❌'
   else
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.chat_id_
  if not data[tostring(msg.chat_id_)] then
  if not lang then
      return '[♦️] اهلا وسهلا بك 😻✋️\n[♦️] المجموعه بلفعل تم تعطيلها🤖❌'
else
   end
  end

  data[tostring(msg.chat_id_)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.chat_id_)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
    return '[♦️] اهلا وسهلا بك 😻✋️\n[♦️] تـم تـعـطـيـل الـمـجـمـوعـه 🤖❌'
 else
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.chat_id_)]['filterlist'][(word)] then
   if not lang then
         return  "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] الكلمه ["..word.."]\n[♦️] هي بلفعل من قائمه المنع 🚸✅"
            else
    end
end
   data[tostring(msg.chat_id_)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
          return  "[♦️] اهلآ وسهلا بك 😻✋️\n[♦️] الكلمه ["..word.."]\n[♦️] تمت اضافتها الى قائمه المنع ✅"
            else
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.chat_id_)]['filterlist'][word] then
      data[tostring(msg.chat_id_)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
       return  "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الكلمه ["..word.."]\n[♦️] تم السماح بها ✅"
       elseif lang then
     end
      else
       if not lang then
         return  "[♦️]اهلآ وسهلا بك 😻✋️\n[♦️] الكلمه ["..word.."]\n[♦️] هي بلفعل مسموح بها ✅"
       elseif lang then
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
      return  "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] هذه المجموعه ليست من حمايتي ❌"
 else
    end
     end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['mods']) == nil then --fix way
  if not lang then
return  "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] لا يوجد ادمن في هذه المجموعه ❌"
else
  end
end
if not lang then
    message = "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] لا يوجد ادمن في هذه المجموعه ❌"
else
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
if not lang then
   return  "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] هذه المجموعه ليست من حمايتي ❌"
else
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['owners']) == nil then --fix way
 if not lang then
  return  "[♦️] اهلا وسهلا بك 😻✋️\n[♦️] لا يوجد هنا مدير ❌"
else
  end
end
if not lang then
  message = '[♦️] اهلا وسهلا بك 😻✋️\n[♦️] قائمه المدراء 👨‍💻👩‍💻\n'
else
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
return tdcli.sendMessage(data.chat_id_, "", 0, "💡¦ _هذه المجموعه ليست من حمايتي ⚙️_", 0, "md")
else
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..']\n[♦️] الايدي ['..data.id_..']\n[♦️]بلفعل تم ترقيته مديرالمجموعه 👨🏻‍🏫✅ ', 0, "md")
   else
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته مديرالمجموعه 👨🏻‍🏫✅ ', 0, "md")
   else
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم ترقيته ادمن المجموعه 👨‍💻✅', 0, "md")
else
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته ادمن المجموعه 👨‍💻✅', 0, "md")
   else
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم تنزيله المديرالمجموعه ❌👨🏻‍🏫', 0, "md")
   else
end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيل المدير المجموعه 👨🏻‍🏫❌ ', 0, "md")
    else
end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️]  بلفعل تم تنزيل ادمن المجموعه 👨‍💻❌', 0, "md")
    else
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيله ادمن المجموعه 👨‍💻❌', 0, "md")
   else
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "[♦️] user id ["..data.id_.."] ", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, " 🚸 User Not Found ", 0, "md")
   else
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
return tdcli.sendMessage(data.chat_id_, "", 0, "[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] هذه المجموعه ليست من حمايتي ❌", 0, "md")
else
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..']\n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم ترقيته مدير المحموعه 👨🏻‍🏫✅ ', 0, "md")
   else
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته مدير المجموعه 👨🏻‍🏫✅', 0, "md")
   else
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم بلفعل ترقيته ادمن المجموعه 👨‍💻✅', 0, "md")
else
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️ \n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته ادمن المجموعه 👨‍💻✅_', 0, "md")
   else
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم تنزيل مدير المجموعه 👨🏻‍🏫❌', 0, "md")
   else
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيله مدير المجموعه 👨🏻‍🏫❌', 0, "md")
    else
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم تنزيل ادمن المجموعه 👨‍💻❌', 0, "md")
    else
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيل ادمن المجموعه 👨‍💻❌', 0, "md")
   else
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "[♦️] user "..data.id_.." ", 0, "md")
end
    if cmd == "res" then
    if not lang then
  text =  "[♦️] معلومات [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
  else
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
      end
   end
else
    if lang then
   else
return tdcli.sendMessage(data.chat_id_, "", 0, "🚸 لا يوجد _", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
return tdcli.sendMessage(data.chat_id_, "", 0, "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] هذه المجموعه ليست من حمايتي ❌", 0, "md")
else
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..']\n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم ترقيته مدير المحموعه 👨🏻‍🏫✅ ', 0, "md")
   else
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته مدير المجموعه  👨🏻‍🏫✅', 0, "md")
   else
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️]اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي _*['..data.id_..']\n[♦️] بلفعل تم ترقيته ادمن المجموعه 👨‍💻✅', 0, "md")
else
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
   return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️]اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم ترقيته ادمن المجموعه 👨‍💻✅', 0, "md")
   else 
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️]اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيل مدير المجموعه  👨🏻‍🏫❌', 0, "md")
   else
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] تم تنزيل مدير المجموعه  👨🏻‍🏫❌', 0, "md")
    else
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي ['..data.id_..']\n[♦️] بلفعل تم تنزيل ادمن المجموعه  👨‍💻❌', 0, "md")
    else
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العضو ['..user_name..'] \n[♦️] الايدي *['..data.id_..']*\n[♦️] تم تنزيل ادمن المحموعه 👨‍💻❌', 0, "md")
   else
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = '_لا يوجد_'
 else
  end
end
     if not lang then
return tdcli.sendMessage(arg.chat_id, 0, 1, '[♦️] الايدي [ '..data.id_..' ]\n[♦️] المعرف : '..username..'\n[♦️] الاسم : '..data.first_name_, 1)
   else
      end
   end
 else
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_لا يوجد_", 0, "md")
   else
    end
  end
else
    if lang then
 return tdcli.sendMessage(arg.chat_id, "", 0, "_لا يوجد_", 0, "md")
   else
      end
   end
end



---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "[♦️] هذا الامر يخص الادمنيه فقط  ❌"
else
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الروابط بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الروابط في المجموعه 🔐✅'
else
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️]الروابط بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الروابط في المجموعه 🔓✅'
else
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التاك بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] هلآ وسهلآ بك 😻✋️\n[♦️] تم قفل التاك في المجموعه 🔐✅'
else
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التاك بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️]اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح التاك في المجموعه 🔓✅'
else
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التذكير بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل التذكير في المجموعه 🔐✅'
else 
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التذكير بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️]تم فتح التذكير في المجموعه 🔓✅'
else
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العربيه بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل العربيه في المجموعه 🔐✅'
else
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] العربيه بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح العربيه في المجموعه 🔓✅'
else
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️[♦️]\n[♦️]التعديل بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل التعديل في المجموعه 🔐✅'
else
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التعديل بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح التعديل في المجموعه 🔓✅'
else
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الكلايش بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الكلايش في المجموعه 🔐✅'
else
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الكلايش بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الكلايش في المجموعه 🔓✅'
else
end
end
end
---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التكرار بلفعل تم قفلها في المجموعه ✅🔐'
elseif lang then
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل التكرار في المجموعه 🔐✅'
else
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التكرار بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️[ اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح التكرار في المجموعه 🔓✅'
else
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] البوتات بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل البوتات في المجموعه 🔐✅'
else
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] البوتات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح البوتات في المجموعه 🔓✅'
else
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الماركدوان بلفعل تك قفلها في المجموعه🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الماركدوان في المجموعه 🔐✅'
else
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الماركدوان بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الماركدوان في المجموعه 🔓✅'
else
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️]الاعلانات بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلا وسهلآ بك 😻✋️\n[♦️] تم قفل العلانات في المجموعه 🔐✅'
else
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻😑\n[♦️] الاعلانات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الاعلانات في المجموعه 🔓✅'
else
end
end
end

--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return '[♦️] اهلآ وسعلآ بك 😻✋️\n[♦️] المحادثه بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل المحادثه في المجموعه 🔐✅'
else
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else

end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] المحادثه بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح المحادثه في المجموعه 🔓✅'
else
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] المتحركه بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل المتحركه في المجموعه 🔐✅'
else
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] المتحركه بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح المتحركه في المجموعه 🔓✅'
else
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الالعاب بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الالعاب في المجموعه 🔐✅'
else
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الألعاب بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الألعاب في المجموعه 🔓✅'
else
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] النلاين بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل النلاين في المجموعه 🔐✅'
else
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الانلاين بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الانلاين في المجموعه 🔓✅'
else
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] النص بلفعل تم قفلها في المجموعه  🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل النص في المجموعه 🔐✅'
else
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] النص بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح النص في المجموعه 🔓✅'
else
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الصور بلفعل تم قفلها في المجموعه  🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الصور في المجموعه 🔐✅'
else
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك ✋️😻\n[♦️] الصور بلفعل تم فتحها في المجموعه 🔓✅' 
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك ✅😻\n[♦️] تم فتح الصور في المجموعه 🔓✅'
else
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الفيديو بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الفيديو في المجموعه 🔐✅'
else
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الفيديو بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الفيديو في المجموعه 🔓✅'
else
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] البصمات بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل البصمات في المجموعه 🔐✅'
else 
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] البصمات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح البصمات في المجموعه 🔓✅'
else
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return " [♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الصوت بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الصوت في المجموعه 🔐✅'
else
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الصوت بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الصوت في المجموعه 🔓✅'
else
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الملصقات بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الملصقات في المجموعه 🔐✅'
else
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الملصقات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الملصقات في المجموعه 🔓✅'
else
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
return '[♦️]اهلآ وسهلآ بك 😻✋️\n[♦️] جهات الاتصال بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل جهات الاتصال في المجموعه 🔐✅'
else
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] جهات الاتصال بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح جهات الاتصال في المجموعه 🔓✅'
else
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] التوجيه بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل التوجيه في المجموعه 🔐✅'
else
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n💡¦ _التوجيه بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح التوجيه في المجموعه 🔓✅'
else
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦] الموقع بلفعل تم قفلها 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الموقع في المجموعه 🔐✅'
else
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
if not lang then
retreturn '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الموقع بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
returreturn '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الموقع في المجموعه 🔓✅'
else
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الملفات بلفعل تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الملفات في المجموعه 🔐✅'
else
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
if not lang then
return '[♦️] اهلآوسهلآ بك 😻✋️\n[♦️] الملفات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الملفات في المجموعه 🔓✅'
else
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الاشعارات بالتأكيد تم قفلها في المجموعه 🔐✅'
elseif lang then
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم قفل الاشعارات في المجموعه 🔐✅'
else
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الاشعارات بلفعل تم فتحها في المجموعه 🔓✅'
elseif lang then
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم فتح الاشعارات في المجموعه 🔓✅'
else
end 
end
end
----------MuteList---------
function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
turn "[♦️] هذا الامر يخص الادمنيه فقط ❌"
else
end
end
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_all"] then			
data[tostring(target)]["settings"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_gif"] then			
data[tostring(target)]["settings"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_text"] then			
data[tostring(target)]["settings"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_photo"] then			
data[tostring(target)]["settings"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_video"] then			
data[tostring(target)]["settings"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_audio"] then			
data[tostring(target)]["settings"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_voice"] then			
data[tostring(target)]["settings"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_sticker"] then			
data[tostring(target)]["settings"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_contact"] then			
data[tostring(target)]["settings"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_forward"] then			
data[tostring(target)]["settings"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_location"] then			
data[tostring(target)]["settings"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_document"] then			
data[tostring(target)]["settings"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_tgservice"] then			
data[tostring(target)]["settings"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_inline"] then			
data[tostring(target)]["settings"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_game"] then			
data[tostring(target)]["settings"]["mute_game"] = "no"		
end
end

if not lang then
local settings = data[tostring(target)]["settings"] 
text = " اهلآ وسهلآ بك 😻✋️\n[♦️] اعـدادات الـمـجـمـوعـه 📝\n🔹🔸🔹🔸🔹🔸🔹🔸🔹\n[♦️] قفل التعديل ❗️ "..settings.lock_edit.."\n[♦️] قفل الروابط ❗️ "..settings.lock_link.."\n[♦️] قفل التاك ❗️  "..settings.lock_tag.."\n[♦️] قفل التكرار ❗️ "..settings.flood.."\n[♦️] ققل الكلايش ❗️ "..settings.lock_spam.."\n[♦️] قفل التذكير ❗️ "..settings.lock_mention.."\n[♦️] قفل العربيه ❗️ "..settings.lock_arabic.."\n[♦️] قفل الاعلانات ❗️ "..settings.lock_webpage.."\n[♦️] قفل الماركدوان ❗️ "..settings.lock_markdown.."\n[♦️] وضع الترحيب ❗️ "..settings.welcome.."\n[♦️] منع البوتات ❗️ "..settings.lock_bots.."\n[♦️] عدد التكرار ❗️ "..NUM_MSG_MAX.."\n[♦️] قفل المحادثه ❗️"..settings.mute_all.."\n[♦️] قفل الملصقات ❗️"..settings.mute_gif.."\n[♦️] قفل النص ❗️"..settings.mute_text.."\n[♦️] قفل الانلاين ❗️"..settings.mute_inline.."\n[♦️] قفل الالعاب ❗️"..settings.mute_game.."\n[♦️] قفل الصور ❗️"..settings.mute_photo.."\n[♦️] قفل الفيديو ❗️"..settings.mute_video.."\n[♦️] قفل البصمات ❗️"..settings.mute_audio.."\n[♦️] قفل الصوت  ❗️"..settings.mute_voice.."\n[♦️] قفل الملصقات ❗️"..settings.mute_sticker.."\n[♦️] قفل جهات الاتصال ❗️ "..settings.mute_contact.."\n[♦️] قفل التوجيه ❗️"..settings.mute_forward.."\n[♦️] قفل الموقع ❗️"..settings.mute_location.."\n[♦️] قفل الملفات ❗️ "..settings.mute_document.."\n[♦️] قفل الاسعارات ❗️ "..settings.mute_tgservice.."\n🔹🔸🔹🔸🔹🔸🔹🔸🔹\n   @Dev_Hussein5_6"
end
return text
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
   local chat = msg.chat_id_
   local user = msg.sender_user_id_
if matches[1] == "ايدي" then
if not matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   if not lang then
return "[♦️] ايـدي الـمـجـمـوعـه : ["..chat.."]\n[♦️] ايـديـك :["..user.."]"
   else
   end
end
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="id"})
  end
if matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "تثبيت" and is_owner(msg) then
tdcli.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
if not lang then
return "[♦️] هلا وسهلا بك 😻✋️\n[♦️] تم تثبيت الرساله في المجموعه ✅"
else
end
end
if matches[1] == "الغاء التثبيت" and is_mod(msg) then
tdcli.unpinChannelMessage(msg.chat_id_)
if not lang then
return "[♦️]هلا وسهلا بك 😻✋️\n[♦️] تم الغاء تثبيت الرساله في المجموعه ✅"
else
end
end
if matches[1] == "تفعيل" then
return modadd(msg)
end
if matches[1] == "تعطيل" then
return modrem(msg)
end
if matches[1] == "رفع المدير" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "تنزيل المدير"and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "رفع ادمن" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "تنزيل ادمن" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="demote"})
      end
   end

if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الروابط" then
return lock_link(msg, data, target)
end
if matches[2] == "التاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "mention" then
return lock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return lock_arabic(msg, data, target)
end
if matches[2] == "التعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "التكرار"then
return lock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "الماركدوان" then
return lock_markdown(msg, data, target)
end
if matches[2] == "الاعلانات"then
return lock_webpage(msg, data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الروابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "التاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "mention" then
return unlock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "التعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "التكرار"then
return unlock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "الماركدوان" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "الاعلانات"then
return unlock_webpage(msg, data, target)
end
end
if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "المحادثه" then
return mute_all(msg, data, target)
end
if matches[2] == "المتحركه" then
return mute_gif(msg, data, target)
end
if matches[2] == "النص" then
return mute_text(msg ,data, target)
end
if matches[2] == "الصور" then
return mute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return mute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return mute_audio(msg ,data, target)
end
if matches[2] == "البصمات" then
return mute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return mute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return mute_forward(msg ,data, target)
end
if matches[2] == "الموقع" then
return mute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return mute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "النلاين" then
return mute_inline(msg ,data, target)
end
if matches[2] == "الالعاب" then
return mute_game(msg ,data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "المحادثه" then
return unmute_all(msg, data, target)
end
if matches[2] == "المتحركه" then
return unmute_gif(msg, data, target)
end
if matches[2] == "النص" then
return unmute_text(msg, data, target)
end
if matches[2] == "الصور" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "البصمات" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "الموقع" then
return unmute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return unmute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "النلاين" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "الالعاب" then
return unmute_game(msg ,data, target)
end
end
if matches[1] == "معلومات المجموعه" and is_mod(msg) and gp_type(msg.chat_id_) == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "[♦️] اهلآ وسهلآ بك 😻✋️\nمعلومات المجموعه : \n[♦️] عدد الادمنيه ["..data.administrator_count_.."]\n[♦️] عدد الاعضاء ["..data.member_count_.."]\n[♦️] عدد المطرودين ["..data.kicked_count_.."]\n[♦️] ايـدي الـمـجـمـوعـه ["..data.channel_.id_.."] "
print(serpent.block(data))
elseif lang then
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.chat_id_, group_info, {chat_id=msg.chat_id_,msg_id=msg.id_})
end
		if matches[1] == 'ضع رابط' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
		return "[♦️] اهلآ وسهلآ بك😻✋️\n[♦️] ارسل الرابط المجموعه الآن ⁉️⤵️"
    else 
       end
		end

		if msg.content_.text_ then
   local is_link = msg.content_.text_:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.content_.text_:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.content_.text_
				save_data(_config.moderation.data, data)
            if not lang then
			return "[♦️] تم حفظ الرابط المجموعه ☝️😌"
           else
		 	end
       end
		end
    if matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
   return "[♦️] 🌚👌 لا يوجد هنا رابط\n[♦️]عزيزي اكتب [ضع رابط] ⁉️⤵️"
     else
      end
      end
     if not lang then
        text = "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️]رابط المجموعه ⤵️✅ [ "..linkgp.."] "
     else
         end
        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
     end
  if matches[1] == "ضع قوانين" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
   return '[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم حفظ القوانين بنجاح ✅\n[♦️] اكتب(القوانين) لعرضها ⁉️⤵️'
   else 
   end
  end
  if matches[1] == "القوانين" then
 if not data[tostring(chat)]['rules'] then
   if not lang then
         rules = "[♦️] اهلآ وسهلآ بك 😻✋️\n القوانين المجموعه ⤵️\n[♦️] ممنوع نشر الروابط 🚫\n[♦️] ممنوع نشر صوره متحركه اباحيه 😂☝️\n[♦️] ممنوع نشر اعاده توجيه 🚫\n[♦️] ممنوع التكلم بلطائفه😾 اخوان سنه او شيعه هاذ الوطن من بيعه😌😹\n[♦️] اخي عليك بلتزام القوانين المجموعه 😌✋️\n[♦️] المطور عمكم حسوني 😌😹\n[♦️] @Dev_Hussein5_6 "
    elseif lang then
 end
        else
     rules = "[♦️] Group Rules :\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" or matches[1] == "القوانين" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="res"})
  end
if matches[1] == "معلومات" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="whois"})
  end
  if matches[1] == "ضع تكرار" and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
							return "[♦️] Wrong number, range is [1-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return " تم وضع عدد التكرار في المجموعه ✅: [ "..matches[2].." ]"
       end
		if matches[1]:lower() == 'مسح' and is_owner(msg) then
			if matches[2] == 'الادمنيه' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
			return "[♦️] لا يوجد ادمنيه ليتم مسحهم ❌"
             else
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
		return "[♦️] تم مسح الادمنيه بنجاح ✅"
          else
			end
         end
			if matches[2] == 'قائمه المنع' then 
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
	return "[♦️] لا توجد كلمات ممنوعه ليتم مسحها ❌"
         else
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
		return "[♦️] تم مسح الكلمات الممنوعه بنجاح ✅"
           else
           end
			end
			if matches[2] == 'القوانين' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
			return "[♦️] لا يوجد قوانين ليتم مسحها ❌"
             else
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
         return "[♦️] تم مسح القوانين بنجاح ✅"
          else
			end
       end
			if matches[2] == 'الترحيب' then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
        return "[♦️] لا يوجد ترحيب ليتم مسحها ❌"
             else
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
		return "[♦️] تم مسح الترحيب بنجاح ✅"
          else
			end
       end
			if matches[2] == 'الوصف' then
        if gp_type(chat) == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
			return "[♦️] لا يوجد وصف ليتم مسحها ❌"
            else
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
			return "[♦️] تم مسح الوصف بنجاح ✅"
           else
             end
		   	end
        end
		if matches[1]:lower() == 'مسح' and is_admin(msg) then
			if matches[2] == 'owners' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
			return "[♦️] لا يوجد مدراء ليتم مسحهم ❌"
            else
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
			    return "[♦️] تم مسح المدراء بنجاح ✅"
           else
          end
			end
     end
if matches[1] == "ضع اسم" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "ضع وصف" and matches[2] and is_mod(msg) then
     if gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif gp_type(chat) == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
      return "[♦️] تم وضع الوصف بنجاح ✅"
    else
      end
  end
  if matches[1] == "الوصف" and gp_type(chat) == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
       about = "[♦️] لا يوجد وصف ليتم عرضه ❌"
      elseif lang then
       end
        else
     about = "[♦️] Group Description : \n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'منع' and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'الغاء منع' and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
if matches[1] == 'قائمه المنع' and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "الاعدادات" then
return group_settings(msg, target)
end
if matches[1] == "mutelist" then
return mutes(msg, target)
end
if matches[1] == "الادمنيه" then
return modlist(msg)
end
if matches[1] == "المدراء" and is_owner(msg) then
return ownerlist(msg)
end
---------------------------------------------------


if matches[1] == "م1" and is_mod(msg) then
if not lang then
text = [[
‎رفع المدير  [♦️]
‎ تنزيل المدير  [♦️]
‎رفع ادمن  [♦️] 
‎ تنزيل ادمن  [♦️]
‎ ضع تكرار العدد من [1=>50]  [♦️]
‎كتم => لكتم العضو  [♦️] 
‎الغاء الكتم => لرفع الكتم   [♦️]
‎طرد => لطرد العضو   [♦️]
‎حظر => لحظر العضو  [♦️] 
‎الغاء الحظر => لرفع الحظر   [♦️]
‎يوزر => معرف => لعرض اسم =>ايدي  [♦️]
[♦️] ايدي => لعرض الايدي 
‎معلوماتي => لعرض المعلومات  [♦️]
➖♦️➖♦️➖♦️➖♦️➖
‎       القفل ولفتح 
‎[♦️] الروابط ♦️التاك ♦️التعديل ♦️العربيه ♦️الاعلانات ♦️البوتات ♦️التكرار ♦️الكلايش ♦️الماركدوان ♦️المتحركه♦️الصور♦️الملفات♦️الملصقات♦️الفيديو♦️الصوت♦️البصمات ♦️الجهات♦️الاشعارات
➖🔹➖🔹➖🔹➖🔹➖
[♦️] ضع قوانين 
[♦️] ضع اسم 
[♦️] ضع وصف 
[♦️] ضع ترحيب
➖🔹➖🔹➖🔹➖🔹➖
[♦️] مسح => ⬇️
[♦️] المحظورين 🔹الادمنيه🔹القوانين🔹البوتات🔹الوصف🔹الترحيب🔹قائمه المنع🔹المكتومين
➖🔹➖🔹➖🔹➖🔹➖
[♦️] منع =>الكلمه
[♦️] الغاء منع =>الكلمه
[♦️] تثبيت 
[♦️] الغاء تثبيت
[♦️] الاعدادات 
[♦️] المكتومين 
[♦️] قائمه المنع 
[♦️] المحظورين 
[♦️] المدراء 
[♦️] الادمنيه 
[♦️] القوانين
[♦️] معلومات المجموعه
[♦️] الرابط 
[♦️] ضع ترحيب
➖➖➖➖➖➖➖➖➖

#Dev @Dev_Hussein5_6
]]

end
return text
end

--------------------- Welcome -----------------------
	if matches[1] == "الترحيب" and is_mod(msg) then
		if matches[2] == "تشغيل" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تشغيل الترحيب  بلفعل تم تشغيله ✅"
       elseif lang then
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم تشغيل الترحيب ✅"
       elseif lang then
          end
			end
		end
		
		if matches[2] == "اطفاء" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
	return "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] الترحيب بلفعل تم تعطيل ✅"
      elseif lang then
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
			return "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] تم تعطيل الترحيب ✅"  
      elseif lang then
          end
			end
		end
	end
	if matches[1] == "ضع ترحيب" and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "[♦️] تم وضع الترحيب بنجاح ✔️\n"..matches[2].." \n\n[♦️] ملاحظه \n[♦️] تستطيع اضهار القوانين بواسطه  {rules}  \n[♦️] تستطيع اضهار الاسم بواسطه {name} \n[♦️] تستطيع اضهار المعرف بواسه {username} "
       else
     end
	end
end
-----------------------------------------
local function pre_process(msg)
   local chat = msg.chat_id_
   local user = msg.sender_user_id_
 local data = load_data(_config.moderation.data)
	local function welcome_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] نورت المجموعه "
    elseif lang then
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "[♦️] اهلآ وسهلآ بك 😻✋️\n[♦️] القوانين المجموعه ⤵️\n[♦️] ممنوع نشر الروابط 🚫\n[♦️] ممنوع نشر صوره متحركه اباحيه  😂☝️\n[♦️] ممنوع  اعاده توجيه 🚫\n[♦️] ممنوع التكلم بلطائفه😾 اخوان سنه او شيعه هاذ الوطن من بيعه 😌😹\n[♦️] اخي عليك بلتزام القوانين المجموعه 😌✋️\n[♦️] المطور عمكم حسوني 😌😹\n[♦️] @Dev_Hussein5_6"
    elseif lang then
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
		local welcome = welcome:gsub("{username}", user_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.chat_id_)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id_})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.chat_id_)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id_})
		else
			return false
        end
		end
	end
 end
return {
patterns ={
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(معلومات المجموعه)$",
"^(تفعيل)$",
"^(تعطيل)$",
"^(رفع المدير)$",
"^(رفع المدير) (.*)$",
"^(تنزيل المدير)$",
"^(تنزيل المدير) (.*)$",
"^(رفع ادمن)$",
"^(رفع ادمن) (.*)$",
"^(تنزيل ادمن) (.*)$",
"^(تنزيل ادمن)$",
"^(المدراء)$",
"^(الادمنيه)$",
"^(فتح) (.*)$",
"^(قفل) (.*)$",
"^(الاعدادات)$",
"^(فتح) (.*)$",
"^(قفل) (.*)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(القوانين)$",
"^(ضع قوانين) (.*)$",
"^(الوصف)$",
"^(ضع وصف) (.*)$",
"^(ضع اسم) (.*)$",
"^(مسح) (.*)$",
"^(ضع تكرار) (%d+)$",
"^(res) (.*)$",
"^(معلومات) (%d+)$",
"^(الاوامر)$",
"^(منع) (.*)$",
"^(الغاء منع) (.*)$",
"^(قائمه المنع)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(ضع ترحيب) (.*)",
"^(الترحيب) (.*)$"

},
run=run,
pre_process = pre_process
}
--end groupmanager.lua #BOSS TEAM#
