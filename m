Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDB3E8C66;
	Wed, 25 Mar 2026 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467816; cv=none; b=ui4m/yy3OCkKoVA3SDr0nKAQDk840z6xousdyxhVb3VUrn+4pckZVo7d+nX42bZfg77k85xb69D6eWLLgqNnUMThdpSYb6W/yF2N21Sr7TZrtWEE4y9Pf2gPdbj/xEMk5LT4Wpd2NeGo2Kb/kpCKLJpy/fqEn8jFQpEq5suI3hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467816; c=relaxed/simple;
	bh=rYgsNbdWUy7p1aot6oXS/5j4DhaHYPzXO39UqVlBtTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUaOiLzA6tPdzAe1h2FGnPOjc7lEh9qjuRTXXFxmYEDYj+kqtgVkxUG0uQqAH3PgoybhSZ1ZlPQM+LpoHLDRMY2EBKmbeZXq7Qfnf1gOUiw+c2Keskk3fSMA+n6W5ZDttTn++HvIZ1AFdrffIbCmrcyxEX5lSTOaLYfmOVAg9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmHM42yS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmHM42yS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774467812; x=1806003812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rYgsNbdWUy7p1aot6oXS/5j4DhaHYPzXO39UqVlBtTk=;
  b=mmHM42ySTaGZnqqRBJTREw+bmNH8S6NX2QYdpyAU5kuI4hFFccUE75lk
   zGHKiiiSjcKyWC5fft1P3Dd/e7tOWHtTnaOirynJN2n+LN3Bxecz24KMK
   byZ58T9cMI2B5Pf0XBKzbeMZAXJQHD2PS27CdpYv8KDa+NVcDBvF5PJGA
   +jTTYioqIOhzM9RI2jIrEFK2dZrfDalC37CPpjVTJi2ODS++XaICoN/hw
   h6Gyx4Nfs+F8F1oo/+pgkgaN+64L3mnm6r+eIyh7PSgkHKp04DVF5FasQ
   wHpEGia+SRN8R4puh0gJpnou1G203od40ymyqRxR8n3b62aeJrBnFTB23
   g==;
X-CSE-ConnectionGUID: 0ZXqgAfrRbSTi3Yfbq1CIw==
X-CSE-MsgGUID: ty14kjGEQF6ymAVMDLZLRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75402420"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75402420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:43:32 -0700
X-CSE-ConnectionGUID: ifk88IbyS7Kr1yPKwJUlPA==
X-CSE-MsgGUID: 4I7rBnVYTMq9+A03FZt5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="247810784"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2026 12:43:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5U8U-000000007bn-1Iku;
	Wed, 25 Mar 2026 19:43:26 +0000
Date: Thu, 26 Mar 2026 03:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
Message-ID: <202603260302.X0NjQOda-lkp@intel.com>
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324221032.1333636-9-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
base:   linus/master
patch link:    https://lore.kernel.org/r/20260324221032.1333636-9-derekjohn.clark%40gmail.com
patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
config: x86_64-randconfig-005-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260302.X0NjQOda-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260302.X0NjQOda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lwmi_om_fan_get_set':
>> drivers/platform/x86/lenovo/wmi-other.c:206:(.text+0x1b74542): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `lwmi_attr_01_is_supported':
   drivers/platform/x86/lenovo/wmi-other.c:1267:(.text+0x1b74fdf): undefined reference to `lwmi_attr_id'
>> ld: drivers/platform/x86/lenovo/wmi-other.c:1270:(.text+0x1b75013): undefined reference to `lwmi_cd01_get_data'
>> ld: drivers/platform/x86/lenovo/wmi-other.c:1283:(.text+0x1b7515b): undefined reference to `lwmi_attr_id'
   ld: drivers/platform/x86/lenovo/wmi-other.c:1299:(.text+0x1b752f4): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd_fan':
>> drivers/platform/x86/lenovo/wmi-other.c:565:(.text+0x1b75ca3): undefined reference to `lwmi_cd_fan_get_data'
   ld: vmlinux.o: in function `lwmi_psy_prop_is_writeable':
   drivers/platform/x86/lenovo/wmi-other.c:687:(.text+0x1b75e2f): undefined reference to `lwmi_attr_id'
>> ld: drivers/platform/x86/lenovo/wmi-other.c:690:(.text+0x1b75e5a): undefined reference to `lwmi_cd00_get_data'
   ld: vmlinux.o: in function `lwmi_psy_ext_set_prop':
   drivers/platform/x86/lenovo/wmi-other.c:649:(.text+0x1b75f9b): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `lwmi_psy_ext_get_prop':
   drivers/platform/x86/lenovo/wmi-other.c:603:(.text+0x1b761aa): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `lwmi_other_probe':
>> drivers/platform/x86/lenovo/wmi-other.c:1612:(.text+0x1b764eb): undefined reference to `lwmi_cd_match_add_all'
   ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd00':
   drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b7680f): undefined reference to `lwmi_attr_id'
   ld: drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b76838): undefined reference to `lwmi_cd00_get_data'
   ld: vmlinux.o: in function `lwmi_om_ps_ext_init':
>> drivers/platform/x86/lenovo/wmi-other.c:806:(.text+0x1b76a57): undefined reference to `devm_battery_hook_register'
   ld: vmlinux.o: in function `lwmi_om_fw_attr_add':
>> drivers/platform/x86/lenovo/wmi-other.c:1474:(.text+0x1b76afa): undefined reference to `firmware_attributes_class'
   ld: vmlinux.o: in function `attr_current_value_show':
   drivers/platform/x86/lenovo/wmi-other.c:1225:(.text+0x1b77015): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `attr_current_value_store':
   drivers/platform/x86/lenovo/wmi-other.c:1165:(.text+0x1b776e2): undefined reference to `lwmi_attr_id'
   ld: drivers/platform/x86/lenovo/wmi-other.c:1168:(.text+0x1b7771c): undefined reference to `lwmi_cd01_get_data'
   ld: drivers/platform/x86/lenovo/wmi-other.c:1179:(.text+0x1b7781e): undefined reference to `lwmi_attr_id'
   ld: vmlinux.o: in function `attr_capdata01_show':
   drivers/platform/x86/lenovo/wmi-other.c:1099:(.text+0x1b77e38): undefined reference to `lwmi_attr_id'
   ld: drivers/platform/x86/lenovo/wmi-other.c:1102:(.text+0x1b77e67): undefined reference to `lwmi_cd01_get_data'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING
   Depends on [m]: X86_PLATFORM_DEVICES [=y] && ACPI_WMI [=y] && ACPI_BATTERY [=m]
   Selected by [y]:
   - LENOVO_WMI_GAMEZONE [=y] && X86_PLATFORM_DEVICES [=y] && ACPI_WMI [=y] && DMI [=y]


vim +206 drivers/platform/x86/lenovo/wmi-other.c

51ed34282f63fa Rong Zhang 2026-01-21  186  
51ed34282f63fa Rong Zhang 2026-01-21  187  /**
51ed34282f63fa Rong Zhang 2026-01-21  188   * lwmi_om_fan_get_set() - Get or set fan RPM value of specified fan
51ed34282f63fa Rong Zhang 2026-01-21  189   * @priv: Driver private data structure
51ed34282f63fa Rong Zhang 2026-01-21  190   * @channel: Fan channel index (0-based)
51ed34282f63fa Rong Zhang 2026-01-21  191   * @val: Pointer to value (input for set, output for get)
51ed34282f63fa Rong Zhang 2026-01-21  192   * @set: True to set value, false to get value
51ed34282f63fa Rong Zhang 2026-01-21  193   *
51ed34282f63fa Rong Zhang 2026-01-21  194   * Communicates with WMI interface to either retrieve current fan RPM
51ed34282f63fa Rong Zhang 2026-01-21  195   * or set target fan RPM.
51ed34282f63fa Rong Zhang 2026-01-21  196   *
51ed34282f63fa Rong Zhang 2026-01-21  197   * Return: 0 on success, or an error code.
51ed34282f63fa Rong Zhang 2026-01-21  198   */
51ed34282f63fa Rong Zhang 2026-01-21  199  static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
51ed34282f63fa Rong Zhang 2026-01-21  200  {
51ed34282f63fa Rong Zhang 2026-01-21  201  	struct wmi_method_args_32 args;
51ed34282f63fa Rong Zhang 2026-01-21  202  	u32 method_id, retval;
51ed34282f63fa Rong Zhang 2026-01-21  203  	int err;
51ed34282f63fa Rong Zhang 2026-01-21  204  
51ed34282f63fa Rong Zhang 2026-01-21  205  	method_id = set ? LWMI_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
51ed34282f63fa Rong Zhang 2026-01-21 @206  	args.arg0 = LWMI_ATTR_ID_FAN_RPM(channel);
51ed34282f63fa Rong Zhang 2026-01-21  207  	args.arg1 = set ? *val : 0;
51ed34282f63fa Rong Zhang 2026-01-21  208  
51ed34282f63fa Rong Zhang 2026-01-21  209  	err = lwmi_dev_evaluate_int(priv->wdev, 0x0, method_id,
51ed34282f63fa Rong Zhang 2026-01-21  210  				    (unsigned char *)&args, sizeof(args), &retval);
51ed34282f63fa Rong Zhang 2026-01-21  211  	if (err)
51ed34282f63fa Rong Zhang 2026-01-21  212  		return err;
51ed34282f63fa Rong Zhang 2026-01-21  213  
51ed34282f63fa Rong Zhang 2026-01-21  214  	if (!set) {
51ed34282f63fa Rong Zhang 2026-01-21  215  		*val = retval;
51ed34282f63fa Rong Zhang 2026-01-21  216  		return 0;
51ed34282f63fa Rong Zhang 2026-01-21  217  	}
51ed34282f63fa Rong Zhang 2026-01-21  218  
51ed34282f63fa Rong Zhang 2026-01-21  219  	/*
51ed34282f63fa Rong Zhang 2026-01-21  220  	 * It seems that 0 means "no error" and 1 means "done". Apparently
51ed34282f63fa Rong Zhang 2026-01-21  221  	 * different firmware teams have different thoughts on indicating
51ed34282f63fa Rong Zhang 2026-01-21  222  	 * success, so we accepts both.
51ed34282f63fa Rong Zhang 2026-01-21  223  	 */
51ed34282f63fa Rong Zhang 2026-01-21  224  	return (retval == 0 || retval == 1) ? 0 : -EIO;
51ed34282f63fa Rong Zhang 2026-01-21  225  }
51ed34282f63fa Rong Zhang 2026-01-21  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
