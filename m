Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B5221F0C;
	Fri, 13 Feb 2026 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014591; cv=none; b=nLTmfhqb/tPKJkFKkNsGcwteJBDQj9EDx9fUf4AObjJKUZPaRD8yLoN+xbnM4QXPpd/3opE927VHaLvVlNwU3fv4lEgGR88l9nORpV3ebKkZZWW1emNbWucst4CxCVH2GTGG7tMgV7y9aOUWLXVWwBiqOMJmE7qy+6IOqxPGjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014591; c=relaxed/simple;
	bh=MdCH6WZTVm+iWo48HWRm5dDAmuy5vwlAvFhNnCWqxJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5OPZOLNSekOX0HPWyqdgIG+ZPDS0i/tCAcMTivdgWhZWok99O8rSPPsHJTgSlPCvrtfeHNRZ/bYrP2rw5SLqMUjfG9godF/IXCnOfLqeYEHqScYXLJ20nk/C/XGWWH7ELK8M3MpboB2fi8YXue80B8OfDvJqO6JBLZSbKP0/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+ZAR0qD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+ZAR0qD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771014590; x=1802550590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MdCH6WZTVm+iWo48HWRm5dDAmuy5vwlAvFhNnCWqxJw=;
  b=D+ZAR0qD1oKpl0GFlFW9UB7vLqASd2m61423V2Wfnx0YaZXTlH7LoYgE
   5DgZAm0PcYHkjG37yA1s/pXHxCGq/M8NG+QtD8+Exru65oDtCGkA1aJ7K
   9XlYtxOCI1in5ckU6FbUL7xo+ICLQmSSghVeHpMcQ/T4NaaUWS5hmeD2Z
   5+eEg23ZYHK5gjLAilrPPWCoewY3pSU/17KHEecpD9leqVMswnZuGbzd6
   zuw6kN/vXbO0hRAf1vzjB4ntXdZM98AElkHFJMKzDhY4qkxpg6L5P8yq9
   bPyDz0Ny/C2BontV3rsbntPABTsYebPuSIiz+z8p0VXH6mW5pbxHfR3sG
   Q==;
X-CSE-ConnectionGUID: EjmyeDrQRiCousVP6Pw1qw==
X-CSE-MsgGUID: 1w4T6QgATu+jOKs6M3tNGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89617765"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="89617765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:29:50 -0800
X-CSE-ConnectionGUID: 4IptJvqYSwu5aeOahKdflw==
X-CSE-MsgGUID: P7lO7+aiSuGlmwYsvXUS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213033562"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2026 12:29:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqznK-00000000vo8-2T9R;
	Fri, 13 Feb 2026 20:29:42 +0000
Date: Sat, 14 Feb 2026 04:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: lenovo-wmi-other: Add GPU tunable
 attributes
Message-ID: <202602140438.FqccdLwp-lkp@intel.com>
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
config: i386-randconfig-003-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140438.FqccdLwp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140438.FqccdLwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140438.FqccdLwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/lenovo/wmi-other.c:1202:31: warning: 'gpu_mode_attr_group' defined but not used [-Wunused-const-variable=]
    1202 | LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
         |                               ^~~~~~~~
   drivers/platform/x86/lenovo/wmi-other.c:1155:45: note: in definition of macro 'LWMI_ATTR_GROUP_TUNABLE_CAP01'
    1155 |         static const struct attribute_group _attrname##_attr_group = {    \
         |                                             ^~~~~~~~~


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
