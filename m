Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEA3DD86C;
	Wed, 16 Sep 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568031; cv=none; b=Y6B0UznB4efmqD6McKzOkLQQKceADK4t7XWOIcfv1FWP0xGJItBQyqMs5fDhcymA/ZNtFdUoTLiikNvyqIH0TPFCva4WqRTJXdaA3a9B+8a4OCC49TJ9MOOnV2ogM2vGflvAuhraR+ssCA1oU3P/fL5PB4/iQNx3RgwfufJvkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568031; c=relaxed/simple;
	bh=eAEe1LKgzqTgJRY4ztn3bSQB27NXPUetf8PHJok5cHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KQ6zAEljvxkbv2ZysFZGN3iWdvxzY0vLz3ZpQK83wEcO2qM3eRoSbHTq4MRYy8QK9PuEzhkTinA7pEBhoUor6SGaYVAjb4MEIzwy16y1dy+/6xZTvcWhXkyVxfNOU3hKj+dxpzuahyung1yCesvSbbdNw6v8yuL7k6hwcIwqdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4eXPyel; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4eXPyel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568029; x=1821104029;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eAEe1LKgzqTgJRY4ztn3bSQB27NXPUetf8PHJok5cHE=;
  b=C4eXPyeldvYr5aYetgpB/eaiOWNZW6oLHffLBb8gMAbZdc6WyYVlIkJl
   kpe7fkVvo7CI2BcWQ/DCXPnfFJXcspK1gTfCdEekxWJCm0ekPeNa1KFku
   abHwn2uNU5Z+Fmji3n+7AmT+Cg59JlQJFteebxb4Fn0PnZzWpRZkgfPXR
   5arq5iVbT0H8hu3ID7jPRhOzYpIgYGBDYCX1bfttWd6ph8EjX0KfgCwIK
   BR5HaNbxp4zgcVXBSqDnFIUROKhkbSyv1zCecp4ItobUTFk4waxfvOQYt
   2zR2xcQ/2IRWxA3UcH6O44KJYZx++SJkQ71z8TPb2AzU66urt3noJEezi
   g==;
X-CSE-ConnectionGUID: 35zRtH6ETsWdnZHYHN1hug==
X-CSE-MsgGUID: ZmPES2JJQpKRyJzufrXdhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453470"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:13:48 -0700
X-CSE-ConnectionGUID: UpHUtbRjR4OJBSv0NHQtWg==
X-CSE-MsgGUID: 7YXH6ImaRjyJRWDnyFbg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303239830"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:13:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 17:13:41 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 1/1] platform/x86: panasonic-laptop: add
 platform_profile support
In-Reply-To: <20260805180544.1134916-2-alexyeo362@gmail.com>
Message-ID: <4a918d1e-490b-3236-b72b-ef952e11a1a3@linux.intel.com>
References: <20260805180544.1134916-1-alexyeo362@gmail.com> <20260805180544.1134916-2-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Aug 2026, Alex Yeo wrote:

> Expose firmware thermal and power management policies via the
> platform_profile interface.
> 
> Supported and tested models:
>  - CF-RZ6 (2016)
>  - CF-SV8 (2019)
>  - CF-QV9 (2020)
>  - CF-SR4 (2024)
> 
> Firmware fan operating mode and the TDP limit switch are mapped onto
> the Linux platform_profile ABI.
> 
> This implementation queries the firmware for every get().
> CUSTOM is returned when the current state is not recognized.
> The set() callback writes the values regardless of what the
> current fan mode and TDP limit is.
> 
>  - DMI quirks restrict support to tested models
>  - Missing includes such as sysfs.h were added based on previous
>    feedback.
>  - Logging: pr_fmt added
>  - When raising TDP, fan mode is switched first
>  - When limiting TDP, TDP limit is applied first
>  - ACPI handle for the EC device was used as the EC path varies
>    slightly between models.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 380 ++++++++++++++++++++++++
>  1 file changed, 380 insertions(+)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 719add753cb3..eeb89892768b 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -119,10 +119,16 @@
>   *		- v0.1  start from toshiba_acpi driver written by John Belmonte
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/ctype.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/i8042.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
> @@ -130,13 +136,18 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/serio.h>
>  #include <linux/slab.h>
> +#include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <acpi/video.h>
>  
> +DEFINE_FREE(acpi_dev_put, struct acpi_device *, if (_T) acpi_dev_put(_T))
> +
>  MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
>  MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
>  MODULE_AUTHOR("Harald Welte <laforge@gnumonks.org>");
> @@ -158,12 +169,39 @@ MODULE_LICENSE("GPL");
>  #define ECO_MODE_OFF		0x00
>  #define ECO_MODE_ON		0x80
>  
> +#define PCC_ACPI_FAN_ACTIVE_MODE	0x00
> +#define PCC_ACPI_FAN_PASSIVE_MODE	0x01
> +#define PCC_ACPI_TDP_LIMIT_ON		0x01
> +#define PCC_ACPI_TDP_LIMIT_OFF		0x00
> +
>  #define ACPI_PCC_DRIVER_NAME	"Panasonic Laptop Support"
>  #define ACPI_PCC_DEVICE_NAME	"Hotkey"
>  #define ACPI_PCC_CLASS		"pcc"
>  
>  #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
>  
> +enum pcc_fan_mode {
> +	PCC_FAN_MODE_UNSET = 0,
> +	PCC_FAN_MODE_ACTIVE,
> +	PCC_FAN_MODE_PASSIVE,
> +};
> +
> +enum pcc_tdp_mode {
> +	PCC_TDP_MODE_UNSET = 0,
> +	PCC_TDP_MODE_LOCKED,
> +	PCC_TDP_MODE_UNLOCKED,
> +};
> +
> +struct pcc_platform_profile {
> +	enum pcc_fan_mode fan_mode;
> +	enum pcc_tdp_mode tdp_mode;
> +};
> +
> +struct pcc_quirk {
> +	bool use_platform_profiles;
> +	struct pcc_platform_profile platform_profiles[PLATFORM_PROFILE_LAST];
> +};
> +
>  /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
>     ECO_MODEs: 0x03 = off, 0x83 = on
>  */
> @@ -239,6 +277,7 @@ static const struct key_entry panasonic_keymap[] = {
>  
>  struct pcc_acpi {
>  	acpi_handle		handle;
> +	acpi_handle		ec_handle;
>  	unsigned long		num_sifr;
>  	int			sticky_key;
>  	int			eco_mode;
> @@ -246,13 +285,111 @@ struct pcc_acpi {
>  	int			ac_brightness;
>  	int			dc_brightness;
>  	int			current_brightness;
> +	const struct pcc_quirk	*quirks;
>  	struct acpi_device	*device;
>  	struct input_dev	*input_dev;
>  	struct backlight_device	*backlight;
>  	struct platform_device	*platform;
> +	struct device		*platform_profile_dev;
>  	u32			sinf[] __counted_by(num_sifr);
>  };
>  
> +static struct pcc_quirk quirk_cf_sr4 = {
> +	.use_platform_profiles = true,
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_QUIET] =  {

There's extra space in all these.

> +			.fan_mode = PCC_FAN_MODE_PASSIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_COOL] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_quirk quirk_cf_qv9 = {
> +	.use_platform_profiles = true,
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_quirk quirk_cf_sv8 = {
> +	.use_platform_profiles = true,
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_quirk quirk_cf_rz6 = {
> +	.use_platform_profiles = true,
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] =  {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static const struct dmi_system_id pcc_quirks[] = {
> +	{
> +		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
> +		},
> +		.driver_data = &quirk_cf_sr4,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFQV9-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFQV9-1"),
> +		},
> +		.driver_data = &quirk_cf_qv9,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFSV8-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSV8-2"),
> +		},
> +		.driver_data = &quirk_cf_sv8,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFRZ6-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFRZ6-2"),
> +		},
> +		.driver_data = &quirk_cf_rz6,
> +	},
> +	{},
> +};
> +
>  /*
>   * On some Panasonic models the volume up / down / mute keys send duplicate
>   * keypress events over the PS/2 kbd interface, filter these out.
> @@ -958,6 +1095,207 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
>  	return error;
>  }
>  
> +static int pcc_fan_mode_get(struct pcc_acpi *pcc, enum pcc_fan_mode *fan_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(pcc->ec_handle, "CEFM", NULL,
> +				       &state);

Fits to one line.

> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot get fan mode via CEFM\n");
> +		return -EIO;
> +	}
> +
> +	if (state == PCC_ACPI_FAN_ACTIVE_MODE)
> +		*fan_mode = PCC_FAN_MODE_ACTIVE;
> +	else if (state == PCC_ACPI_FAN_PASSIVE_MODE)
> +		*fan_mode = PCC_FAN_MODE_PASSIVE;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int pcc_tdp_mode_get(struct pcc_acpi *pcc, enum pcc_tdp_mode *tdp_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(pcc->ec_handle, "EPLE", NULL,
> +				       &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot read power limit using EPLE\n");
> +		return -EIO;
> +	}
> +
> +	if (state == PCC_ACPI_TDP_LIMIT_ON)
> +		*tdp_mode = PCC_TDP_MODE_LOCKED;
> +	else if (state == PCC_ACPI_TDP_LIMIT_OFF)
> +		*tdp_mode = PCC_TDP_MODE_UNLOCKED;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int pcc_fan_mode_set(struct pcc_acpi *pcc, enum pcc_fan_mode fan_mode)
> +{
> +	acpi_status status;
> +
> +	switch (fan_mode) {
> +	case PCC_FAN_MODE_ACTIVE:
> +		status = acpi_execute_simple_method(pcc->ec_handle,
> +						    "SEFM",
> +						    PCC_ACPI_FAN_ACTIVE_MODE);
> +		break;
> +	case PCC_FAN_MODE_PASSIVE:
> +		status = acpi_execute_simple_method(pcc->ec_handle,
> +						    "SEFM",
> +						    PCC_ACPI_FAN_PASSIVE_MODE);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("failed to set fan mode via SEFM\n");
> +		return -EIO;
> +	}

IMO, spreading stuff around like this just makes it harder to follow code 
flow. And the variation is just to pass a different argument to 
acpi_execute_simple_method() which would suggest a helper would be useful.

Once everything is done within the case, you can directly return from 
those cases for simplicity.

> +
> +	return 0;
> +}
> +
> +static int pcc_tdp_mode_set(struct pcc_acpi *pcc, enum pcc_tdp_mode tdp_mode)
> +{
> +	acpi_status status;
> +
> +	switch (tdp_mode) {
> +	case PCC_TDP_MODE_LOCKED:
> +		status = acpi_execute_simple_method(pcc->ec_handle,
> +						    "SEPL",
> +						    PCC_ACPI_TDP_LIMIT_ON);
> +		break;
> +	case PCC_TDP_MODE_UNLOCKED:
> +		status = acpi_execute_simple_method(pcc->ec_handle,
> +						    "SEPL",
> +						    PCC_ACPI_TDP_LIMIT_OFF);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("failed to set power mode via SEPL\n");
> +		return -EIO;
> +	}

Same problem here as above.

> +	return 0;
> +}
> +
> +static int pcc_platform_profile_get(struct device *dev, enum platform_profile_option *profile)
> +{
> +	struct pcc_acpi *pcc = dev_get_drvdata(dev);
> +	enum pcc_fan_mode fan_mode;
> +	enum pcc_tdp_mode tdp_mode;
> +	int status;
> +
> +	status = pcc_fan_mode_get(pcc, &fan_mode);
> +	if (status)
> +		return status;
> +
> +	status = pcc_tdp_mode_get(pcc, &tdp_mode);
> +	if (status)
> +		return status;

Please leave "status" for acpi_status and pick another name for the 
generic return variable (I personally prefer "ret" because it doesn't 
carry error connotation "err" does, but the latter seems to be already 
in use by this driver, among other variable names).

> +	for (enum platform_profile_option pp_opt = 0;

Move declaration to the beginning of the function.

> +	     pp_opt < PLATFORM_PROFILE_LAST;

Please use ARRAY_SIZE() + make sure you add the include for it.

> +	     pp_opt++) {
> +		enum pcc_fan_mode profile_fan_mode =
> +			pcc->quirks->platform_profiles[pp_opt].fan_mode;
> +		enum pcc_tdp_mode profile_tdp_mode =
> +			pcc->quirks->platform_profiles[pp_opt].tdp_mode;

Please make a local variable out of pcc->quirks->platform_profiles[pp_opt] 
instead (with a reasonably short name).

> +
> +		if (!(profile_fan_mode && profile_tdp_mode))

This code doesn't make sense for variables that are declared as enums 
(do not handle enums as truth values).

> +			continue;
> +
> +		if (tdp_mode == profile_tdp_mode && fan_mode == profile_fan_mode) {
> +			*profile = pp_opt;
> +			return 0;
> +		}
> +	}
> +
> +	*profile = PLATFORM_PROFILE_CUSTOM;
> +	return 0;
> +}
> +
> +static int pcc_platform_profile_set_profile(struct pcc_acpi *pcc,
> +					    enum pcc_fan_mode fan_mode,
> +					    enum pcc_tdp_mode tdp_mode)
> +{
> +	int status;

Change name.

> +
> +	switch (tdp_mode) {
> +	case PCC_TDP_MODE_UNLOCKED:
> +		status = pcc_fan_mode_set(pcc, fan_mode);
> +		if (status)
> +			return status;
> +
> +		return pcc_tdp_mode_set(pcc, tdp_mode);
> +	case PCC_TDP_MODE_LOCKED:
> +		status = pcc_tdp_mode_set(pcc, tdp_mode);
> +		if (status)
> +			return status;
> +
> +		return pcc_fan_mode_set(pcc, fan_mode);

This is structurally much easier to follow than pcc_fan_mode_set() above.

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_platform_profile_set(struct device *dev, enum platform_profile_option profile)
> +{
> +	struct pcc_acpi *pcc = dev_get_drvdata(dev);
> +	struct pcc_platform_profile pcc_profile;

Why isn't this a pointer?

> +	pcc_profile = pcc->quirks->platform_profiles[profile];

I'd put the assignment to the declaration line (it'll be only 91 chars 
long and is quite boilerplately so fits well into the variable 
declarations block, IMO)

> +	if (pcc_profile.fan_mode && pcc_profile.tdp_mode)

Again, those are enums but you treat them as truth values which makes 
things harder to understand.

> +		return pcc_platform_profile_set_profile(pcc,
> +							pcc_profile.fan_mode,
> +							pcc_profile.tdp_mode);
> +
> +	return -EINVAL;
> +}
> +
> +static int pcc_platform_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct pcc_acpi *pcc = drvdata;
> +
> +	for (enum platform_profile_option pp_opt = 0;
> +	     pp_opt < PLATFORM_PROFILE_LAST;
> +	     pp_opt++) {

Declare the enum in the function variables and put this to single line.

> +		enum pcc_fan_mode fan_mode =
> +			pcc->quirks->platform_profiles[pp_opt].fan_mode;
> +		enum pcc_tdp_mode tdp_mode =
> +			pcc->quirks->platform_profiles[pp_opt].tdp_mode;
> +
> +		if (fan_mode && tdp_mode) {

Same comments as with the other code.

> +			set_bit(pp_opt, choices);
> +		} else if (fan_mode || tdp_mode) {
> +			pr_err("error probing platform profiles: malformed quirk\n");

This looks a clear developer error so WARN_ON() would be more appropriate 
than pr_err().

> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops pcc_platform_profile_ops = {
> +	.probe = pcc_platform_profile_probe,
> +	.profile_get = pcc_platform_profile_get,
> +	.profile_set = pcc_platform_profile_set,
> +};
> +
>  /* kernel module interface */
>  
>  #ifdef CONFIG_PM_SLEEP
> @@ -979,8 +1317,37 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
>  }
>  #endif
>  
> +static int acpi_pcc_platform_profile_probe(struct pcc_acpi *pcc, struct platform_device *pdev)
> +{
> +	struct acpi_device *adev __free(acpi_dev_put) =
> +		acpi_dev_get_first_match_dev("PNP0C09", NULL, -1);
> +	int err;
> +
> +	if (!adev) {
> +		pr_err("failed to find embedded controller path\n");
> +		return -ENODEV;
> +	}
> +
> +	pcc->ec_handle = acpi_device_handle(adev);
> +
> +	pcc->platform_profile_dev =
> +		devm_platform_profile_register(&pdev->dev,
> +					       "panasonic-laptop",
> +					       pcc,
> +					       &pcc_platform_profile_ops);
> +	if (IS_ERR(pcc->platform_profile_dev)) {
> +		err = PTR_ERR(pcc->platform_profile_dev);
> +		pcc->platform_profile_dev = NULL;
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to register platform profiles\n");
> +	}
> +
> +	return 0;
> +}
> +
>  static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	struct backlight_properties props;
>  	struct acpi_device *device;
>  	struct pcc_acpi *pcc;
> @@ -1020,6 +1387,12 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
>  	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
>  
> +	dmi_id = dmi_first_match(pcc_quirks);
> +	if (dmi_id) {
> +		pcc->quirks = dmi_id->driver_data;
> +		pr_debug("quirk detect: enabled quirks for %s\n", dmi_id->ident);
> +	}
> +
>  	result = acpi_pcc_init_input(pcc);
>  	if (result) {
>  		pr_err("Error installing keyinput handler\n");
> @@ -1091,6 +1464,13 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  	}
>  
>  	i8042_install_filter(panasonic_i8042_filter, NULL);
> +
> +	if (pcc->quirks && pcc->quirks->use_platform_profiles) {
> +		result = acpi_pcc_platform_profile_probe(pcc, pdev);
> +		if (result)
> +			pr_warn("error occurred setting up platform profiles\n");
> +	}
> +
>  	return 0;
>  
>  out_platform:
> 

Also, this looked entirely independent of the existing code (?) so it 
looks as if it should be make a separate platform_driver instead of trying 
to klugde it into the existing probe. If there aren't cross references 
besides the sharing of the private data structure, I'd just introduce it 
as a separate struct platform_driver with a proper ID table and own probe, 
etc.

-- 
 i.

