Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F911BD9C9;
	Mon, 25 May 2026 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729549; cv=none; b=BdBlSdAuH0siT2uy+yfvOhvDDqiuvbipSjqspm0ucF4fw8uI1LQmeuN0hEfKHknsYFz0BkHcWT0rpLWPjgFM3oBuQn3rn2u7w4yIhJRM6heodFNdFyMqEYwmbGQnMBDPXoU5F0buciXlYQPTE+JD5ItUlf1gqPeJRkgCQZj28YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729549; c=relaxed/simple;
	bh=XDOaoQBfpCf7DMVl8B+eWTRxA5Zyh8M30liKZ1ciNm4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sw/ArUj6AtEEkR+o7q/ZmDPLCgOFMe0pqtDxj+SXhaLlshBpf/AZxZiZNybQmBO6kGimOlG26Lf9+PCWv/xrF3wltXIU5aLPQYF++xZZstzlIBKU6ZmYAdzmJeRyiS0eqOXYmPHzXkAPEwahDCZkPuCcfTMNejg1jVuXBCZgLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx+cCvbu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx+cCvbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779729546; x=1811265546;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XDOaoQBfpCf7DMVl8B+eWTRxA5Zyh8M30liKZ1ciNm4=;
  b=lx+cCvbuFn7BXppGtKqTW9gmyOmCrqzb4iU2T2LQkrUGGXru4Lu94WPt
   FQ5wtnkZxZcL9T0aaOE0GFl7qFKwl943zNtsqJ7r+aejGpSnsEeWkwq9P
   aM0OgufOf8olJr4ituuB9/dmURYj6diZFRa1XuIk+oKJwoBWGLzbK3P8M
   n150v+AK3JzbrVuG6UDYdt++E9YgpE/ttlJa4lrOfEcFgtgba5G3d+evz
   JJH8xbS2mYHma48xVtwlX3vWSUucKMzikUWFj+UF1FnxnDHSzt7Wf9Iav
   kGDrxOAwGVAtr5BpasFk+/LVx2ZaHJf+lEGlETQzXugMc8U1sH8+XyOLL
   A==;
X-CSE-ConnectionGUID: KwIbXDZjQE+2HPuOqNTQuQ==
X-CSE-MsgGUID: yhqRZ3L8THG0tZ3uFKdgEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80666593"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80666593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 10:19:06 -0700
X-CSE-ConnectionGUID: bYnvJjBkQRaTbXeYMzMHsQ==
X-CSE-MsgGUID: H9UZUKqSQRuRM1GFcevPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="240613656"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 10:19:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 20:18:58 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, 
    hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, corbet@lwn.net, 
    derekjohn.clark@gmail.com, LKML <linux-kernel@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add USB-C Security (USCS)
 support
In-Reply-To: <20260522100715.20036-1-vishnuocv@gmail.com>
Message-ID: <c4c0632b-0a24-8956-9557-69b927e451fb@linux.intel.com>
References: <20260522100715.20036-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 May 2026, Vishnu Sankar wrote:

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
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 115 ++++++++++++++++++
>  2 files changed, 139 insertions(+)
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
> index e1cee42a1683..889db802185a 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -185,6 +185,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
>  	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
> +	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* Toggle USB C Security ON/OFF */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
>  
> @@ -373,6 +374,8 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
> +	u32 usbc_security_supported:1;
> +	u32 usbc_security_enabled:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -11265,6 +11268,111 @@ static struct ibm_struct hwdd_driver_data = {
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
> + * false otherwise (feature absent or ACPI call failed).
> + */
> +static bool usbc_security_query(bool *enabled)
> +{
> +	int status;
> +
> +	mutex_lock(&usbc_security_mutex);
> +	if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0)) {
> +		mutex_unlock(&usbc_security_mutex);
> +		return false;
> +	}
> +	mutex_unlock(&usbc_security_mutex);

Please use cleanup.h.

> +
> +	if (!(status & USCS_CAP_BIT)) {
> +		pr_debug("USCS cap bit absent (raw=0x%x)\n", status);
> +		return false;
> +	}
> +
> +	*enabled = !!(status & USCS_STATUS_BIT);

No need to do !! when assigning to bool.

> +	return true;
> +}
> +
> +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- */
> +static ssize_t usb_c_security_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n",
> +			  tp_features.usbc_security_enabled ? "enabled" : "disabled");

Please use string_choices.h.

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
> +
> +	tp_features.usbc_security_supported =
> +		usbc_security_query(&enabled);

Fits to one line.

> +	tp_features.usbc_security_enabled = enabled;

I'm not sure I follow the logic here as you always seem set it enabled 
disregarding even support or not?

And that hotkey enabling seems deadcode with it already enabled here.

I feel like I must blind to something obvious but cannot just find 
what that would be.

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
> +	if (!usbc_security_query(&enabled))
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
> @@ -11325,6 +11433,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
>  	&hwdd_attr_group,
> +	&usbc_security_attr_group,
>  	NULL,
>  };
>  
> @@ -11479,6 +11588,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  	case TP_HKEY_EV_PROFILE_TOGGLE2:
>  		platform_profile_cycle();
>  		return true;
> +	case TP_HKEY_EV_USB_C_SECURITY:
> +		return tpacpi_usbc_security_hotkey();
>  	}
>  
>  	return false;
> @@ -11930,6 +12041,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

