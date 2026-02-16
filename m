Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB74305045;
	Mon, 16 Feb 2026 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274976; cv=none; b=WcsRQ0IThCkw8dK4zU0iDLkSEEk2/Dlam16Kz7Dl8mTpWqPnZjA4xqZoksijX9I9lF/gFuFO6qUVixl/uUJJJRGlptKNIkqezVHosGSF0qZD57hLE2CBRFh2zO+zTQMpslqhpS6zDnL6fVJ1wxBZsVWOofuHKVoTyF5pmoHIo/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274976; c=relaxed/simple;
	bh=ccZtZjMtdl2BqjNw9fyqv+/eLYLjQFrPfcEU9cL6LOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlKvunXSYepWbwMWwM7DsvZF6jPz2fMUdR+fRFInkGwWqVHS899AiGtw3aaDtLdxCPF3PaJcc00OH5DUOU0+BpFATUh2NYoPMH4N2SVxmrKS0sqURk5rxiDwNsE/cn/C/5pMrNpubt6652AoZn0VX1MBqcWt5Ra/vnQRurVbKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6vhfQzR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6vhfQzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771274974; x=1802810974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccZtZjMtdl2BqjNw9fyqv+/eLYLjQFrPfcEU9cL6LOo=;
  b=D6vhfQzRq3E2vy01B3Sik6biU3JCwIMZUkaKbxUzNqOwgdBGPgy7ejcZ
   9VFZ+ogGLGfIQ//HanOWV9jpfhYLWNbOkN5wKJF7s2k+Fto4yL1QxCRGq
   F8LP8NMtU2au50vhuZbmtPrsDNW+5L99x67ILJSuz/DyOkScyfS1qx08p
   delXSbIeeBykev8s6iMH7aSx2Xtti8HPplbr01lRdnYJFmbi+3FC2yS9J
   vkG9fVRXDnvEV5I+KX3BnTMYAPB8TDZLezUB9u1967eS2kh7Vm2+/zTXD
   tq4V+5WRshEEHn6skbjmmfqm4Kaf6kIiIzRSiJUs7KztN9T1RAQ35ePan
   w==;
X-CSE-ConnectionGUID: RSjZ+PkiTvWeE+ZUIU2E0g==
X-CSE-MsgGUID: eIKi/sbXRdWNrdUQj+SsHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72399675"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72399675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:49:34 -0800
X-CSE-ConnectionGUID: awXRGS4WRx2QCWA+yYxWOQ==
X-CSE-MsgGUID: n9NxkaGdSZSbez+fDSah8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="218232126"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 12:49:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5X8-000000010H4-0hRb;
	Mon, 16 Feb 2026 20:49:30 +0000
Date: Tue, 17 Feb 2026 04:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, cryolitia.pukngae@linux.dev,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v11] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
Message-ID: <202602170404.hazCrN1y-lkp@intel.com>
References: <20260216004757.8589-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216004757.8589-1-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2ccbdb612d0d95f25c38189b83666ff0fb2bfb47]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/platform-x86-bitland-mifs-wmi-Add-new-Bitland-MIFS-WMI-driver/20260216-085018
base:   2ccbdb612d0d95f25c38189b83666ff0fb2bfb47
patch link:    https://lore.kernel.org/r/20260216004757.8589-1-qby140326%40gmail.com
patch subject: [PATCH v11] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver
config: x86_64-randconfig-r132-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170404.hazCrN1y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170404.hazCrN1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170404.hazCrN1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `bitland_mifs_wmi_notify':
>> drivers/platform/x86/bitland-mifs-wmi.c:788:(.text+0x211b6ee): undefined reference to `sparse_keymap_report_event'
   ld: vmlinux.o: in function `bitland_mifs_wmi_probe':
>> drivers/platform/x86/bitland-mifs-wmi.c:697:(.text+0x211ceb6): undefined reference to `sparse_keymap_setup'


vim +788 drivers/platform/x86/bitland-mifs-wmi.c

   665	
   666	static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
   667	{
   668		struct bitland_mifs_wmi_data *drv_data;
   669		struct device *pp_dev;
   670		enum bitland_wmi_device_type dev_type =
   671			(enum bitland_wmi_device_type)(unsigned long)context;
   672		int ret;
   673	
   674		drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
   675		if (!drv_data)
   676			return -ENOMEM;
   677	
   678		drv_data->wdev = wdev;
   679	
   680		ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
   681		if (ret)
   682			return ret;
   683	
   684		dev_set_drvdata(&wdev->dev, drv_data);
   685	
   686		if (dev_type == BITLAND_WMI_EVENT) {
   687			/* Register input device for hotkeys */
   688			drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
   689			if (!drv_data->input_dev)
   690				return -ENOMEM;
   691	
   692			drv_data->input_dev->name = "Bitland MIFS WMI hotkeys";
   693			drv_data->input_dev->phys = "wmi/input0";
   694			drv_data->input_dev->id.bustype = BUS_HOST;
   695			drv_data->input_dev->dev.parent = &wdev->dev;
   696	
 > 697			ret = sparse_keymap_setup(drv_data->input_dev,
   698						  bitland_mifs_wmi_keymap, NULL);
   699			if (ret)
   700				return ret;
   701	
   702			ret = input_register_device(drv_data->input_dev);
   703			if (ret)
   704				return ret;
   705	
   706			return 0;
   707		}
   708	
   709		/* Register platform profile */
   710		pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
   711							&laptop_profile_ops);
   712		if (IS_ERR(pp_dev))
   713			return PTR_ERR(pp_dev);
   714	
   715		drv_data->saved_profile = PLATFORM_PROFILE_LAST;
   716	
   717		/* Register hwmon */
   718		drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
   719									   "bitland_mifs",
   720									   drv_data,
   721									   &laptop_chip_info,
   722									   NULL);
   723		if (IS_ERR(drv_data->hwmon_dev))
   724			return PTR_ERR(drv_data->hwmon_dev);
   725	
   726		/* Register keyboard LED */
   727		drv_data->kbd_led.name = "laptop::kbd_backlight";
   728	
   729		drv_data->kbd_led.max_brightness = 3;
   730		drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;
   731		drv_data->kbd_led.brightness_get = laptop_kbd_led_get;
   732		ret = devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
   733		if (ret)
   734			return ret;
   735	
   736		drv_data->notifier.notifier_call = bitland_notifier_callback;
   737		ret = atomic_notifier_chain_register(&bitland_notifier_list, &drv_data->notifier);
   738		if (ret)
   739			return ret;
   740	
   741		ret = devm_add_action_or_reset(&wdev->dev,
   742					       bitland_notifier_unregister,
   743					       &drv_data->notifier);
   744		if (ret)
   745			return ret;
   746	
   747		return 0;
   748	}
   749	
   750	static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
   751					    const struct wmi_buffer *buffer)
   752	{
   753		struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
   754		const struct bitland_mifs_event *event;
   755		struct bitland_fan_notify_data fan_data;
   756		u8 brightness;
   757	
   758		if (buffer->length < sizeof(*event))
   759			return;
   760	
   761		event = (const struct bitland_mifs_event *)buffer->data;
   762	
   763		/* Validate event type */
   764		if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
   765			return;
   766	
   767		dev_dbg(&wdev->dev,
   768			"WMI event: id=0x%02x value_low=0x%02x value_high=0x%02x\n",
   769			event->event_id, event->value_low, event->value_high);
   770	
   771		switch (event->event_id) {
   772		case WMI_EVENT_KBD_BRIGHTNESS:
   773			brightness = event->value_low;
   774			atomic_notifier_call_chain(&bitland_notifier_list,
   775						   BITLAND_NOTIFY_KBD_BRIGHTNESS,
   776						   &brightness);
   777			break;
   778	
   779		case WMI_EVENT_PERFORMANCE_PLAN:
   780			atomic_notifier_call_chain(&bitland_notifier_list,
   781						   BITLAND_NOTIFY_PLATFORM_PROFILE,
   782						   NULL);
   783			break;
   784	
   785		case WMI_EVENT_OPEN_APP:
   786		case WMI_EVENT_CALCULATOR_START:
   787		case WMI_EVENT_BROWSER_START:
 > 788			if (!sparse_keymap_report_event(data->input_dev,
   789							event->event_id, 1, true))
   790				dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
   791					 event->event_id);
   792			break;
   793	
   794		/*
   795		 * The device has 3 fans (CPU, GPU, SYS),
   796		 * but there are only the CPU and GPU fan has events
   797		 */
   798		case WMI_EVENT_CPU_FAN_SPEED:
   799		case WMI_EVENT_GPU_FAN_SPEED:
   800			if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
   801				fan_data.channel = 0;
   802			else
   803				fan_data.channel = 1;
   804	
   805			/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
   806			fan_data.speed = (event->value_high << 8) | event->value_low;
   807			atomic_notifier_call_chain(&bitland_notifier_list,
   808						   BITLAND_NOTIFY_HWMON,
   809						   &fan_data);
   810			break;
   811	
   812		case WMI_EVENT_AIRPLANE_MODE:
   813		case WMI_EVENT_TOUCHPAD_STATE:
   814		case WMI_EVENT_FNLOCK_STATE:
   815		case WMI_EVENT_KBD_MODE:
   816		case WMI_EVENT_CAPSLOCK_STATE:
   817		case WMI_EVENT_NUMLOCK_STATE:
   818		case WMI_EVENT_SCROLLLOCK_STATE:
   819		case WMI_EVENT_REFRESH_RATE:
   820		case WMI_EVENT_WIN_KEY_LOCK:
   821			/* These events are informational or handled by firmware */
   822			dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
   823				event->event_id, event->value_low);
   824			break;
   825	
   826		default:
   827			dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
   828				event->event_id, event->value_low);
   829			break;
   830		}
   831	}
   832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
