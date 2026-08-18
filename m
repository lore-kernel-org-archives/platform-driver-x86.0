Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78929175A6C;
	Tue, 18 Aug 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062780; cv=none; b=clDRe35+mCiDwxGF0KMuU/oLZydO1YTbHVR5XtpaHB7rYXgeqPvhM3+fHYFyjMrFC3XrVgtlRGL07Nbkfrm0tx9tniKRfZR30b+6xHME31OahfQw57LndLWpPxKMWTE3nZ+JzycsNLosH4l5Ebhy7MHGo3FDRVosNIOnuwSO4SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062780; c=relaxed/simple;
	bh=fvMIZ7pBDtm/FgTTWOVIBpY/aFib7Y0GW54X6uioNoU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tfYh46LgkmkdpGLlRVILjQlGGvfuk8GxB1zFLFoZIa27JvpcQ7K3IiU0tEP7kS7qBhM9yCot7TNOuJU5OmjY+EClRwxPaQEpLRuM+/QbmRFJaV5OcbBAdYZFqDiYIPpqColgE6jUlBakuru+TZuuN9nR4MQFd04k3MX4m7kZ/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFIPIO5e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFIPIO5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062780; x=1818598780;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fvMIZ7pBDtm/FgTTWOVIBpY/aFib7Y0GW54X6uioNoU=;
  b=ZFIPIO5eGuH+R9/iLDnN3ZPWvmp18i/HenSh0JltW5LiV8pQztnLyPof
   Ba1hnYyopk86j9hbye9vRwuPj5GJsvWfRF2M6QgoGVkzum9kGfgKQurzO
   GgHZKBsW/7CSdMfufwQoTkviDcimTdnGp50hN5k6GOxWbrOFU5JDpQXAp
   vUjWqXT2XtFgNpzb0fTU1QmO+Sd7vd9JZg5cFu8IgRWqHH9Wyu2fJlPoT
   xllv5K5aeuFWwfJF3cyhprlHEwP6uFERLVYFyao0Ikjs6dvKpTlgwSX2M
   WrDaFuxhiatTr8ILy8ZetmndvCum60ogrmnxYs7GVT9xDZnXRTFwp2pqw
   w==;
X-CSE-ConnectionGUID: 7CwkeP8vSICymGOAKKw0+w==
X-CSE-MsgGUID: thWhMIzmTKOpj3lytTvWbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99076855"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99076855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:19:39 -0700
X-CSE-ConnectionGUID: 9cBd1xDcQ+2lHMlQvcWskw==
X-CSE-MsgGUID: KGA/E1n9QiGbIgShU2frTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="288749059"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:19:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 17:19:33 +0300 (EEST)
To: Pit Henrich <pithenrichmail@googlemail.com>
cc: hmh@hmh.eng.br, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    derekjohn.clark@gmail.com, Hans de Goede <hansg@kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, pithenrich2d@gmail.com
Subject: Re: [PATCH v3] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
In-Reply-To: <20260731082818.1578104-1-pithenrich2d@gmail.com>
Message-ID: <c86ad68d-a2f9-72d5-f1f6-38faa756ada4@linux.intel.com>
References: <20260731082818.1578104-1-pithenrich2d@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jul 2026, Pit Henrich wrote:

> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
> attached (on the screen), but thinkpad-acpi does not expose this to userspace.
> The state can be obtained via ACPI methods: GDST (get device state).
> 
> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
> a DMI match.
> 
> Cache the state and emit a sysfs notification on
> TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
> hotkey setup and refresh it before the resume notification to keep the state
> consistent across suspend and resume.
> 
> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>

Hi,

This fails to apply cleanly.

--
 i.

> ---
> This replaced the v2 patch in:
> https://lore.kernel.org/all/20260419102724.91451-1-pithenrich2d@gmail.com/
> 
> Changes v1 -> v2:
>  * Use ACPI method instead of using the EC directly (thanks Mark).
> Changes v2 -> v3:
>  * Added documentation to thinkpad-acpi.rst
>  * Patched against current thinkpad_acpi.c
> 
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 26 +++++-
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 85 ++++++++++++++++++-
>  2 files changed, 108 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index f874db31801d..7873a58cb2f5 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -583,7 +583,8 @@ Events that are propagated by the driver to userspace:
>  0x6030		System thermal table changed
>  0x6032		Thermal Control command set completion  (DYTC, Windows)
>  0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
> -0x60C0		X1 Yoga 2016, Tablet mode status changed
> +0x60C0		X1 Yoga 2016 tablet mode or X1 Fold 16 Gen 1 keyboard
> +		attachment state changed
>  0x60F0		Thermal Transformation changed (GMTS, Windows)
>  ======		=====================================================
>  
> @@ -1634,6 +1635,29 @@ if damage detected:
>  The property is read-only. If feature is not supported then sysfs
>  attribute is not created.
>  
> +X1 Fold keyboard attachment
> +---------------------------
> +
> +sysfs attribute: keyboard_attached_on_screen
> +
> +ThinkPad X1 Fold 16 Gen 1 systems can report whether the keyboard is
> +currently attached on-screen.
> +
> +This attribute is currently supported on ThinkPad X1 Fold 16 Gen 1
> +systems only.
> +
> +The command to check the keyboard attachment state is::
> +
> +	cat /sys/devices/platform/thinkpad_acpi/keyboard_attached_on_screen
> +
> +The values are:
> +
> +- 0 if the keyboard is not attached on-screen
> +- 1 if the keyboard is attached on-screen
> +
> +The property is read-only. If feature is not supported then the sysfs
> +attribute is not created.
> +
>  Multiple Commands, Module Parameters
>  ------------------------------------
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..66480609ee05 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -219,8 +219,9 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
>  	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
>  	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
> -	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
> -						   * enter/leave tablet mode
> +	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* posture change event:
> +						   * X1 Yoga (2016): enter/leave tablet mode
> +						   * X1 Fold 16 Gen 1: keyboard attachment state changed
>  						   */
>  	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
>  	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
> @@ -374,6 +375,7 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
> +	u32 has_keyboard_attached_on_screen:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -2888,6 +2890,63 @@ static void hotkey_tablet_mode_notify_change(void)
>  			     "hotkey_tablet_mode");
>  }
>  
> +static bool keyboard_attached_on_screen;
> +static bool keyboard_attached_on_screen_initialized;
> +
> +static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
> +{
> +	int state;
> +
> +	if (!tp_features.has_keyboard_attached_on_screen)
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(NULL, &state, "\\_SB.DEVD.GDST", "d"))
> +		return -EIO;
> +
> +	*attached = state != 0;
> +	return 0;
> +}
> +
> +static ssize_t keyboard_attached_on_screen_show(struct device *dev,
> +						struct device_attribute *attr,
> +						char *buf)
> +{
> +	bool attached;
> +	int res;
> +
> +	res = x1_fold_keyboard_attached_on_screen_get(&attached);
> +	if (res)
> +		return res;
> +
> +	return sysfs_emit(buf, "%d\n", attached);
> +}
> +
> +static DEVICE_ATTR_RO(keyboard_attached_on_screen);
> +
> +static void keyboard_attached_on_screen_notify_change(void)
> +{
> +	if (tp_features.has_keyboard_attached_on_screen)
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> +			     "keyboard_attached_on_screen");
> +}
> +
> +static bool keyboard_attached_on_screen_update(void)
> +{
> +	bool attached;
> +
> +	if (x1_fold_keyboard_attached_on_screen_get(&attached))
> +		return false;
> +
> +	if (keyboard_attached_on_screen_initialized &&
> +	    keyboard_attached_on_screen == attached)
> +		return false;
> +
> +	keyboard_attached_on_screen = attached;
> +	keyboard_attached_on_screen_initialized = true;
> +
> +	return true;
> +}
> +
>  /* sysfs wakeup reason (pollable) -------------------------------------- */
>  static ssize_t hotkey_wakeup_reason_show(struct device *dev,
>  			   struct device_attribute *attr,
> @@ -3017,6 +3076,7 @@ static struct attribute *hotkey_attributes[] = {
>  	&dev_attr_hotkey_adaptive_all_mask.attr,
>  	&dev_attr_hotkey_recommended_mask.attr,
>  	&dev_attr_hotkey_tablet_mode.attr,
> +	&dev_attr_keyboard_attached_on_screen.attr,
>  	&dev_attr_hotkey_radio_sw.attr,
>  	&dev_attr_doubletap_enable.attr,
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> @@ -3032,6 +3092,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
>  	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
>  		if (!tp_features.hotkey_tablet)
>  			return 0;
> +	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
> +		if (!tp_features.has_keyboard_attached_on_screen)
> +			return 0;
>  	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
>  		if (!tp_features.hotkey_wlsw)
>  			return 0;
> @@ -3448,6 +3511,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	}
>  
>  	tabletsw_state = hotkey_init_tablet_mode();
> +	keyboard_attached_on_screen_update();
>  
>  	/* Set up key map */
>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
> @@ -3828,6 +3892,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
>  	case TP_HKEY_EV_TABLET_CHANGED:
>  		tpacpi_input_send_tabletsw();
>  		hotkey_tablet_mode_notify_change();
> +		if (keyboard_attached_on_screen_update())
> +			keyboard_attached_on_screen_notify_change();
>  		*send_acpi_ev = false;
>  		return true;
>  
> @@ -3984,6 +4050,8 @@ static void hotkey_resume(void)
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
> +	keyboard_attached_on_screen_update();
> +	keyboard_attached_on_screen_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
>  	hotkey_poll_setup_safe(false);
> @@ -4282,6 +4350,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  	{}
>  };
>  
> +static const struct dmi_system_id keyboard_attached_on_screen_list[] __initconst = {
> +	{
> +		.ident = "ThinkPad X1 Fold 16 Gen 1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
> +		},
> +	},
> +	{}
> +};
> +
>  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
> @@ -12239,6 +12318,8 @@ static int __init thinkpad_acpi_module_init(void)
>  	dmi_id = dmi_first_match(fwbug_list);
>  	if (dmi_id)
>  		tp_features.quirks = dmi_id->driver_data;
> +	tp_features.has_keyboard_attached_on_screen =
> +		dmi_check_system(keyboard_attached_on_screen_list);
>  
>  	/* Device initialization */
>  	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
> 
