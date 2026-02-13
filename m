Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D12857FA;
	Fri, 13 Feb 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010809; cv=none; b=rL6eFf0qDZfSYapoNuUxEqFQKgm0h73c5X112xea0YX4QhM4dLuV5d+Y53Nyciu6dS2x6ICBdbIvwkNmuujS0a6AbSv9AbT1xyhziE3Pcuyz9s+2arcXAlA4KfgYdLpLDCIwm4Cve7pVsymtIjcb3sjRaKKWw0UcpVH29Yn9yYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010809; c=relaxed/simple;
	bh=WeceQRIeyxqSKayYLb09tilArUTubzmnTCzfo0fONAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPQ1wZIiE15P5MPc6i4mcf2FTIkkNnijvCrVto4AjX9g4qEyWTycRiZDQTQiMU7MBO6iWe7dwIfRHHLStqsLWwcC8l195A3D1qeUODDH8gBl4c2V6nxcxNrbwTmVfCTj4cQWBD3mtErOa8jxhs6N5mSWLuvv+HApC3W+Iz6fZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDjzIofA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDjzIofA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771010807; x=1802546807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WeceQRIeyxqSKayYLb09tilArUTubzmnTCzfo0fONAc=;
  b=MDjzIofAguZCLTjTn5m1srd9wK1N5GY7pZFg//jojZUJIpt7+dfTVH6Y
   h5e3jYBeiyeTNe+Gvwm3XqP+rXFZWCvL3XXYjE35hJxB0XtwZhlXWyXkV
   xQzue6ql7TsQbulzb8HocVVQxjRmWmE2DNkpABkqKnvQXyTgBBSaAC00t
   J5t6l8lXyrfmUaXCAa2wvidQIUKv4Jrpnf0Q0JZFiv6Vv51BshbYFsa40
   T4GDdx9Bf6GhGBFSS2iPgMjF55T40OR6rMSKfCZJplM0K8Cy47oYR/EFa
   wscizdo47FEYFZH6UuokVNqVKxukPsvbzTS5fJ5XgmYaJlMyRrCgl7tAZ
   Q==;
X-CSE-ConnectionGUID: sS9mMq7GTzq3HWFlhQiXfw==
X-CSE-MsgGUID: hTiAqyPuSDKFxh9KG+EtpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83566133"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83566133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 11:26:46 -0800
X-CSE-ConnectionGUID: YFUeTU9XRYKeGNoFB10LYw==
X-CSE-MsgGUID: 9ZUHMaDUTCugSwXjppkG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212096873"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2026 11:26:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqyoK-00000000vmC-1FSs;
	Fri, 13 Feb 2026 19:26:40 +0000
Date: Sat, 14 Feb 2026 03:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: lenovo-wmi-other: Add GPU tunable
 attributes
Message-ID: <202602140321.pfFQKWKX-lkp@intel.com>
References: <20260213081243.794288-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213081243.794288-5-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260212]
[cannot apply to linus/master v6.19 v6.19-rc8 v6.19-rc7 v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Add-LWMI_ATTR_ID-Macro/20260213-161603
base:   next-20260212
patch link:    https://lore.kernel.org/r/20260213081243.794288-5-derekjohn.clark%40gmail.com
patch subject: [PATCH 4/5] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
config: x86_64-randconfig-011-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140321.pfFQKWKX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140321.pfFQKWKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140321.pfFQKWKX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/lenovo/wmi-other.c:1202:1: warning: unused variable 'gpu_mode_attr_group' [-Wunused-const-variable]
    1202 | LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1203 |                               "Set the GPU mode by power limit");
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/lenovo/wmi-other.c:1155:38: note: expanded from macro 'LWMI_ATTR_GROUP_TUNABLE_CAP01'
    1155 |         static const struct attribute_group _attrname##_attr_group = {    \
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:155:1: note: expanded from here
     155 | gpu_mode_attr_group
         | ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/gpu_mode_attr_group +1202 drivers/platform/x86/lenovo/wmi-other.c

  1081	
  1082	/* Lenovo WMI Other Mode Attribute macros */
  1083	#define __LWMI_ATTR_RO(_func, _name)                                  \
  1084		{                                                             \
  1085			.attr = { .name = __stringify(_name), .mode = 0444 }, \
  1086			.show = _func##_##_name##_show,                       \
  1087		}
  1088	
  1089	#define __LWMI_ATTR_RO_AS(_name, _show)                               \
  1090		{                                                             \
  1091			.attr = { .name = __stringify(_name), .mode = 0444 }, \
  1092			.show = _show,                                        \
  1093		}
  1094	
  1095	#define __LWMI_ATTR_RW(_func, _name) \
  1096		__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
  1097	
  1098	/* Shows a formatted static variable */
  1099	#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                     \
  1100		static ssize_t _attrname##_##_prop##_show(                             \
  1101			struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
  1102		{                                                                      \
  1103			return sysfs_emit(buf, _fmt, _val);                            \
  1104		}                                                                      \
  1105		static struct kobj_attribute attr_##_attrname##_##_prop =              \
  1106			__LWMI_ATTR_RO(_attrname, _prop)
  1107	
  1108	/* Attribute current value read/write */
  1109	#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                          \
  1110		static ssize_t _attrname##_current_value_store(                        \
  1111			struct kobject *kobj, struct kobj_attribute *kattr,            \
  1112			const char *buf, size_t count)                                 \
  1113		{                                                                      \
  1114			return attr_current_value_store(kobj, kattr, buf, count,       \
  1115							&_attrname);                   \
  1116		}                                                                      \
  1117		static ssize_t _attrname##_current_value_show(                         \
  1118			struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
  1119		{                                                                      \
  1120			return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
  1121		}                                                                      \
  1122		static struct kobj_attribute attr_##_attrname##_current_value =        \
  1123			__LWMI_ATTR_RW(_attrname, current_value)
  1124	
  1125	/* Attribute property read only */
  1126	#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                  \
  1127		static ssize_t _attrname##_##_prop##_show(                             \
  1128			struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
  1129		{                                                                      \
  1130			return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
  1131						   _prop_type);                        \
  1132		}                                                                      \
  1133		static struct kobj_attribute attr_##_attrname##_##_prop =              \
  1134			__LWMI_ATTR_RO(_attrname, _prop)
  1135	
  1136	#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)      \
  1137		__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
  1138		__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
  1139		__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
  1140		__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
  1141		__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
  1142		__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
  1143		static struct kobj_attribute attr_##_attrname##_type =            \
  1144			__LWMI_ATTR_RO_AS(type, int_type_show);                   \
  1145		static struct attribute *_attrname##_attrs[] = {                  \
  1146			&attr_##_attrname##_current_value.attr,                   \
  1147			&attr_##_attrname##_default_value.attr,                   \
  1148			&attr_##_attrname##_display_name.attr,                    \
  1149			&attr_##_attrname##_max_value.attr,                       \
  1150			&attr_##_attrname##_min_value.attr,                       \
  1151			&attr_##_attrname##_scalar_increment.attr,                \
  1152			&attr_##_attrname##_type.attr,                            \
  1153			NULL,                                                     \
  1154		};                                                                \
  1155		static const struct attribute_group _attrname##_attr_group = {    \
  1156			.name = _fsname, .attrs = _attrname##_attrs               \
  1157		}
  1158	
  1159	/* CPU tunable attributes */
  1160	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
  1161				      "Set the CPU sustained power limit");
  1162	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
  1163				      "Set the CPU cross loading sustained power limit");
  1164	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
  1165				      "Set the CPU slow package power tracking limit");
  1166	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
  1167				      "Set the CPU cross loading slow package power tracking limit");
  1168	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
  1169				      "Set the CPU fast package power tracking limit");
  1170	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
  1171				      "Set the CPU cross loading fast package power tracking limit");
  1172	LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
  1173				      "Set the CPU thermal load limit");
  1174	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
  1175				      "Set the APU sustained power limit");
  1176	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
  1177				      "Set the CPU cross loading power limit");
  1178	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
  1179				      "Set the CPU sustained power limit exceed duration");
  1180	LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_oc_stat, "cpu_oc_stat",
  1181				      "Set the CPU overclocking status");
  1182	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
  1183				      "Set the CPU instantaneous power limit");
  1184	LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
  1185				      "Set the CPU cross loading instantaneous power limit");
  1186	
  1187	/* GPU tunable attributes */
  1188	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
  1189				      "Set the Nvidia GPU power performance aware boost limit");
  1190	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
  1191				      "Set the GPU configurable total graphics power");
  1192	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
  1193				      "Set the GPU thermal load limit");
  1194	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
  1195				      "Set the Nvidia GPU AC total processing power baseline offset");
  1196	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_oc_stat, "gpu_oc_stat",
  1197				      "Set the GPU overclocking status");
  1198	LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
  1199				      "Set the dedicated GPU boost clock");
  1200	LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
  1201				      "Set the dedicated Nvidia GPU enabled status");
> 1202	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
  1203				      "Set the GPU mode by power limit");
  1204	LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
  1205				      "Get the GPU device identifier and vendor identifier");
  1206	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
  1207				      "Set the Nvidia GPU base power limit");
  1208	LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
  1209				      "Set the Nvidia GPU to CPU dynamic boost limit");
  1210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
