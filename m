Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BB14BF92;
	Sun, 25 Jan 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769353041; cv=none; b=YpYfhoJH0OLdLnsyFjwnMiU3gV81vy/3G6IMncrs6P46g89iwQTENN574seUK90Zt8hbpC2htZU+Yd4usSY4oPuHwgtoq3TZZiEwSuiUca+Ia/A+sTCXjRGMJzIJ2e/GuruTWWNm9jWUd3NxwmkKYfTEEVZ68h4YvjMEMR28rn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769353041; c=relaxed/simple;
	bh=PlNy1KMzSkSE4PyLuRAnXo5oOT+6G790j2S1tkksx/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp/OKSx/VMmigIg0yOPMhac5+olegBcIKE33g4ZbEA3tvoR8kYIwvYqGzURx11oAzJqk8wHfeBtS2JzFOl7Ul2CDHxR3dfMz7ab2Si6jb+TtFQMV2NA25qVMH9vedLztNX4mUNLf5PpYUZnz20Lv7qYWoWU4XgdneJGdPIze+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnvHW7uv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnvHW7uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769353039; x=1800889039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PlNy1KMzSkSE4PyLuRAnXo5oOT+6G790j2S1tkksx/U=;
  b=gnvHW7uv/uB5uFsL2firlVLM534cla34tlofhnZUiXAB0aaVpkoK4Pvm
   azsY94tbU5xVrMqG0aIgn9RX39YugiS5deZuafDM70kJRZlaP2ARuSF4H
   HvQi02mm9WLS4Me7ld7dplVRl0mVpm7KbuBmO4AHfDW1DAgPvEpATuM1W
   +tX9vuv7xhD/Y0U5zkZXBE5CXiP6lmbL0cliKMiG8r9TaAPGMBv09TK0k
   B95sEUrdolYDnS6EpnsrsKqCSLVkSYoppR8QWQIPtL6onLAurWWyCst3K
   GUpA8cSaCJ9Om65mn6Ux7HLI5LN3SH5DZxC9HQ5XXfBhoVuL2RuuniqPC
   w==;
X-CSE-ConnectionGUID: BiIbpDgHQAyvRwsYki2png==
X-CSE-MsgGUID: tRV87ng3TiKtcqvaoXR92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70602959"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70602959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 06:57:19 -0800
X-CSE-ConnectionGUID: 1xoSAxLEQ4K53lEXsRKdUw==
X-CSE-MsgGUID: rpuhvLHmTRaveEEkXdgZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207073804"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 06:57:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1Y1-00000000W5q-37at;
	Sun, 25 Jan 2026 14:57:05 +0000
Date: Sun, 25 Jan 2026 22:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, cryolitia.pukngae@linux.dev,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v4] platform/x86: tongfang-mifs-wmi: Add new Tongfang
 MIFS WMI driver
Message-ID: <202601252202.qioPfCgA-lkp@intel.com>
References: <20260125094422.6405-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125094422.6405-1-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/platform-x86-tongfang-mifs-wmi-Add-new-Tongfang-MIFS-WMI-driver/20260125-174727
base:   linus/master
patch link:    https://lore.kernel.org/r/20260125094422.6405-1-qby140326%40gmail.com
patch subject: [PATCH v4] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260125/202601252202.qioPfCgA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252202.qioPfCgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252202.qioPfCgA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/tongfang-mifs-wmi.c: In function 'tongfang_mifs_wmi_call':
>> drivers/platform/x86/tongfang-mifs-wmi.c:143:27: error: storage size of 'in_buf' isn't known
     143 |         struct wmi_buffer in_buf, out_buf;
         |                           ^~~~~~
>> drivers/platform/x86/tongfang-mifs-wmi.c:143:35: error: storage size of 'out_buf' isn't known
     143 |         struct wmi_buffer in_buf, out_buf;
         |                                   ^~~~~~~
>> drivers/platform/x86/tongfang-mifs-wmi.c:156:15: error: implicit declaration of function 'wmidev_invoke_method'; did you mean 'wmidev_evaluate_method'? [-Wimplicit-function-declaration]
     156 |         ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf,
         |               ^~~~~~~~~~~~~~~~~~~~
         |               wmidev_evaluate_method
>> drivers/platform/x86/tongfang-mifs-wmi.c:143:35: warning: unused variable 'out_buf' [-Wunused-variable]
     143 |         struct wmi_buffer in_buf, out_buf;
         |                                   ^~~~~~~
>> drivers/platform/x86/tongfang-mifs-wmi.c:143:27: warning: unused variable 'in_buf' [-Wunused-variable]
     143 |         struct wmi_buffer in_buf, out_buf;
         |                           ^~~~~~
   drivers/platform/x86/tongfang-mifs-wmi.c: In function 'laptop_profile_set':
>> drivers/platform/x86/tongfang-mifs-wmi.c:240:21: warning: this statement may fall through [-Wimplicit-fallthrough=]
     240 |                 val = WMI_PP_PERFORMANCE;
         |                 ~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/tongfang-mifs-wmi.c:241:9: note: here
     241 |         case PLATFORM_PROFILE_PERFORMANCE:
         |         ^~~~


vim +143 drivers/platform/x86/tongfang-mifs-wmi.c

   138	
   139	static int tongfang_mifs_wmi_call(struct tongfang_mifs_wmi_data *data,
   140					  const struct tongfang_mifs_input *input,
   141					  struct tongfang_mifs_output *output)
   142	{
 > 143		struct wmi_buffer in_buf, out_buf;
   144		int ret;
   145	
   146		guard(mutex)(&data->lock);
   147	
   148		in_buf.length = sizeof(*input);
   149		in_buf.data = (void *)input;
   150	
   151		if (output) {
   152			out_buf.length = sizeof(*output);
   153			out_buf.data = output;
   154		}
   155	
 > 156		ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf,
   157					   output ? &out_buf : NULL);
   158	
   159		return ret;
   160	}
   161	
   162	static bool is_ac_online(void)
   163	{
   164		struct power_supply *psy;
   165		union power_supply_propval val;
   166		bool online = false;
   167	
   168		psy = power_supply_get_by_name("ADP1");
   169		if (!psy)
   170			return false;
   171	
   172		if (!power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE, &val))
   173			online = (val.intval == 1);
   174	
   175		power_supply_put(psy);
   176		return online;
   177	}
   178	
   179	static int laptop_profile_get(struct device *dev,
   180				      enum platform_profile_option *profile)
   181	{
   182		struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
   183		struct tongfang_mifs_input input = {
   184			.reserved1 = 0,
   185			.operation = WMI_METHOD_GET,
   186			.reserved2 = 0,
   187			.function = WMI_FN_SYSTEM_PER_MODE,
   188		};
   189		struct tongfang_mifs_output result;
   190		int ret;
   191	
   192		ret = tongfang_mifs_wmi_call(data, &input, &result);
   193	
   194		if (ret)
   195			return ret;
   196	
   197		switch (result.data[0]) {
   198		case WMI_PP_BALANCED:
   199			*profile = PLATFORM_PROFILE_BALANCED;
   200			break;
   201		case WMI_PP_PERFORMANCE:
   202			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
   203			break;
   204		case WMI_PP_QUIET:
   205			*profile = PLATFORM_PROFILE_LOW_POWER;
   206			break;
   207		case WMI_PP_FULL_SPEED:
   208			*profile = PLATFORM_PROFILE_PERFORMANCE;
   209			break; /* Fullspeed */
   210		default:
   211			return -EINVAL;
   212		}
   213		return 0;
   214	}
   215	
   216	
   217	static int laptop_profile_set(struct device *dev,
   218				      enum platform_profile_option profile)
   219	{
   220		struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
   221		struct tongfang_mifs_input input = {
   222			.reserved1 = 0,
   223			.operation = WMI_METHOD_SET,
   224			.reserved2 = 0,
   225			.function = WMI_FN_SYSTEM_PER_MODE,
   226		};
   227		struct tongfang_mifs_output ac_type_res;
   228	
   229		u8 val;
   230		int ret;
   231	
   232		switch (profile) {
   233		case PLATFORM_PROFILE_LOW_POWER:
   234			val = WMI_PP_QUIET;
   235			break;
   236		case PLATFORM_PROFILE_BALANCED:
   237			val = WMI_PP_BALANCED;
   238			break;
   239		case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
 > 240			val = WMI_PP_PERFORMANCE;
   241		case PLATFORM_PROFILE_PERFORMANCE:
   242			/* Check if Typec power is not connected for full-speed/performance mode */
   243			input.operation = WMI_METHOD_GET;
   244			input.function = WMI_FN_SYSTEM_AC_TYPE;
   245			ret = tongfang_mifs_wmi_call(data, &input, &ac_type_res);
   246			if (ret)
   247				return ret;
   248	
   249			/* Full-speed/performance mode requires DC power (not USB-C) */
   250			if (ac_type_res.data[0] == WMI_SYSTEM_AC_TYPEC || !is_ac_online())
   251				return -EOPNOTSUPP;
   252	
   253			if (!val)
   254				val = WMI_PP_FULL_SPEED;
   255	
   256			/* Restore operation and function for the actual SET call */
   257			input.operation = WMI_METHOD_SET;
   258			input.function = WMI_FN_SYSTEM_PER_MODE;
   259			break;
   260		default:
   261			return -EOPNOTSUPP;
   262		}
   263	
   264		input.payload[0] = val;
   265	
   266		ret = tongfang_mifs_wmi_call(data, &input, NULL);
   267		return ret;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
