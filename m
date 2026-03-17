Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4F388E59;
	Tue, 17 Mar 2026 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779506; cv=none; b=ICRTKQwOIBo8fYeUNOCd57kQWaYRo53bdDnRrR6bsdHSGcBO3Epr47vOM3t3Qvy4wMvZIFty4pvPnLgaKnIkUNkEyt1mqnV+5fZNdGrlRJ5OqX+05mtpPTYl6KMZPSMQ3tEhPqTLjy29VT73cCBcPil0vmMLuD6j6vc7hd4Unbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779506; c=relaxed/simple;
	bh=Po1ovuTZN5E7jhJSkWPq6gVqiTLmasov11Wz/ZmB0I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbNN/TPsfb8LfPDzr3V+SHcPj3CLkM9o3bZJy3hjUgLr72WzzI+ClvU1oS+6ma9Zi/xaqZtPNE1jky35BSumdQno4wySClCVPATLpV+TXte+QAwVqmSdwqQnMszyLDTAQbLmwrRoU0e+mKQtHfy/h+I/X3GYNzmFVG5F1NZWCwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVAZuA9t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVAZuA9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773779503; x=1805315503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Po1ovuTZN5E7jhJSkWPq6gVqiTLmasov11Wz/ZmB0I0=;
  b=GVAZuA9toMT7aYPreM69iUgjZYwvP8PXOdpJCu0NoV9UbY/FvgUo7/1g
   h3awKBTz20rXh15nQRUhfwEJHGwMCQUmekt9D/oYPR1GokgWCTSY6nq/I
   iN9cWMAMW2/RVYayYG/eou9/jaRZPCtBU5KiG2O4pk7zbtEsntdmSt1iq
   1VPQJ2V8z0NDaaGJXAXdUBRY2QBS4H/xiV5Y8NGK8UjzFsZjjgmJbJCQS
   CD3pLdRTMBJXq2Rn+3JhNGBRSMrlBBMB85s/lDnzX68PKAq3f3dXH6Eoe
   bQCJgPUoHBUgDlXf2rMExcmbXr/yWuXxHCXOtw90PvvjBA0xbo2vUhISo
   A==;
X-CSE-ConnectionGUID: wfTExdHgRX+96er/ussEvw==
X-CSE-MsgGUID: ketGQFlqRFeKw6mNK3HI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85456540"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85456540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:31:43 -0700
X-CSE-ConnectionGUID: tPN/+/Q8RrO8v57kd3cQbQ==
X-CSE-MsgGUID: RckWGSokR7usMB9uyKDAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222602565"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 13:31:41 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2b4j-000000001xZ-2TcD;
	Tue, 17 Mar 2026 20:31:37 +0000
Date: Wed, 18 Mar 2026 04:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Grant <jg@jguk.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org, luke@ljones.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
Message-ID: <202603180450.8OGDU2sP-lkp@intel.com>
References: <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Grant/platform-x86-asus-wmi-log-thermal-notification-event/20260316-204950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/94dbe1e1-d706-47aa-abf5-f5d76aacf017%40jguk.org
patch subject: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260318/202603180450.8OGDU2sP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180450.8OGDU2sP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180450.8OGDU2sP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_handle_event_code':
>> drivers/platform/x86/asus-wmi.c:4599:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    4599 |         if (!sparse_keymap_report_event(asus->inputdev, code,
         |            ^


vim +/else +4599 drivers/platform/x86/asus-wmi.c

8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4538  
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4539  static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4540  {
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4541  	enum led_brightness led_value;
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4542  	unsigned int key_value = 1;
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4543  	bool autorelease = 1;
3d7b165539d417 drivers/platform/x86/eeepc-wmi.c Yong Wang           2010-04-11  4544  
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4545  	if (asus->driver->key_filter) {
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4546  		asus->driver->key_filter(asus->driver, &code, &key_value,
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4547  					 &autorelease);
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4548  		if (code == ASUS_WMI_KEY_IGNORE)
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4549  			return;
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4550  	}
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4551  
a5b92be2482e5f drivers/platform/x86/asus-wmi.c  Hans de Goede       2023-10-17  4552  	if (acpi_video_get_backlight_type() == acpi_backlight_vendor &&
a5b92be2482e5f drivers/platform/x86/asus-wmi.c  Hans de Goede       2023-10-17  4553  	    code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNDOWN_MAX) {
a5b92be2482e5f drivers/platform/x86/asus-wmi.c  Hans de Goede       2023-10-17  4554  		asus_wmi_backlight_notify(asus, code);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4555  		return;
a2a96f0c722180 drivers/platform/x86/asus-wmi.c  AceLan Kao          2012-10-03  4556  	}
a2a96f0c722180 drivers/platform/x86/asus-wmi.c  AceLan Kao          2012-10-03  4557  
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4558  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4559  		led_value = asus->kbd_led_wk;
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4560  
dbb3d78f61bade drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4561  	if (code == NOTIFY_KBD_BRTUP) {
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4562  		kbd_led_set_by_kbd(asus, led_value + 1);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4563  		return;
dbb3d78f61bade drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4564  	}
dbb3d78f61bade drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4565  	if (code == NOTIFY_KBD_BRTDWN) {
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4566  		kbd_led_set_by_kbd(asus, led_value - 1);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4567  		return;
dbb3d78f61bade drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4568  	}
ed99d29b2b1562 drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4569  	if (code == NOTIFY_KBD_BRTTOGGLE) {
7525566abd360c drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4570  		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
29f6eb533c3be9 drivers/platform/x86/asus-wmi.c  Jian-Hong Pan       2018-10-22  4571  			kbd_led_set_by_kbd(asus, 0);
ed99d29b2b1562 drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4572  		else
fac55d29581fcd drivers/platform/x86/asus-wmi.c  Antheas Kapenekakis 2026-01-22  4573  			kbd_led_set_by_kbd(asus, led_value + 1);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4574  		return;
ed99d29b2b1562 drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4575  	}
dbb3d78f61bade drivers/platform/x86/asus-wmi.c  Chris Chiu          2018-06-20  4576  
487579bab867e7 drivers/platform/x86/asus-wmi.c  Chris Chiu          2019-04-18  4577  	if (code == NOTIFY_FNLOCK_TOGGLE) {
487579bab867e7 drivers/platform/x86/asus-wmi.c  Chris Chiu          2019-04-18  4578  		asus->fnlock_locked = !asus->fnlock_locked;
487579bab867e7 drivers/platform/x86/asus-wmi.c  Chris Chiu          2019-04-18  4579  		asus_wmi_fnlock_update(asus);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4580  		return;
487579bab867e7 drivers/platform/x86/asus-wmi.c  Chris Chiu          2019-04-18  4581  	}
487579bab867e7 drivers/platform/x86/asus-wmi.c  Chris Chiu          2019-04-18  4582  
1ea0d3b46798af drivers/platform/x86/asus-wmi.c  Hans de Goede       2022-08-24  4583  	if (code == asus->tablet_switch_event_code) {
1ea0d3b46798af drivers/platform/x86/asus-wmi.c  Hans de Goede       2022-08-24  4584  		asus_wmi_tablet_mode_get_state(asus);
e397c3c460bf38 drivers/platform/x86/asus-wmi.c  Luke D. Jones       2022-08-13  4585  		return;
e397c3c460bf38 drivers/platform/x86/asus-wmi.c  Luke D. Jones       2022-08-13  4586  	}
e397c3c460bf38 drivers/platform/x86/asus-wmi.c  Luke D. Jones       2022-08-13  4587  
601eb4c8e15002 drivers/platform/x86/asus-wmi.c  Luke D. Jones       2022-08-26  4588  	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
601eb4c8e15002 drivers/platform/x86/asus-wmi.c  Luke D. Jones       2022-08-26  4589  		if (asus->fan_boost_mode_available)
9af93db9e140a4 drivers/platform/x86/asus-wmi.c  Daniel Drake        2019-07-17  4590  			fan_boost_mode_switch_next(asus);
bcbfcebda2cbc6 drivers/platform/x86/asus-wmi.c  Mohamed Ghanmi      2024-06-09  4591  		if (asus->throttle_thermal_policy_dev)
b0955ce555478e drivers/platform/x86/asus-wmi.c  Armin Wolf          2024-11-07  4592  			platform_profile_cycle();
2daa86e78c494d drivers/platform/x86/asus-wmi.c  Leonid Maksymchuk   2019-12-15  4593  		return;
2daa86e78c494d drivers/platform/x86/asus-wmi.c  Leonid Maksymchuk   2019-12-15  4594  	}
2daa86e78c494d drivers/platform/x86/asus-wmi.c  Leonid Maksymchuk   2019-12-15  4595  
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4596  	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4597  		return;
a2a96f0c722180 drivers/platform/x86/asus-wmi.c  AceLan Kao          2012-10-03  4598  
a2a96f0c722180 drivers/platform/x86/asus-wmi.c  AceLan Kao          2012-10-03 @4599  	if (!sparse_keymap_report_event(asus->inputdev, code,
c4453f6a7ceff3 drivers/platform/x86/asus-wmi.c  Seth Forshee        2011-07-01  4600  					key_value, autorelease))
2cf4f7ebe37ac2 drivers/platform/x86/asus-wmi.c  Jonathan Grant      2026-03-16  4601  		if (code == NOTIFY_THERMAL)
2cf4f7ebe37ac2 drivers/platform/x86/asus-wmi.c  Jonathan Grant      2026-03-16  4602  			pr_info("Thermal state change\n");
2cf4f7ebe37ac2 drivers/platform/x86/asus-wmi.c  Jonathan Grant      2026-03-16  4603  		else
3e70a57b659463 drivers/platform/x86/asus-wmi.c  Luca Stefani        2022-05-06  4604  			pr_info("Unknown key code 0x%x\n", code);
8abd752bd4733e drivers/platform/x86/asus-wmi.c  Yurii Pavlovskyi    2019-05-14  4605  }
3d7b165539d417 drivers/platform/x86/eeepc-wmi.c Yong Wang           2010-04-11  4606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
