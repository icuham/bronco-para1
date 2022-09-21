-- Weapons definitions here

dofile("Scripts/Database/Weapons/warheads.lua")



local GALLON_TO_KG = 3.785 * 0.8
local INCHES_TO_M = 0.0254
local POUNDS_TO_KG = 0.453592



--hammer
--paratrooper
PARATROOP = {
    category        = CAT_BOMBS,
    name            = "PARATROOP",
    user_name       = _("PARATROOP"),
    model     		= "AIRBORNE2",
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme          = "bomb-parashute",
    class_name      = "wAmmunitionBallute",
    type            = 1,
    mass            = 81,
    hMin            = 300.0,
    hMax            = 12000.0,
		Cx      = 0.0001,
		VyHold  = -10.0,
		Ag      = -5.0,
		fm = {
	            mass            = 81, --15
	            caliber         = 0.50000,
	            cx_coeff        = {1.000000, 0.320000, 0.710000, 0.150000, 1.280000},
							cx_factor   	= 100,
	            L               = 1.75,
	            I               = 33.282267,
	            Ma              = 2.746331,
	            Mw              = 2.146083,
	            wind_time       = 1000.000000,
	            wind_sigma      = 50.000000,
	    },
    warhead         = {
						mass        = 0;
		        expl_mass   = 0;
		        other_factors = {1.0, 1.0, 1.0};
		        obj_factors = {1, 1};
		        concrete_factors = {1.0, 1.0, 1.0};
		        cumulative_factor = 1;
		        concrete_obj_factor = 1.0;
		        cumulative_thickness = 1.0;
		        piercing_mass = 1.0;
		        caliber     = 20.32;   -- centimeters
					},
    control =
    {
        open_delay = 2,
    },
		shape_table_data =
		{
			{
				file     = "PARA",
				index    = WSTYPE_PLACEHOLDER,
			},
		},
		targeting_data =
		{
	    v0 = 200,
	    data =
	    {
	        {1.000000, 22.341401, 0.012462},
	        {10.000000, 23.654340, 0.004693},
	        {20.000000, 23.716158, 0.004518},
	        {30.000000, 23.725884, 0.004449},
	        {40.000000, 23.732343, 0.004403},
	        {50.000000, 25.652849, 0.005138},
	        {60.000000, 28.211796, -0.007471},
	        {70.000000, 30.331842, -0.018103},
	        {80.000000, 32.099833, -0.026828},
	        {90.000000, 33.604543, -0.034071},
	        {100.000000, 34.906022, -0.040211},
	        {200.000000, 42.507192, -0.072484},
	        {300.000000, 46.094889, -0.083853},
	        {400.000000, 48.152369, -0.088149},
	        {500.000000, 49.443189, -0.089688},
	        {600.000000, 50.312083, -0.090209},
	        {700.000000, 50.938257, -0.090435},
	        {800.000000, 51.421467, -0.090658},
	        {900.000000, 51.819370, -0.090982},
	        {1000.000000, 52.166176, -0.091431},
	        {1100.000000, 52.482557, -0.091997},
	        {1200.000000, 52.781163, -0.092664},
	        {1300.000000, 53.069819, -0.093412},
	        {1400.000000, 53.353402, -0.094223},
	        {1500.000000, 53.634970, -0.095085},
	        {1600.000000, 53.916446, -0.095986},
	        {1700.000000, 54.199051, -0.096918},
	        {1800.000000, 54.483559, -0.097876},
	        {1900.000000, 54.770471, -0.098855},
	        {2000.000000, 55.060114, -0.099854},
	        {3000.000000, 58.135449, -0.110652},
	        {4000.000000, 61.578307, -0.122891},
	        {5000.000000, 65.441641, -0.136735},
	        {6000.000000, 69.785758, -0.152402},
	        {7000.000000, 74.680457, -0.170127},
	        {8000.000000, 80.206119, -0.190171},
	        {9000.000000, 86.456436, -0.212829},
	        {10000.000000, 93.539509, -0.164750},

			}
		},
}

declare_weapon(PARATROOP)

declare_loadout({
	category 		= CAT_BOMBS,
	CLSID	 		= "{PARATROOP}",
	attribute		= PARATROOP.wsTypeOfWeapon,
	Count 			= 5,
	Cx_pil			= PARATROOP.Cx,
	Picture			= "PARA.png",
	displayName		= PARATROOP.user_name,
	Weight			= PARATROOP.mass,
	Elements  		= {{ShapeName = PARATROOP.model}},
})

---------GUN-----------
-- 7.62 Otan
declare_weapon({category = CAT_SHELLS, name = "7.62x51mm", user_name = _("7.62x51mm"),
	model_name      		= "tracer_bullet_crimson",
	mass            		= 0.020, -- Bullet mass
	round_mass      		= 0.076 + 0.009, -- Assembled shell + link
	cartridge_mass  		= 0.031 + 0.009, -- Empty shell (+ link if links are stored as well)
	explosive       		= 0.0020,
	v0              		= 840.0,
	Dv0             		= 0.0080,
	Da0             		= 0.00045,
	Da1             		= 0.0,
	life_time       		= 10.0,
	caliber         		= 7.62,
	s               		= 0.0,
	j               		= 0.0,
	l               		= 0.0,
	charTime        		= 0,
	cx              		= {1.0, 0.912, 0.7, 0.25, 1.80},
	k1              		= 4.8e-08,
	tracer_off      		= 1.5,
	tracer_on       		= 0.01,
	smoke_tail_life_time 	= 0.5,
	scale_tracer    		= 1,
	cartridge       		= 0,
	scale_smoke     		= 1.0,
	smoke_opacity   		= 0.15,
})

---------Features-----------
--PARA
declare_loadout(	--para
	{
		category		= CAT_FUEL_TANKS,
		CLSID			= "{PARA}",
		attribute		=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture			= "OV10_paratrooper.png",
		displayName		= _("ParaTrooper"),
		Weight_Empty	= 0.0,                         -- "bobtail" configuration
		Weight			= 80.0,
		Cx_pil			= 0.0,
		shape_table_data =
		{
			{
				name 	= "para",
				file	= "para";
				life	= 1;
				fire	= { 0, 1};
				username	= "para";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	=
		{
			{
				ShapeName	= "para",
			},
		},
	}
)

--WHITE Smoke OV10
declare_loadout(
	{
		category			= CAT_PODS,
		CLSID				= "{OV10_SMOKE}",
		Picture				= "OV10_Smoke_System.png",
		PictureBlendColor	= '0xffffffff',
		displayName			= _("OV10_SMOKE"),

		attribute			= {4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke =
		{
            alpha 	= 300,
            r 		= 200,
            g 		= 200,
            b 		= 200,
            dx 		= -0.05,
            dy 		= -0.05,
        },

		shape_table_data =
		{
			{
				name 	= "OV10_SMOKE",
				file	= "OV10_SMOKE";
				life	= 1;
				fire	= { 0, 1};
				username	= "OV10_SMOKE";
				index	= WSTYPE_PLACEHOLDER;
			},
		},

		Weight				= 1,
		Count				= 1,
		Cx_pil				= 0.00000001,
		Elements		=
		{
			ShapeName	=	"OV10_SMOKE",
			Position	=	{0,0,0},
			DrawArgs	=	{[3] = {3,0.1}}
		},
	}
)
---------HIPEG----------------

--[[
References:  AD427049, AD601655, AD306170

Mk 4 Mod 0 gun pod fitted with Mk 11 Mod 5 20mm cannon and 750 rds ammunition
Fires Mk 100-series (Mk 101 to Mk 109) ammunition (20x110mm)
4200 rds/min per pod, twin barrel
22-1/2" in diameter, 16-1/2' long, weighs 1350 pounds loaded

3 pod total:
12,600 rounds/minute, 2250 total rounds of ammunition
--]]

    local tracer_on_time = 0.01
    local barrel_smoke_level = 1.0
    local barrel_smoke_opacity = 0.1

    -- Mk 106 mod 0 - 20x110mm High Explosive - Incendiary
    mk106mod0 = {
        category = CAT_SHELLS, name = "20x110mm HE-I", user_name = _("20x110mm HE-I"),
        model_name      = "tracer_bullet_white",
        mass            = 0.110,
        round_mass      = 0.268,
        cartridge_mass  = 0.158,    -- cartridges retained
        explosive       = 0.050,
        v0              = 1012.0,   -- 3350 fps
        Dv0             = 0.0060,
        Da0             = 0.0022,
        Da1             = 0.0,
        life_time       = 30,
        caliber         = 20.0,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {0.5,1.27,0.70,0.200,2.30},
        k1              = 2.0e-08,
        tracer_off      = -1,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 0,
        scale_tracer    = 0,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity
    }
    declare_weapon(mk106mod0)

    -- Mk 107 mod 0 - 20x110mm Armor Piercing - Incendiary
    mk107mod0 = {
        category = CAT_SHELLS, name = "20x110mm AP-I", user_name = _("20x110mm AP-I"),
        model_name      = "tracer_bullet_white",
        mass            = 0.110,
        round_mass      = 0.268,
        cartridge_mass  = 0.158,    -- cartridges retained
        explosive       = 0.000,
        v0              = 1012.0,   -- 3350 fps
        Dv0             = 0.0060,
        Da0             = 0.0022,
        Da1             = 0.0,
        life_time       = 30,
        caliber         = 20.0,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {0.5,1.27,0.70,0.200,2.30},
        k1              = 2.0e-08,
        tracer_off      = -1,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 0,
        scale_tracer    = 0,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity
    }
    declare_weapon(mk107mod0)

    -- Mk 108 mod 0 - 20x110mm Armor Piercing - Tracer
    mk108mod0 = {
        category = CAT_SHELLS, name = "20x110mm AP-T", user_name = _("20x110mm AP-T"),
        model_name      = "tracer_bullet_yellow",
        mass            = 0.110,
        round_mass      = 0.268,
        cartridge_mass  = 0.158,    -- cartridges retained
        explosive       = 0.000,
        v0              = 1012.0,   -- 3350 fps
        Dv0             = 0.0060,
        Da0             = 0.0022,
        Da1             = 0.0,
        life_time       = 30,
        caliber         = 20.0,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {0.5,1.27,0.70,0.200,2.30},
        k1              = 2.0e-08,
        tracer_off      = 1.7,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 1.7,
        scale_tracer    = 1,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity
    }
    declare_weapon(mk108mod0)


    -- Mk 11 mod 5 gun used in Mk 4 mod 0 gun pod
function Mk11mod0(tbl)
    tbl.category = CAT_GUN_MOUNT
    tbl.name      = "Mk11mod0"
    tbl.supply      =
    {
        shells = {"20x110mm HE-I", "20x110mm AP-I", "20x110mm AP-T"},
        mixes  = {{1,2,1,3}},   -- 50% HE-i, 25% AP-I, 25% AP-T
        count  = 750,
    }
    if tbl.mixes then
       tbl.supply.mixes = tbl.mixes
       tbl.mixes        = nil
    end
    tbl.gun =
    {
        max_burst_length    = 25,
        rates               = {4200},
        recoil_coeff        = 0.7*1.3,
        barrels_count       = 2,
    }
    if tbl.rates then
       tbl.gun.rates        =  tbl.rates
       tbl.rates            = nil
    end
    tbl.ejector_pos             = tbl.ejector_pos or {0, 0, 0}
    tbl.ejector_pos_connector   = tbl.ejector_pos_connector     or  "Gun_point"
    tbl.ejector_dir             = {-1, -6, 0} -- left/right; back/front;?/?
    tbl.supply_position         = tbl.supply_position   or {0,  0.3, -0.3}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 1500
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos            or  {2.5,-0.4,0}     -- all position from connector
    tbl.muzzle_pos_connector    = tbl.muzzle_pos_connector  or  "Gun_point" -- all position from connector
    tbl.azimuth_initial         = tbl.azimuth_initial       or  0
    tbl.elevation_initial       = tbl.elevation_initial     or  0
    if  tbl.effects == nil then
        tbl.effects = {{ name = "FireEffect"     , arg = tbl.effect_arg_number or 436 },
                       { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
                       { name = "SmokeEffect"}}
    end
    return declare_weapon(tbl)
end

mk4hipeg = {
    category        = CAT_PODS,
    CLSID           = "{Mk4 HIPEG}",
    attribute       = {wsType_Weapon,wsType_GContainer,wsType_Cannon_Cont,WSTYPE_PLACEHOLDER},
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Shell,wsType_Shell,WSTYPE_PLACEHOLDER},
    Picture         = "hipeg.png",
    displayName     = _("Mk4 HIPEG"),
    Weight          = 612.35,      -- 1350lb/612.35kg loaded (incl. 201kg of ammunition)
    Cx_pil          = 0.001220703125,
    Elements        = {{ShapeName = "A4E_Mk4_HIPEG"}},
    kind_of_shipping = 2,   -- SOLID_MUNITION
    gun_mounts      = {
        Mk11mod0({
            muzzle_pos_connector = "Point_Gun",
            rates = {4200}, mixes = {{1,2,1,3}},
            effect_arg_number = 1050,
            azimuth_initial = 0,
            elevation_initial = 0,
            supply_position = {2, -0.3, -0.4}})
    },
    shape_table_data = {{file = 'A4E_Mk4_HIPEG'; username = 'MK4 HIPEG'; index = WSTYPE_PLACEHOLDER;}}
}
declare_loadout(mk4hipeg)

--Ammunition MG 7
local tracer_on_time = 0.01
declare_weapon({category = CAT_SHELLS,name =   "MG_20x64_APT",
  user_name		= _("MG_20x64_APT"),
  model_name    = "tracer_bullet_green",
  v0    		= 890.0,
  Dv0   		= 0.0060,
  Da0    		= 0.0022,
  Da1     		= 0.0,
  mass      	= 0.052,
  round_mass 	= 0.152,
  explosive     = 0.60000,
  life_time     = 30,
  caliber     	= 12.7,
  s         	= 0.0,
  j         	= 0.0,
  l         	= 0.0,
  charTime      = 0,
  cx        	= {0.5,1.27,0.70,0.200,2.30},
  k1        	= 2.0e-08,
  tracer_off    = 3,
  tracer_on		= tracer_on_time,
  smoke_tail_life_time = 0.7,
  scale_tracer  = 1,
  cartridge 	= 0,
})


declare_weapon({category = CAT_SHELLS,name =   "MG_20x64_HEI",
  user_name		= _("MG_20x64_HEI"),
  model_name    = "tracer_bullet_white",
  v0    		= 890.0,
  Dv0   		= 0.0060,
  Da0    		= 0.0022,
  Da1     		= 0.0,
  mass      	= 0.052,
  round_mass 	= 0.152,
  explosive     = 0.60000,
  life_time     = 30,
  caliber     	= 12.7,
  s         	= 0.0,
  j         	= 0.0,
  l         	= 0.0,
  charTime      = 0,
  cx        	= {0.5,1.27,0.70,0.200,2.30},
  k1        	= 2.0e-08,
  tracer_off    = 3,
  tracer_on		= tracer_on_time,
  smoke_tail_life_time = 0.7,
  scale_tracer  = 1,
  cartridge 	= 0,
})

function MG_20(tbl)

	tbl.category = CAT_GUN_MOUNT
	tbl.name 	 = "MG_20"
	tbl.supply 	 =
	{
		shells = {"MG_20x64_API","MG_20x64_HEI"},
		mixes  = {{1,2,1,1,2,1}},
		count  = 250,
	}
	if tbl.mixes then
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun =
	{
		max_burst_length = 250,
		rates 			 = {1025},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= {0,-1,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1500
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= tbl.muzzle_pos 		 or  {0,0,0} -- all position from connector
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector 		 or  "Gun_point" -- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0
	tbl.elevation_initial 		= tbl.elevation_initial  or 0
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

--=======================  ARMAMENTO  ===============================--
local explosivePercent = 1.0
--------  SHELL DEFA 553 ----------------------------------------------
--[[
NOMENCLATURA CARTUCCE
CART30-550-OMEI-T7560: --> HEI (rimpiazzato da T7570)
CART30-550-OAPEI-T5270: ??? Explosif incendiaire à parois épaisses destiné au combat air-sol
CART30-550-OATEI-T5460:
CART30-550-OXL-F2570: -->TP
CART30-550-OXT-F3170: -->TP-T
CART30-550-OPIT-T5960: --> APIT (rimpiazzato da T5970)
]] --PER TRAINING mix 5*OXL+1*OXT
local defa553_AP_ammo = {
		category = CAT_SHELLS,
		name ="DEFA553_30AP",
		user_name = _("DEFA553 30mm AP"), --TYPE 5432 (AP per Air-to-Ground)
		model_name    = "tracer_bullet_yellow",
		v0    = 790.0,
		Dv0   = 0.0040,
		Da0     = 0.0008,
		Da1     = 0.0,
		mass      = 0.275,  --solo proiettile 4245 grani
		round_mass = 0.480+0.09, -- proiettile+bossolo+propellente + link
		cartridge_mass = 0.09, --cartuccia espulsa, indicare solo peso link trattenuto nel box di recupero
		explosive     = 0.020, --20grammi
		piercing_mass = 0.055, --se explosive/mass>0.1 allora piercing mass = mass/5.0
		life_time     = 31, --spoletta 1520 è di tipo non Self-Destroy
		caliber     = 30.0,
		s         = 0.0,
		j         = 0.0,
		l         = 0.0,
		charTime    = 0,
		cx        = {0.5,0.75,0.78,0.270,1.65},
		k1        = 2.0e-08,
		tracer_off    = -1,
		tracer_on     = 0,
		smoke_tail_life_time = 0.3,
		scale_tracer  = 1,
		cartridge = 0,
		scale_smoke     = 1.5,
		smoke_opacity   = 0.1,
	}
declare_weapon(defa553_AP_ammo)

local defa553_HE_ammo = {
		category = CAT_SHELLS,
		name ="DEFA553_30HE",
		user_name = _("DEFA553 30mm HE"), 	--TYPE 6522 (HE per Air-to-Air)
		model_name    = "tracer_bullet_A-10",
		v0    = 820.0,
		Dv0   = 0.0040,
		Da0     = 0.0008,
		Da1     = 0.0,
		mass      = 0.245, --3780 grani
		round_mass = 0.440+0.09,
		cartridge_mass = 0.09,
		explosive     = 0.052, --52 grammi di EXAL
		life_time     = 7, --spoletta 1511M (7~15 secondi)
		caliber     = 30.0,
		s         = 0.0,
		j         = 0.0,
		l         = 0.0,
		charTime    = 0,
		cx        = {0.5,0.75,0.78,0.270,1.65},
		k1        = 2.0e-08,
		tracer_off    = -1,
		tracer_on     = 0,
		smoke_tail_life_time = 0.3,
		scale_tracer  = 1,
		cartridge = 0,
		scale_smoke     = 1.5,
		smoke_opacity   = 0.1,
	}
declare_weapon(defa553_HE_ammo)

local defa553_APIT_ammo = {
		category = CAT_SHELLS,
		name ="DEFA553_30APIT",
		user_name = _("DEFA553 30mm API-T"), --TYPE 5970 (API-T per Air-to-Ground)
		model_name    = "tracer_bullet_crimson",
		v0    = 780.0,
		Dv0   = 0.0040,
		Da0     = 0.0008,
		Da1     = 0.0,
		mass      = 0.275,  --4245 grani
		round_mass = 0.490+0.09,
		cartridge_mass = 0.09,
		explosive     = 0.020,
		piercing_mass = 0.055,
		life_time     = 31,
		caliber     = 30.0,
		s         = 0.0,
		j         = 0.0,
		l         = 0.0,
		charTime    = 0,
		cx        = {0.5,0.75,0.78,0.270,1.65},
		k1        = 2.0e-08,
		tracer_off    = 4,
		tracer_on       = 0.01,
		smoke_tail_life_time = 1.5,
		scale_tracer  = 1,
		cartridge = 0,
		scale_smoke     = 1.5,
		smoke_opacity   = 0.1,
	}
declare_weapon(defa553_APIT_ammo)
-------------------------------------------------------------------------
--------  GUNPOD DEFA 553 -----------------------------------------------
----------  Left  -------------------------------------------------------
function DEFA_553L(tbl)

	tbl.category = CAT_GUN_MOUNT
	tbl.name 	 = "GunPod DEFA553 LW"--DEFA_553_L" --nome nel log mix
	tbl.supply 	 =
	{
		shells = {"DEFA553_30HE", "DEFA553_30AP", "DEFA553_30APIT"},
		mixes = {{1, 3, 1, 2}},
		count  = 120,
	}
	if tbl.mixes then
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun =
	{
		max_burst_length = 3,--1, raffica da settare prima del volo: 0.5sec(11 colpi) od 1 sec (22 colpi)
		rates 			 = {1350},
		recoil_coeff 	 = 0.6*1.3/2,--1,
		barrels_count 	 = 1,
	}
	if tbl.rates then
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end
	tbl.ejector_pos = tbl.ejector_pos or {0,0,0}
	--tbl.ejector_pos_connector = tbl.ejector_pos_connector or "ejector_DEFA-L"
	tbl.ejector_dir = tbl.ejector_dir or {0, -1, 0.5}
	tbl.effect_arg_number = tbl.effect_arg_number or 436
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1800
	tbl.drop_cartridge 			= 203 -- shell_30mm
	tbl.muzzle_pos				= tbl.muzzle_pos or {0,0,0} -- all position from connector
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector or  "Gun_point" -- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0
	tbl.elevation_initial 		= tbl.elevation_initial  or 0
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

declare_loadout({
	category 		=   CAT_PODS,
	CLSID	 		=  "{MB339-DEFA553_L}",
	attribute		=   {wsType_Weapon,wsType_GContainer,wsType_Cannon_Cont,WSTYPE_PLACEHOLDER},
	wsTypeOfWeapon	= 	{wsType_Weapon, wsType_GContainer, wsType_Cannon_Cont, wsType_DEFA553_L},
	Picture			=	"MB339-DEFA.png",
	displayName		=	_("GunPod DEFA553"),--_("DEFA-553-L"), --nome nel loadout editor
	Weight			=	190,
	Cx_pil			=	0.001220703125/2,
	Elements  		= {{ShapeName = "MB339-DEFA553_L"}},
	kind_of_shipping = 2,--SOLID_MUNITION
	gun_mounts		= {
			DEFA_553L({
			muzzle_pos_connector = "Point_Gun_DEFA-L", --EL 0.5°, AZ +-0.2°
			--ejector_pos_connector = "ejector_DEFA-L",
			ejector_pos = {-2.25, -0.22, 0.095},
			supply_position = {2, -0.3, -0.4}})
			},
	shape_table_data = {{file  	 = 'MB339-DEFA553_L';	username = 'DEFA-553-L';index    =  WSTYPE_PLACEHOLDER;}}
})
-------------------------------------------------------------------------
--------  GUNPOD DEFA 553 -----------------------------------------------
----------  Right  ------------------------------------------------------
function DEFA_553R(tbl)

	tbl.category = CAT_GUN_MOUNT
	tbl.name 	 = "GunPod DEFA553 RW"--DEFA_553_R" --nome nel log mix
	tbl.supply 	 =
	{
		shells = {"DEFA553_30HE", "DEFA553_30AP", "DEFA553_30APIT"},
		mixes = {{1, 3, 1, 2}},
		count  = 120,
	}
	if tbl.mixes then
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun =
	{
		max_burst_length = 3,--1, raffica da settare prima del volo, valori reali 0.5sec(11 colpi) od 1 sec (22 colpi)
		rates 			 = {1350},
		recoil_coeff 	 = 0.6*1.3/2,--1, c'è un recoil absorber che fa arretrare l'arma fino a 18mm, quindi è da smorzare
		barrels_count 	 = 1,
	}
	if tbl.rates then
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end
	tbl.ejector_pos = tbl.ejector_pos or {0,0,0}
	--tbl.ejector_pos_connector = tbl.ejector_pos_connector
	tbl.ejector_dir = tbl.ejector_dir or {0, -1, 0.5}
	tbl.effect_arg_number = tbl.effect_arg_number or 436
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1800
	tbl.drop_cartridge 			= 203 -- shell_30mm
	tbl.muzzle_pos				= tbl.muzzle_pos or {0,0,0} -- all position from connector
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector --or "Gun_point" -- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0
	tbl.elevation_initial 		= tbl.elevation_initial  or 0
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

declare_loadout({
	category 		=   CAT_PODS,
	CLSID	 		=  "{MB339-DEFA553_R}",
	attribute		=   {wsType_Weapon,wsType_GContainer,wsType_Cannon_Cont,WSTYPE_PLACEHOLDER},
	wsTypeOfWeapon	= 	{wsType_Weapon, wsType_GContainer, wsType_Cannon_Cont, wsType_DEFA553_R},
	Picture			=	"MB339-DEFA.png",
	displayName		=	_("GunPod DEFA553"),--_("DEFA-553-R"), --nome nel loadout editor
	Weight			=	190,
	Cx_pil			=	0.001220703125/2,
	Elements  		= {{ShapeName = "MB339-DEFA553_R"}},
	kind_of_shipping = 2,--SOLID_MUNITION
	gun_mounts		= {
			DEFA_553R({
			muzzle_pos_connector = "Point_Gun_DEFA-R",
			--ejector_pos_connector = "ejector_DEFA-R",
			ejector_pos = {-2.25, -0.22, 0.095},
			supply_position = {2, -0.3, -0.4}})
			},
	shape_table_data = {{file  	 = 'MB339-DEFA553_R';	username = 'DEFA-553-R';index    =  WSTYPE_PLACEHOLDER;}}
})
