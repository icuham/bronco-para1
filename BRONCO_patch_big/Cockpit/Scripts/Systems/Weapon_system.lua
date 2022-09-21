dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local refresh = 0.1
local dev = GetSelf()
make_default_activity(refresh)

local sensor_data = get_base_data()

--constante armement
local Bomblevel1 = 4
local Bomblevel2 = 5
local Bomblevel3 = 9

local Rocketlevel1 = 4
local Rocketlevel2 = 7
local Rocketlevel3 = 33

local BidonLevel1  = 1
local BidonLevel2  = 3
local BidonLevel3  = 43

local Fox2Level1 = 4
local Fox2Level2 = 4
local Fox2Level3 = 7
--------------------

--hammer
--weapon release button
local buttonpres_in   = 8500
local buttonpres_out  = 8501

dev:listen_command(buttonpres_in)
dev:listen_command(buttonpres_out)

dev:listen_command(device_commands.MASTER_ARM)
dev:listen_command(device_commands.INTERVAL)
dev:listen_command(device_commands.SPA_1)
dev:listen_command(device_commands.SPA_2)
dev:listen_command(device_commands.SPA_3)
dev:listen_command(device_commands.SPA_4)
dev:listen_command(device_commands.SPA_5)
dev:listen_command(device_commands.SPA_wingR)
dev:listen_command(device_commands.SPA_wingL)
dev:listen_command(device_commands.EMERJET)
--hammer
dev:listen_command(device_commands.MK_4_POD)
--hammer

local MasterArm = 0
local INTERVAL = 0
local INTERVAL_time = 0
local INT = 0
local condition_release = 0
local Release_order_1 = 0
local Release_order_2 = 2
local Release_order_3 = 4
local Release_order_4 = 3
local Release_order_5 = 1

local SPA1 = 0
local SPA2 = 0
local SPA3 = 0
local SPA4 = 0
local SPA5 = 0
--hammer
local MK4 = 0
--hammer

local SPAWingR      = 0
local SPAWingL      = 0
local SidewinderSeq = 0
local ir_missile_lock_param = get_param_handle("WS_IR_MISSILE_LOCK")

local jettison = 0

local release = 0


dev:listen_command(78)
local smoke_CMD
local smokeison


function post_initialize()

  sndhost = create_sound_host("COCKPIT_ARMS","HEADPHONES",0,0,0)
  aim9seek = sndhost:create_sound("Aircrafts/OV-10A/ov_10_aim9_lo")
  aim9lock = sndhost:create_sound("Aircrafts/OV-10A/ov_10_aim9_hi")

  local birth = LockOn_Options.init_conditions.birth_place
  if birth == "GROUND_HOT" or birth == "AIR_HOT" then
  elseif birth=="GROUND_COLD" then
  end
end


function update()
----------------------------------------------
  MasterArm   = get_cockpit_draw_argument_value(4000)
  INTERVAL    = get_cockpit_draw_argument_value(4001)
  --hammer
  MK4         = get_cockpit_draw_argument_value(4002)
  --hammer
  SPA1        = get_cockpit_draw_argument_value(4005)
  SPA2        = get_cockpit_draw_argument_value(4006)
  SPA3        = get_cockpit_draw_argument_value(4007)
  SPA4        = get_cockpit_draw_argument_value(4008)
  SPA5        = get_cockpit_draw_argument_value(4009)
  SPAWingR    = get_cockpit_draw_argument_value(4010)
  SPAWingL    = get_cockpit_draw_argument_value(4011)
  jettison    = get_cockpit_draw_argument_value(4012)
----------------------------------------------
  local station_info1     = dev:get_station_info(1)
  local station_info2     = dev:get_station_info(2)
  local station_info3     = dev:get_station_info(3)
  local station_info4     = dev:get_station_info(4)
  local station_info5     = dev:get_station_info(5)
  local station_infoRW    = dev:get_station_info(6)
  local station_infoLW    = dev:get_station_info(0)
  --print_message_to_user(station_info1.weapon.level1..","..station_info1.weapon.level2..","..station_info1.weapon.level3..","..station_info1.count)
  --print_message_to_user(station_infoLW.weapon.level1..","..station_infoLW.weapon.level2..","..station_infoLW.weapon.level3..","..station_infoLW.count)
----------------------------------------------
  if INTERVAL == -1 then
    INTERVAL_time = 0.5
  elseif INTERVAL == 0 then
    INTERVAL_time = 1.0
  elseif INTERVAL == 1 then
    INTERVAL_time = 2.0
  end
----------------------------------------------
-------------------------------------------------------------------------------------------------------------------
  if release == 1 and condition_release == 0 then
    Release_order_1 = 0
    Release_order_2 = (station_info1.count*math.abs(SPA1)) + (station_info5.count*math.abs(SPA5))
    Release_order_3 = (station_info1.count*math.abs(SPA1)) + (station_info5.count*math.abs(SPA5)) + (station_info2.count*math.abs(SPA2)) + (station_info4.count*math.abs(SPA4))
    Release_order_4 = (station_info1.count*math.abs(SPA1)) + (station_info5.count*math.abs(SPA5)) + (station_info2.count*math.abs(SPA2))
    Release_order_5 = (station_info1.count*math.abs(SPA1))
    Release_order_6 = (station_info1.count*math.abs(SPAWingR))
    Release_order_7 = (station_info1.count*math.abs(SPAWingL))
    condition_release = 1
  elseif release == 0 then
    condition_release = 0
  end

  --print_message_to_user(Release_order_1..","..Release_order_2..","..Release_order_3..","..Release_order_4..","..Release_order_5..","..Release_order_6..","..Release_order_7..",")
-------------------------------------------------------------------------------------------------------------------
  --hammer
  --drop door para
  if INTERVAL == 1 and release == 1 then

    local alt = sensor_data.getRadarAltitude() --assume metric and min 200
    local vel = sensor_data.getTrueAirSpeed() --assume metric and min 67, 150 mph
    local vsi = sensor_data.getVerticalVelocity()

    --print_message_to_user(alt)
    --print_message_to_user(vel)
    --print_message_to_user(vsi)

    --local clientName = LoGetPilotName()
    --local unitName = Unit.getName(clientName)
    --if unitName ~= nil then
    --  print_message_to_user(unitName)
    --end
    if alt > 200 and vel < 67 and vsi < 3 and vsi > -3 then
      print_message_to_user("(From back) GO!")
      dev:launch_station(7)
    elseif alt < 200 then
      print_message_to_user("(From back) We're TOO LOW!")
    elseif vel > 67 then
      print_message_to_user("(From back) We're TOO FAST!")
    elseif vsi > 3 then
      print_message_to_user("(From back) Stop Climbing! Level Out!")
    elseif vsi < -3 then
      print_message_to_user("(From back) Stop Diving! Level Out!")
    end
    --if ctld exists then try to drop any troops
    --if ctld ~= nil then
    --  ctld.unloadTroops({unitName,true,true})
    --end
    --print_message_to_user(MK4)
  end
  --hammer
  if MasterArm == 1 and SPAWingR == 0 and SPAWingL == 0 then
----------------------------------------------
    if station_info1.weapon.level1 == Rocketlevel1 and station_info1.weapon.level2 == Rocketlevel2 and station_info1.weapon.level3 == Rocketlevel3 then
      if SPA1 == 1 and release == 1 then
        dev:launch_station(1)
      end
    elseif station_info1.weapon.level1 == Bomblevel1 and station_info1.weapon.level2 == Bomblevel2 and station_info1.weapon.level3 == Bomblevel3 then
      if SPA1 == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_1 then
        dev:launch_station(1)
      end
    end
    if SPA1 == -1 and release == 1 then
      dev:emergency_jettison(1)
    end
----------------------------------------------
    if station_info2.weapon.level1 == Rocketlevel1 and station_info2.weapon.level2 == Rocketlevel2 and station_info2.weapon.level3 == Rocketlevel3 then
      if SPA2 == 1 and release == 1 then
        dev:launch_station(2)
      end
    elseif station_info2.weapon.level1 == Bomblevel1 and station_info2.weapon.level2 == Bomblevel2 and station_info2.weapon.level3 == Bomblevel3 then
      if SPA2 == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_2 then
        dev:launch_station(2)
      end
    end
    if SPA2 == -1 and release == 1 then
      dev:emergency_jettison(2)
    end
----------------------------------------------
    if station_info3.weapon.level1 == Rocketlevel1 and station_info3.weapon.level2 == Rocketlevel2 and station_info3.weapon.level3 == Rocketlevel3 then
      if SPA3 == 1 and release == 1 then
        dev:launch_station(3)
      end
    elseif station_info3.weapon.level1 == Bomblevel1 and station_info3.weapon.level2 == Bomblevel2 and station_info3.weapon.level3 == Bomblevel3 then
      if SPA3 == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_3 then
        dev:launch_station(3)
      end
    elseif station_info3.weapon.level2 == 15 and MK4 == 1 then
      if SPA3 == 1 and release == 1 then
        dev:launch_station(3)
      end
    end
    if SPA3 == -1 and release == 1 then
      dev:emergency_jettison(3)
    end
----------------------------------------------
    if station_info4.weapon.level1 == Rocketlevel1 and station_info4.weapon.level2 == Rocketlevel2 and station_info4.weapon.level3 == Rocketlevel3 then
      if SPA4 == 1 and release == 1 then
        dev:launch_station(4)
      end
    elseif station_info4.weapon.level1 == Bomblevel1 and station_info4.weapon.level2 == Bomblevel2 and station_info4.weapon.level3 == Bomblevel3 then
      if SPA4 == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_4 then
        dev:launch_station(4)
      end
    end
    if SPA4 == -1 and release == 1 then
      dev:emergency_jettison(4)
    end
----------------------------------------------
    if station_info5.weapon.level1 == Rocketlevel1 and station_info5.weapon.level2 == Rocketlevel2 and station_info5.weapon.level3 == Rocketlevel3 then
      if SPA5 == 1 and release == 1 then
        dev:launch_station(5)
      end
    elseif station_info5.weapon.level1 == Bomblevel1 and station_info5.weapon.level2 == Bomblevel2 and station_info5.weapon.level3 == Bomblevel3 then
      if SPA5 == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_5 then
        dev:launch_station(5)
      end
    end
    if SPA5 == -1 and release == 1 then
      dev:emergency_jettison(5)
    end
----------------------------------------------
  elseif MasterArm == 1 then
    if station_infoRW.weapon.level1 == Fox2Level1 and station_infoRW.weapon.level2 == Fox2Level2 and station_infoRW.weapon.level3 == Fox2Level3 and station_infoRW.count ~= 0 and SPAWingR == 1 then
      if release == 1 and SidewinderSeq == 0 and station_infoRW.count ~= 0 then
        dev:launch_station(6)
        SidewinderSeq = 1
      end
      dev:select_station(6)
      if ir_missile_lock_param:get() == 0 and station_infoRW.count ~= 0 then
        aim9seek:play_continue()
        aim9lock:stop()
      elseif ir_missile_lock_param:get() == 1 and station_infoRW.count ~= 0 then
        aim9seek:stop()
        aim9lock:play_continue()
      else
        aim9seek:stop()
        aim9lock:stop()
      end
    elseif station_infoLW.weapon.level1 == Fox2Level1 and station_infoLW.weapon.level2 == Fox2Level2 and station_infoLW.weapon.level3 == Fox2Level3 and station_infoLW.count ~= 0 and SPAWingL == 1 then
      if release == 1 and SidewinderSeq == 0 and station_infoLW.count ~= 0 then
        dev:launch_station(0)
        SidewinderSeq = 1
      end
      dev:select_station(0)
      if ir_missile_lock_param:get() == 0 and station_infoLW.count ~= 0 then
        aim9seek:play_continue()
        aim9lock:stop()
      elseif ir_missile_lock_param:get() == 1 and station_infoLW.count ~= 0 then
        aim9seek:stop()
        aim9lock:play_continue()
      else
        aim9seek:stop()
        aim9lock:stop()
      end
    else
---
----------------------------------------------
      if station_infoRW.weapon.level1 == Rocketlevel1 and station_infoRW.weapon.level2 == Rocketlevel2 and station_infoRW.weapon.level3 == Rocketlevel3 then
        if SPAWingR == 1 and release == 1 then
          dev:launch_station(6)
          print_message_to_user("RW")
        end
      elseif station_infoRW.weapon.level1 == Bomblevel1 and station_infoRW.weapon.level2 == Bomblevel2 and station_infoRW.weapon.level3 == Bomblevel3 then
        if SPAWingR == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_6 then
          dev:launch_station(6)
        end
      end
      if SPAWingR == -1 and release == 1 then
        dev:emergency_jettison(6)
      end
  ----------------------------------------------
      if station_infoLW.weapon.level1 == Rocketlevel1 and station_infoLW.weapon.level2 == Rocketlevel2 and station_infoLW.weapon.level3 == Rocketlevel3 then
        if SPAWingL == 1 and release == 1 then
          print_message_to_user("LW")
          dev:launch_station(0)
        end
      elseif station_infoLW.weapon.level1 == Bomblevel1 and station_infoLW.weapon.level2 == Bomblevel2 and station_infoLW.weapon.level3 == Bomblevel3 then
        if SPAWingL == 1 and release == 1 and INT == (INTERVAL_time/refresh) * Release_order_7 then
          dev:launch_station(0)
        end
      end
      if SPAWingL == -1 and release == 1 then
        dev:emergency_jettison(0)
      end
---
      dev:select_station(0)
      aim9seek:stop()
      aim9lock:stop()
      dev:select_station(6)
      aim9seek:stop()
      aim9lock:stop()
    end
    if release == 0 then
      SidewinderSeq = 0
    end
  else
    dev:select_station(0)
    aim9seek:stop()
    aim9lock:stop()
    dev:select_station(6)
    aim9seek:stop()
    aim9lock:stop()
  end
----------------------------------------------

  if release == 1 then
    INT = INT + 1
  else
    INT = 0
  end

----------------------------------------------
  if jettison == 1 then
    dev:emergency_jettison(1)
    dev:emergency_jettison(2)
    dev:emergency_jettison(3)
    dev:emergency_jettison(4)
    dev:emergency_jettison(5)
    if station_infoLW.weapon.level1 == Rocketlevel1 and station_infoLW.weapon.level2 == Rocketlevel2 and station_infoLW.weapon.level3 == Rocketlevel3 then
      dev:emergency_jettison(0)
    end
    if station_infoLW.weapon.level1 == Bomblevel1 and station_infoLW.weapon.level2 == Bomblevel2 and station_infoLW.weapon.level3 == Bomblevel3 then
      dev:emergency_jettison(0)
    end
    if station_infoRW.weapon.level1 == Rocketlevel1 and station_infoRW.weapon.level2 == Rocketlevel2 and station_infoRW.weapon.level3 == Rocketlevel3 then
      dev:emergency_jettison(6)
    end
    if station_infoRW.weapon.level1 == Bomblevel1 and station_infoRW.weapon.level2 == Bomblevel2 and station_infoRW.weapon.level3 == Bomblevel3 then
      dev:emergency_jettison(6)
    end
  end
----------------------------------------------
end


function SetCommand(command, value)
----------------------------------------------
  if command == buttonpres_in then
    release = 1
  end
----------------------------------------------
  if command == buttonpres_out then
    release = 0
  end
----------------------------------------------
  if command == 78 then
    dev:launch_station(8)
    if smoke_CMD == 0 then
      smoke_CMD = 1
    else
      smoke_CMD = 0
    end
  end
end

need_to_be_closed = false -- close lua state after initialization
