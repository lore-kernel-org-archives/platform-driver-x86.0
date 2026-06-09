Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6A3DDDA6;
	Tue,  9 Jun 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996332; cv=none; b=XQeC+nyX7LcZvrKWX32vjBTZlllhFurBuFTOr69yB2jLG5szEYdmQYbUJsPSUQ3808kP2L+LkReWpU6HN1m57OoYjuyXmRZGhEJWsC5Yj7X3zNKI0YdYmJvMil0EQg4otPRpvjXCq+zfsgHr4tymv4aMIE2h2JZtwWJZisD/7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996332; c=relaxed/simple;
	bh=0MbGZ+EHEhmc+m3Mn1oj+tNcFUGXMt3gPbKjGFArhT4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R3oBDll9rfTqOcyQqe1gTKjfhIfkjnNKtrk1g6MDR4m5U9p+n9NzibzqnJ/wisflA3saFl7IBq7F3p5kyiILISeVeCzeoJajnLY88YvWrqAZYFkwrQ0hy8dRA2zR0OKML4iYQxxS8JSWXEZbI7908a98o66nVV/mHl3k6xRUXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHMS/NI0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHMS/NI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780996329; x=1812532329;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0MbGZ+EHEhmc+m3Mn1oj+tNcFUGXMt3gPbKjGFArhT4=;
  b=dHMS/NI0RjAF29ZLHqAioJuaKB1w4AH6ByqCcMyAwh2LPX3S+vElu8WM
   hdrgmfnbDEAw4I6XWsRKY9pzHkpgr6ZEa6lSEw7EOMS8MgsZn5esgKMz5
   iKH3IatedFJAqxOG67yFPe7inWzFhVxSCte9IKrFp2rd8kVPbqBTD8vdo
   vS59GQ/iSRpzYNb4dasx94sHi4cnohKlGjQzfLaKzFW2QexMWCuggVP/O
   qbTd0zCAWQdPgNxIus3u8XZTXnkrDeC8dIwwksLGmhH89ZBTsPbBLF7Ii
   COvUyNdQwJ5cTUS+l8ojA/g2BGksJxuNnYtfsL/8Ktj+cHqTt4P/xIPYx
   A==;
X-CSE-ConnectionGUID: pLU3+gLyQzedMVodMh/i1Q==
X-CSE-MsgGUID: o8eAZDRpSSKWeOqrYobL+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92314686"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92314686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:12:08 -0700
X-CSE-ConnectionGUID: 9FboTw8NSnO6bgmZrXSpfw==
X-CSE-MsgGUID: 2gInfjTSRcOSJpVJMI6YMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="250890591"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:12:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 12:12:01 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, hmh@hmh.eng.br, 
    Hans de Goede <hansg@kernel.org>, corbet@lwn.net, 
    derekjohn.clark@gmail.com, skhan@linuxfoundation.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    vsankar@lenovo.com
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add USB-C Security (USCS)
 support
In-Reply-To: <20260609041402.328509-1-vishnuocv@gmail.com>
Message-ID: <b6a08dcf-c7ce-d85a-5c18-18371f6a7cbf@linux.intel.com>
References: <20260609041402.328509-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jun 2026, Vishnu Sankar wrote:

> Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feature.
> When active, USB-C data connections are disabled while power delivery is
> preserved. This is useful for kiosk and physically-secured deployments.
> 
> Hardware interface:
> 
> The HKEY device exposes a read-only ACPI method USCS():
> 
>   Return value bit layout:
>     Bit 16 : Capability flag (1 = feature present on this SKU)
>     Bit  0 : Current state  (0 = security OFF, 1 = security ON)
> 
> The sysfs attribute is read-only.
> 
> The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
> hardware state.
> 
> Hotkey:
> 
> Fn+U followed by Fn+S generates HKEY event 0x131e.
> 
> sysfs interface:
> 
>   /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
>   "enabled\n"  -- data connections are currently blocked
>   "disabled\n" -- data connections are currently allowed
> 
>   The attribute is hidden on SKUs where the USCS capability bit (bit 16)
>   is not set, so there is no ABI impact on unsupported hardware.
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
> Changes since v1:
> - Use guard(mutex) from cleanup.h instead of manual mutex_lock/unlock
> - Revert usbc_security_query() to return int (-EIO/-ENODEV/0) instead
>   of bool to avoid uninitialized *enabled bug on unsupported platforms
> - Remove !! when assigning to bool in usbc_security_query()
> - Remove dead tp_features.usbc_security_supported check in show()
>   since is_visible() already gates the attribute on unsupported SKUs
> - Use str_enabled_disabled() from string_choices.h in show()
> - Fix uninitialized *enabled bug in tpacpi_usbc_security_init() by
>   only assigning usbc_security_enabled after a successful query
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 118 ++++++++++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index f874db31801d..db4588af0278 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1543,6 +1543,30 @@ Values:
>  
>  	This setting can also be toggled via the Fn+doubletap hotkey.
>  
> +USB-C Security
> +--------------
> +
> +sysfs: usb_c_security
> +
> +Reports the current state of the USB-C Security (Restricted Mode) feature
> +on supported ThinkPad systems. When enabled, USB-C data connections are
> +disabled while power delivery is preserved.
> +
> +The available command is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
> +
> +Values:
> +
> +	* ``enabled``  - USB-C data connections are currently blocked
> +	* ``disabled`` - USB-C data connections are currently allowed
> +
> +The attribute is read-only. The USB-C Security state can only be toggled
> +via the Fn+U followed by Fn+S hotkey chord.
> +
> +The sysfs attribute is not created on platforms that do not support this
> +feature.
> +
>  Auxmac
>  ------
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index e1cee42a1683..379769b62c80 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -38,6 +38,7 @@
>  #include <linux/backlight.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/freezer.h>
> @@ -66,6 +67,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/string_helpers.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -185,6 +187,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
>  	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
> +	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* Toggle USB C Security ON/OFF */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
>  
> @@ -373,6 +376,8 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
> +	u32 usbc_security_supported:1;
> +	u32 usbc_security_enabled:1;

Sashiko (sashiko.dev) warned that there may be concurrent, unprotected 
updates to these bitfields (changing bitfields require unsafe RMW). It 
looks pre-existing problem at least for trackpoint_doubletap_enable (maybe 
others).

To avoid adding to the problems, usbc_security_enabled should be added 
outside the bitfield to avoid need to do locking for this bitfield.

And trackpoint_doubletap_enable (and possibly others) which are touched in 
the notify context or in sysfs write should be fixed in a separate patch 
(can be done after this series as it's pre-existing problem for them).

Anything that is only written during init is fine inside the bitfield.

>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -11265,6 +11270,112 @@ static struct ibm_struct hwdd_driver_data = {
>  	.name = "hwdd",
>  };
>  
> +/*************************************************************************
> + * USB-C Security subdriver
> + *
> + * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
> + * It always returns:
> + *   bit 16 - USB-C security capability present on this SKU or not
> + *   bit  0 - USB-C Security state (enable or disable)
> + *
> + * Hotkey
> + * ------
> + * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the event.
> + * The driver reads back the new state and notifies the sysfs attribute.
> + *

Remove the extra line.

> + */
> +
> +/* USCS() return word bit layout */
> +#define USCS_CAP_BIT		BIT(16)	/* capability: feature present on SKU */
> +#define USCS_STATUS_BIT		BIT(0)	/* current security state */
> +
> +static DEFINE_MUTEX(usbc_security_mutex);
> +
> +/*
> + * usbc_security_query - read current USB-C security state via USCS()
> + * @enabled: out - true when security is ON (data connections blocked)
> + *
> + * Returns true if the feature is supported and query succeeded,

Kerneldoc doc compatible syntax is:

Returns:

> + * false otherwise (feature absent or ACPI call failed).

Please rewrite this as this function no longer returns true/false. :-)

> + */
> +static int usbc_security_query(bool *enabled)
> +{
> +	int status;
> +
> +	guard(mutex)(&usbc_security_mutex);
> +	if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
> +		return -EIO;
> +
> +	if (!(status & USCS_CAP_BIT)) {
> +		pr_debug("USCS cap bit absent (raw=0x%x)\n", status);
> +		return -ENODEV;
> +	}
> +
> +	*enabled = status & USCS_STATUS_BIT;
> +	return 0;
> +}
> +
> +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- */
> +static ssize_t usb_c_security_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n",
> +			  str_enabled_disabled(tp_features.usbc_security_enabled));
> +}
> +
> +static DEVICE_ATTR_RO(usb_c_security);
> +
> +static struct attribute *usbc_security_attributes[] = {
> +	&dev_attr_usb_c_security.attr,
> +	NULL,
> +};
> +
> +static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
> +					     struct attribute *attr, int n)
> +{
> +	return tp_features.usbc_security_supported ? attr->mode : 0;
> +}
> +
> +static const struct attribute_group usbc_security_attr_group = {
> +	.is_visible = usbc_security_attr_is_visible,
> +	.attrs = usbc_security_attributes,
> +};
> +
> +static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
> +{
> +	bool enabled;
> +	int err;
> +
> +	err = usbc_security_query(&enabled);
> +	if (err)
> +		return err == -ENODEV ? 0 : err;

Just split this to two if () + returns for clarity.

> +
> +	tp_features.usbc_security_supported = true;
> +	tp_features.usbc_security_enabled = enabled;
> +	return 0;
> +}
> +
> +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> +static bool tpacpi_usbc_security_hotkey(void)
> +{
> +	bool enabled;
> +
> +	if (!tp_features.usbc_security_supported)
> +		return false;
> +
> +	if (usbc_security_query(&enabled))
> +		return false;
> +
> +	tp_features.usbc_security_enabled = enabled;
> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
> +	return true;
> +}
> +
> +static struct ibm_struct usbc_security_driver_data = {
> +	.name = "usbc_security",
> +};
> +
>  /* --------------------------------------------------------------------- */
>  
>  static struct attribute *tpacpi_driver_attributes[] = {
> @@ -11325,6 +11436,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
>  	&hwdd_attr_group,
> +	&usbc_security_attr_group,
>  	NULL,
>  };
>  
> @@ -11479,6 +11591,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  	case TP_HKEY_EV_PROFILE_TOGGLE2:
>  		platform_profile_cycle();
>  		return true;
> +	case TP_HKEY_EV_USB_C_SECURITY:
> +		return tpacpi_usbc_security_hotkey();
>  	}
>  
>  	return false;
> @@ -11930,6 +12044,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = tpacpi_hwdd_init,
>  		.data = &hwdd_driver_data,
>  	},
> +	{
> +		.init = tpacpi_usbc_security_init,
> +		.data = &usbc_security_driver_data,
> +	},
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 

-- 
 i.

