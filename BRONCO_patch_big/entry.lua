local self_ID = "Bronco-OV-10A"

declare_plugin(self_ID,
{
installed 	 = true,
dirName	  	 = current_mod_path,
version		 = "1.0.0",
state		 = "installed",
info		 = _("Bronco-OV-10A  by dikennek"),
binaries	= { 'OV_10A', },
Skins	=
	{
		{
			name	= "Bronco-OV-10A",
			dir		= "Skins/1"
		},
	},
Missions =
	{
		{
			name		= _("Bronco-OV-10A"),
			dir			= "Missions",
		},
	},
LogBook =
	{
		{
			name		= _("Bronco-OV-10A"),
			type		= "Bronco-OV-10A",
		},
	},
InputProfiles =
	{
		["OV-10A"]     = current_mod_path .. '/Input',
	},
})
----------------------------------------------------------------------------------
local WHEEL_MULTI = 1.3
----------------------------------------------------------------------------------
suspension =
{
			{--Nose wheel
				mass = 7,

				damage_element 					= 0,
				self_attitude 					= true,
				wheel_axle_offset 				= 0.075,
				yaw_limit 						= math.rad(55),
				damper_coeff 					= 200.0,

				amortizer_min_length					= 0.0,
				amortizer_max_length					= 0.326985,
				amortizer_basic_length					= 0.326985,
				amortizer_spring_force_factor			= 1308125,
				amortizer_spring_force_factor_rate		= 3.8,
				amortizer_static_force					= 3320,
				amortizer_reduce_length					= 0.326885,
				amortizer_direct_damper_force_factor	= 60000,
				amortizer_back_damper_force_factor		= 30000,

				allowable_hard_contact_length			= 1.0,

				wheel_radius				  = 0.5574 * WHEEL_MULTI,
				wheel_static_friction_factor  = 0.7,
				wheel_side_friction_factor    = 0.7,
				wheel_roll_friction_factor    = 0.02,
				wheel_glide_friction_factor   = 0.88,
				wheel_kz_factor				  = 0.3,
				noise_k						  = 0.2,
				wheel_damage_force_factor     = 250.0,
				wheel_damage_speed			  = 170.0,

				wheel_moment_of_inertia   = 1.0,

				wheel_brake_moment_max = 0.0,

				arg_post			  = 0,
				arg_amortizer		  = 1,
				arg_wheel_rotation    = 400,
				arg_wheel_yaw		  = 2,
				collision_shell_name  = "WHEEL_F",
			},

			{--Left wheel
				mass = 10,

				damage_element	    = 3,
				wheel_axle_offset 	= 0.0,
				self_attitude	    = false,
				yaw_limit		    = math.rad(0.0),
				damper_coeff	    = 50.0,

				amortizer_min_length					= 0.0,
				amortizer_max_length					= 0.407471,
				amortizer_basic_length					= 0.39471,
				amortizer_spring_force_factor			= 138439,
				amortizer_spring_force_factor_rate		= 1.04,
				amortizer_static_force					= 21210,
				amortizer_reduce_length					= 0.407471,
				amortizer_direct_damper_force_factor 	= 5000,
				amortizer_back_damper_force_factor 		= 5000,


				allowable_hard_contact_length			= 1.0,

				wheel_radius				  = 0.6645 * WHEEL_MULTI,
				wheel_static_friction_factor  = 0.7,
				wheel_side_friction_factor    = 0.7,
				wheel_roll_friction_factor    = 0.04,
				wheel_glide_friction_factor   = 0.88,
				wheel_kz_factor				  = 0.3,
				noise_k						  = 0.2,
				wheel_damage_force_factor     = 250.0,
				wheel_damage_speed			  = 180,
				wheel_moment_of_inertia   	  = 5.0,

				wheel_brake_moment_max = 5000.0 * WHEEL_MULTI,

				arg_post			  = 5,
				arg_amortizer		  = 6,
				arg_wheel_rotation    = 401,
				arg_wheel_yaw		  = -1,
				collision_shell_name  = "WHEEL_L",
			},

			{-- Right wheel
				mass = 10,

				damage_element	    = 5,

				wheel_axle_offset 	= 0.0,
				self_attitude	    = false,
				yaw_limit		    = math.rad(0.0),
				damper_coeff	    = 50.0,

				amortizer_min_length					= 0.0,
				amortizer_max_length					= 0.407471,
				amortizer_basic_length					= 0.39471,
				amortizer_spring_force_factor			= 138439,
				amortizer_spring_force_factor_rate		= 1.04,
				amortizer_static_force					= 21210,
				amortizer_reduce_length					= 0.407471,
				amortizer_direct_damper_force_factor 	= 5000,
				amortizer_back_damper_force_factor 		= 5000,

				allowable_hard_contact_length			= 1.0,

				wheel_radius				   = 0.6645 * WHEEL_MULTI,
				wheel_static_friction_factor   = 0.7,
				wheel_side_friction_factor     = 0.7,
				wheel_roll_friction_factor     = 0.04,
				wheel_glide_friction_factor    = 0.88,
				wheel_kz_factor				   = 0.3,
				noise_k						   = 0.2,
				wheel_damage_force_factor      = 250.0,
				wheel_damage_speed			   = 180,
				wheel_moment_of_inertia  	   = 5.0,

				wheel_brake_moment_max = 5000.0 * WHEEL_MULTI,

				arg_post			  = 3,
				arg_amortizer		  = 4,
				arg_wheel_rotation    = 402,
				arg_wheel_yaw		  = -1,
				collision_shell_name  = "WHEEL_R",
	},
}

---------------------------------------------------------------------------------------

--hammer
--moved after mount-vfs

make_view_settings('Bronco-OV-10A', ViewSettings, SnapViews)

mount_vfs_model_path	(current_mod_path.."/Weapons/shape")
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shape")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
--mount_vfs_texture_path  (current_mod_path.."/Textures/OV-10A.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures")
--hammer
--mount_vfs_texture_path  (current_mod_path.."/Textures/AIRBORNE")
--mount_vfs_texture_path  (current_mod_path.."/Textures/AIRBORNE2")
--hammer
mount_vfs_texture_path  (current_mod_path.."/Cockpit/texture")
mount_vfs_texture_path	(current_mod_path.."/Skins/1/ME")
mount_vfs_sound_path 	(current_mod_path.."/Sounds")

--hammer
dofile(current_mod_path..'/Weapons/OV10_Weapons.lua')
dofile(current_mod_path.."/Views.lua")
dofile(current_mod_path..'/OV10A.lua')
--hammer

local FM =
{
	[1] = self_ID,
	[2] = "Bronco-OV-10A",
	center_of_mass		=	{ -0.6689 , 0.488 , 0.0},		-- center of mass position relative to object 3d model center for empty aircraft

	moment_of_inertia  	= 	{33360.0, 52811.0, 43967.0},   	-- moment of inertia of empty aircraft
--	moment_of_inertia  	= 	{23360.0, 32811.0, 43967.0},   	-- moment of inertia of empty aircraft
--	moment_of_inertia  	= 	{25322.0, 50124.0, 40908.0},   	-- moment of inertia of empty aircraft

		zeroize_amortizers_before_collision_check = true,
	suspension   = suspension, -- gear posts initialization
}


make_flyable('Bronco-OV-10A',current_mod_path..'/Cockpit/Scripts/',FM, current_mod_path..'/comm.lua')


plugin_done()-- finish declaration , clear temporal data
