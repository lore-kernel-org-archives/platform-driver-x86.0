Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402A1E9B1A;
	Tue, 17 Mar 2026 17:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768856; cv=none; b=aI+k7ZBc/1yfOArjdKj/954GAMP/GDHOlTf+MVaPDqcBNXgjexPftoUBHVfs8m+fOhpQ2SbMNz1zHJkQs/BmoZnOH/6dHqV4AqXJxrLRljuQDSqq9ijrti49uF/R9x1An69IvCWNbLu+kMTmkZrcYpsAKBDpr7Ulfi6HenCWfWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768856; c=relaxed/simple;
	bh=7ZccMc3Apke0eeN/KclrZzFU2rMsGhi6O8ACatsDWRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPGnNViReBxXckOwkDmYwTdab1kEaBxdO1+4jqZBJaxAxm7mHpKNb/DDMVJSAQX/0KOsqokdKaCWhwqv0wNkUMT8NSdqFdwH83tUYIECK6Mf8botxee7uCpxog/Uu0I77IHXLhGLfh3bBu/LgfPFjRZ1uQ4eybt3mwav+uc+7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb4VmKAf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb4VmKAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773768855; x=1805304855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZccMc3Apke0eeN/KclrZzFU2rMsGhi6O8ACatsDWRc=;
  b=Zb4VmKAfRSFozRN4VDQJxKSbrScDJiB+BButCsaMydE6O/SFaOXwF7dF
   r4cNOvXCEHCZi+XQloUYOyO9xogV6+GhJiDhFzoLOzmSMWlKzYKrH22Nq
   3SDpaGZSWUoNQkcbRlf5WfpQB5J5v16/JuiWiqGWkVVwFSghCj1x8gMiB
   ZixbWwSZB6cVXB3lupqR662ySsaknNcY3SMfvL63ESQ90ZKD6LKLpojdv
   lbart0IaC2ly3qyg5c158abf/TCHl+CEtryoa/J+a7+nxuDI8DdNGTse+
   ZG8X3RthMm37t+MUuXX5SNR8eXsmSlPwWVDXNRlHegpcXsLzKjKjgPYFs
   Q==;
X-CSE-ConnectionGUID: lN6dYW7DR4C62NWZo8Pk5Q==
X-CSE-MsgGUID: 77V98+IbRI+LCIrd345LLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78418971"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78418971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:34:14 -0700
X-CSE-ConnectionGUID: 5z8xt1pQS9qYu7K69/8O9g==
X-CSE-MsgGUID: n5pqkOHfQ92UoeJPAVTtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226805129"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 10:34:12 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2YIz-000000001Yf-2b6m;
	Tue, 17 Mar 2026 17:34:09 +0000
Date: Wed, 18 Mar 2026 01:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Grant <jg@jguk.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org, luke@ljones.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
Message-ID: <202603180137.ePqnMidQ-lkp@intel.com>
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
[also build test WARNING on amd-pstate/bleeding-edge linus/master v7.0-rc4 next-20260316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Grant/platform-x86-asus-wmi-log-thermal-notification-event/20260316-204950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/94dbe1e1-d706-47aa-abf5-f5d76aacf017%40jguk.org
patch subject: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
config: i386-randconfig-014-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180137.ePqnMidQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180137.ePqnMidQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180137.ePqnMidQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/asus-wmi.c:4603:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    4603 |                 else
         |                 ^
   1 warning generated.


vim +4603 drivers/platform/x86/asus-wmi.c

  4538	
  4539	static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
  4540	{
  4541		enum led_brightness led_value;
  4542		unsigned int key_value = 1;
  4543		bool autorelease = 1;
  4544	
  4545		if (asus->driver->key_filter) {
  4546			asus->driver->key_filter(asus->driver, &code, &key_value,
  4547						 &autorelease);
  4548			if (code == ASUS_WMI_KEY_IGNORE)
  4549				return;
  4550		}
  4551	
  4552		if (acpi_video_get_backlight_type() == acpi_backlight_vendor &&
  4553		    code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNDOWN_MAX) {
  4554			asus_wmi_backlight_notify(asus, code);
  4555			return;
  4556		}
  4557	
  4558		scoped_guard(spinlock_irqsave, &asus_ref.lock)
  4559			led_value = asus->kbd_led_wk;
  4560	
  4561		if (code == NOTIFY_KBD_BRTUP) {
  4562			kbd_led_set_by_kbd(asus, led_value + 1);
  4563			return;
  4564		}
  4565		if (code == NOTIFY_KBD_BRTDWN) {
  4566			kbd_led_set_by_kbd(asus, led_value - 1);
  4567			return;
  4568		}
  4569		if (code == NOTIFY_KBD_BRTTOGGLE) {
  4570			if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
  4571				kbd_led_set_by_kbd(asus, 0);
  4572			else
  4573				kbd_led_set_by_kbd(asus, led_value + 1);
  4574			return;
  4575		}
  4576	
  4577		if (code == NOTIFY_FNLOCK_TOGGLE) {
  4578			asus->fnlock_locked = !asus->fnlock_locked;
  4579			asus_wmi_fnlock_update(asus);
  4580			return;
  4581		}
  4582	
  4583		if (code == asus->tablet_switch_event_code) {
  4584			asus_wmi_tablet_mode_get_state(asus);
  4585			return;
  4586		}
  4587	
  4588		if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
  4589			if (asus->fan_boost_mode_available)
  4590				fan_boost_mode_switch_next(asus);
  4591			if (asus->throttle_thermal_policy_dev)
  4592				platform_profile_cycle();
  4593			return;
  4594		}
  4595	
  4596		if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
  4597			return;
  4598	
  4599		if (!sparse_keymap_report_event(asus->inputdev, code,
  4600						key_value, autorelease))
  4601			if (code == NOTIFY_THERMAL)
  4602				pr_info("Thermal state change\n");
> 4603			else
  4604				pr_info("Unknown key code 0x%x\n", code);
  4605	}
  4606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
