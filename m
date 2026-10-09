Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923D3C76BB;
	Fri,  9 Oct 2026 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791589659; cv=none; b=f3bR+tnUF/ZrWmjxwEiEX3PioZTrgopak+PBqHt3YHGZUtZxwewS8/D1Gylvm5UVXuqhW0xrfIDmkDZknHzH60jkjTJYj1RhX8XjHEjTzfJAwOdF+qC8YdY/TvsTz1MgQWiWREmEcjEgpBUvFyh9pzyYhwzj3Gb3w6XFUSfxiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791589659; c=relaxed/simple;
	bh=UfidYsMrS2AZJjq01I4nSaYvHJ0OqaRHS+Q1SPK+kjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb9eeW3ks8ofu5VRkqECapuLynpU32MuOlWBanVigXVAxifdkFwSzCxTf1cImvf5a/c4wFTs3b1/KLFKt+reT/TNvLhOGMrhk5710izPQhNk7YClkGDWTIe5n55Fluak1aw6c3h4WOOZkgHNVF6AKx1EsMTcnePx/NTZirMbt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsFVVCGC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsFVVCGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791589656; x=1823125656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UfidYsMrS2AZJjq01I4nSaYvHJ0OqaRHS+Q1SPK+kjY=;
  b=MsFVVCGCbUVToEXsESNQvmnaJt1CLPkywKDSfjSVo0Bh/LpZaBE6POSd
   P4BxTgj8zZ7fCm9sD+90FOvqlXwMupLwYIIs+aVLzjKnuJt94lamAlp4K
   A37nHse31YgFrDQJyWKm44XX0UdY7tUputhvKdGp8dxGlRH7mRy2o5exi
   oNETIY92PWWp1ft/xkYjYFYfyQzGNCYm2wewDXt/xUQ47Yn78p4HyFxqr
   nPeRDw+f+jD2qmdRG1ECItvsUvk8RiKXnNAUG/noAZKr5kKKvyjsGR4LY
   Xv5i+lWWNiZ8eKmnIg1kTBQpvQKyXpObhRmWECC5CtAMvHlbJf4pViloF
   Q==;
X-CSE-ConnectionGUID: VvnlDKm0S4WWHPzw7iHAoQ==
X-CSE-MsgGUID: PKSyXF35RimNaE9d5BtisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="402814"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="402814"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 16:47:35 -0700
X-CSE-ConnectionGUID: 4oKK7o9vQCmQyw/EmZKt+g==
X-CSE-MsgGUID: WMvNVGbtSEmAstaxG/2NGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2176640"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 09 Oct 2026 16:47:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFKJG-000000006IO-1qmn;
	Fri, 09 Oct 2026 23:47:30 +0000
Date: Sat, 10 Oct 2026 07:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: chitranshmandhaniya@gmail.com, hansg@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v2] platform/x86: dell-uart-backlight: fall back to PCH
 PWM on UART timeout
Message-ID: <202610100706.x2lcbo7S-lkp@intel.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3-rc6 next-20261008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chitranshmandhaniya-gmail-com/platform-x86-dell-uart-backlight-fall-back-to-PCH-PWM-on-UART-timeout/20261009-125401
base:   linus/master
patch link:    https://lore.kernel.org/r/20261009072401.52509-1-chitranshmandhaniya%40gmail.com
patch subject: [PATCH v2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
config: i386-buildonly-randconfig-1000-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100706.x2lcbo7S-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100706.x2lcbo7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100706.x2lcbo7S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/dell/dell-uart-backlight.c: In function 'dell_pwm_fallback_register':
>> drivers/platform/x86/dell/dell-uart-backlight.c:318:16: error: cleanup argument not a function
     318 |         struct pci_dev *gpu __free(pci_dev_put) = NULL;
         |                ^~~~~~~


vim +318 drivers/platform/x86/dell/dell-uart-backlight.c

   315	
   316	static int dell_pwm_fallback_register(struct device *dev)
   317	{
 > 318		struct pci_dev *gpu __free(pci_dev_put) = NULL;
   319		struct backlight_properties props = {};
   320		struct dell_pwm_backlight *pwm;
   321		struct backlight_device *bl;
   322		resource_size_t bar0;
   323		u32 freq, duty, ctl;
   324	
   325		gpu = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
   326		if (!gpu || gpu->vendor != PCI_VENDOR_ID_INTEL) {
   327			dev_warn(dev, "No Intel GPU found, cannot fall back to PCH PWM\n");
   328			return -ENODEV;
   329		}
   330	
   331		bar0 = pci_resource_start(gpu, 0);
   332		if (!bar0) {
   333			dev_warn(dev, "Intel GPU BAR0 not assigned\n");
   334			return -ENODEV;
   335		}
   336	
   337		pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
   338		if (!pwm)
   339			return -ENOMEM;
   340	
   341		pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, SZ_16);
   342		if (!pwm->mmio) {
   343			dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
   344			return -ENOMEM;
   345		}
   346	
   347		ctl  = readl(pwm->mmio);
   348		freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
   349		duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
   350	
   351		if (!(ctl & PCH_BLC_PWM_ENABLE) || freq == 0) {
   352			dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n", ctl, freq);
   353			return -ENODEV;
   354		}
   355	
   356		pwm->max_brightness = freq;
   357	
   358		dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n", freq, duty);
   359	
   360		props.type = BACKLIGHT_PLATFORM;
   361		props.brightness = duty;
   362		props.max_brightness = freq;
   363	
   364		bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, pwm,
   365						    &dell_pwm_backlight_ops, &props);
   366		return PTR_ERR_OR_ZERO(bl);
   367	}
   368	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
