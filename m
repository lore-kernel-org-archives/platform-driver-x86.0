Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4B41D4CE;
	Tue,  7 Jul 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431157; cv=none; b=t0rXO5UI+so6s7lr0Nt8SaqvqDiSlGxUbd3G1aU2jdvUcsiAU/wpy2CslGg/RRgYuP0u+Y4uU0kPrh59uc4kw9nXyWWv5dKM3xfKU8m9U1T8E03UNyk4x6Zv4I4rclFP/z3u8ZxlNxD4Bp4ootcEMywZsJd+Pe9krzue+uEisMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431157; c=relaxed/simple;
	bh=nvIOop0wkzf0lbjWCF3/zxj3ywTCvsCVOIEs1kM1fFM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Nso5oyxuBXQhT2a68y6+9eKnUYRwh8JgyDzhdEKTDeGE9eRqtWZDJ/wLbhkxBq8LF7Mtjun6neEHzqIzoLno4quxcl3ru02eS7/Eb4Q2Vxbl+HChywFvNUOV0uEVmSyHeW6st963jHvhHneIhf74c/EJuSrySlsnOVES3GZri/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdhuXOqs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdhuXOqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783431156; x=1814967156;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nvIOop0wkzf0lbjWCF3/zxj3ywTCvsCVOIEs1kM1fFM=;
  b=PdhuXOqskDrNTYoQ8tMRUA/V844YKMxXZ1pQS+U3CuRqiWqNVoBEBcXB
   Hi9cpBHnNjTrLOLuY0izsumSzqfDLe+nnpmqy3jl6MvvffJGr/25+a6SY
   4MIi14V2oZKgZ2DLBbVws3MC4KJgkCdaL/cJyyj3lTjSbzjUt+XnuFCtt
   0hj9PvqSXeFCL/pYsz2pFzJF/9Tt7UVfTw+L1WbZuMKoM5W12RQbpb5/R
   uEdCVQYOpFaeOnXk1j6mD2rWIFq+ahpB1mN/y0qp1lVBDBdtAKzZTueec
   D8oD8OsEbcQCgq2+ozKS+kGeNRxeFzynDoOcm1AOC3HbF37EhsFyM8VYB
   Q==;
X-CSE-ConnectionGUID: eyL7N0skRuCccIyzTvOwaA==
X-CSE-MsgGUID: 9tcXnjdbRoe0ZkcuPtrEFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84267097"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84267097"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:32:36 -0700
X-CSE-ConnectionGUID: AvFGhoisQ06gXwv+p7NYfQ==
X-CSE-MsgGUID: T69eIJ1HTJKL28VAlr6/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277220107"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:32:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 16:32:28 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, 
    corbet@lwn.net, hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, 
    derekjohn.clark@gmail.com, LKML <linux-kernel@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Add USB-C Security (USCS)
 support
In-Reply-To: <20260613225736.30906-1-vishnuocv@gmail.com>
Message-ID: <2c7578ec-432e-e77c-c19f-668e2edc1733@linux.intel.com>
References: <20260613225736.30906-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Jun 2026, Vishnu Sankar wrote:

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
> Changes since v2:
> - Move usbc_security_enabled out of tp_features bitfield to a bool
>   member of tp_features to avoid unsafe concurrent bitfield RMW;
>   usbc_security_supported remains a bitfield as it is init-only.
> - Pass &tp_features.usbc_security_enabled directly to
>   usbc_security_query() removing the local bool intermediary
>   in both init and hotkey paths.
> - Remove extra blank line before */ in block comment.
> - Fix kerneldoc Returns: syntax and rewrite return value description
>   to match the int return type.
> - Split ternary return into two separate if statements for clarity
> 
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
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 116 ++++++++++++++++++
>  2 files changed, 140 insertions(+)
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
> index e1cee42a1683..59b485a57ffe 100644
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
> +	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* USB C Security (Fn+U, Fn+S) */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
>  
> @@ -373,6 +376,8 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
> +	u32 usbc_security_supported:1;
> +	bool usbc_security_enabled;
>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -11265,6 +11270,110 @@ static struct ibm_struct hwdd_driver_data = {
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
> + */
> +
> +/* USCS() return word bit layout */
> +#define USCS_CAP_BIT		BIT(16)	/* capability: feature present on SKU */
> +#define USCS_STATUS_BIT		BIT(0)	/* current security state */
> +
> +static DEFINE_MUTEX(usbc_security_mutex);

Please add a comment to document what the lock protects.

> +
> +/**
> + * usbc_security_query - read current USB-C security state via USCS()
> + * @enabled: out - true when security is ON (data connections blocked)
> + *
> + * Returns:
> + *   0        success, @enabled contains the current state
> + *  -EIO      ACPI evaluation failed
> + *  -ENODEV   capability bit absent; feature not present on this SKU*
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
> +	int err;
> +
> +	err = usbc_security_query(&tp_features.usbc_security_enabled);
> +	if (err == -ENODEV)
> +		return 0;
> +	if (err)
> +		return err;
> +
> +	tp_features.usbc_security_supported = true;
> +	return 0;
> +}
> +
> +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> +static bool tpacpi_usbc_security_hotkey(void)
> +{
> +	if (!tp_features.usbc_security_supported)
> +		return false;
> +
> +	if (usbc_security_query(&tp_features.usbc_security_enabled))
> +		return false;
> +
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
> @@ -11325,6 +11434,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
>  	&hwdd_attr_group,
> +	&usbc_security_attr_group,
>  	NULL,
>  };
>  
> @@ -11479,6 +11589,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  	case TP_HKEY_EV_PROFILE_TOGGLE2:
>  		platform_profile_cycle();
>  		return true;
> +	case TP_HKEY_EV_USB_C_SECURITY:
> +		return tpacpi_usbc_security_hotkey();
>  	}
>  
>  	return false;
> @@ -11930,6 +12042,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

