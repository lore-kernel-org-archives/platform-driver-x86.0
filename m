Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7B36F430;
	Mon,  8 Jun 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925167; cv=none; b=C+TV7Jy9Hzg2WON4YX/JYlDcBZSXstwQIi9gBJnYYRl6Gaj+dFblO0EPOOpZSgH+CB60R2TJJo1dur6KRQJbBWX0ZTmyLQABLsMfXmQwokABELyXQiCD4b5Nrx344zFBL0VSRQy6uaM7SNUxM8M2BUJUuo+vURDpfcHo0DKdbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925167; c=relaxed/simple;
	bh=WajvgV95ai0Nu+LqPU/Pm73ruJd9YVeHSyUi5kA7kpo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YJeESqEyzHmKAX7te4ukPUrSpMIsBmFuJci2SrF72LtGEwLS5YZLrwZ4JvVrzR08Mp1kY+9yYNJa5Q3UyxoAVPC9n1DWhiZESSTuqNA6zIwh4AyWq2uEAPdpimnQWF+rvXsvJhWswjcrqIf5zWtCmXlPr7dCXOoljZRjiD6j02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwKUp7YS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwKUp7YS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780925165; x=1812461165;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WajvgV95ai0Nu+LqPU/Pm73ruJd9YVeHSyUi5kA7kpo=;
  b=kwKUp7YSw6fJ0g6nCqid0CpdlO3au5pS/y6acrwE1LHB77Hi3cPdi9Gn
   Yj4Q2b451oi/zBMxUAFqc/akDiB8IOJvng2v/GxoUZiDbD1/jQUFJFmjz
   QwhwsgzfL+K6zVLiJBIeRDsLzmWt/GfDKvUKBOBdYuN+5qBlp9zTeimD/
   VrNf+Wk+8VTwGIUlDrP5BtWkdmZXmu0Lq0CRA6faHx7cR+CTP2K0LNeJ6
   ys6wJCXVDCGqOda1lOxNh2Nh6ftkIF5fT67JG/wtTIFubmGTAqtmOBX+p
   uV670ona34hC4r0zOXHGLw0nhReXih+AKO3W83sRrnph4xXqQtnboMG0O
   A==;
X-CSE-ConnectionGUID: iFaovZ+FRR+hBFxARyriAw==
X-CSE-MsgGUID: S0WVmd1KSTCWc352UnN1iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81841453"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81841453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:26:04 -0700
X-CSE-ConnectionGUID: 693LKol0Ts+i4BHqyr5zFA==
X-CSE-MsgGUID: QOR70cKiSNKpthK2Du75Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="249844306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:26:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 16:25:58 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>, Hans de Goede <hansg@kernel.org>
cc: platform-driver-x86@vger.kernel.org, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: add fan speed mode for
 newer models
In-Reply-To: <20260603011934.43467-1-alexyeo362@gmail.com>
Message-ID: <bc272424-9ec6-8f3b-19c1-89fded10e230@linux.intel.com>
References: <20260603011934.43467-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jun 2026, Alex Yeo wrote:

> I have a CF-SR4 and Linux works out of the box. Compared to
> previous models, this one seems to have the fans running at high speed
> by default when the computer starts.
> 
> When Windows 11 is booted up, the high fan speeds persist just until the
> login screen. Once the login screen shows up, the fan spins down.
> 
> I had suspected that this might be the laptop ramping down the fans when
> the OS declares that it is Windows but this does not seem to be the
> case.
> 
> After analyzing the DSDT and SSDT of the computer, I have found the
> following:
> 
> File ssdt10.dsl under \_SB.PC00.LPCB.EC0:
> 
> Name (CEFM, Zero)
> Method (SEFM, 1, Serialized)
> {
>     CEFM = Arg0
>     REFM ()
> }
> 
> Method (REFM, 0, Serialized)
> {
>     If ((\S0IX == 0x03))
>     {
>         Local0 = 0x05
>     }
>     ElseIf ((CEFM == Zero))
>     {
>         Local0 = Zero
>     }
>     Else
>     {
>         Local0 = 0x02
>     }
> 
>     \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
> }
> 
> \_SB.PC00.LPCB.EC0.CEFM would seem be the current value
> for the fan profile. On startup, this is set to 0.
> 
> Based on the code SEFM seems the be the method to set the fan
> profile and REFM is executed right after.
> 
> I don't have access to information as to what the argument officially
> means but based on testing, any number above zero makes the fans spin
> down and behave like the older models where it stops or runs at low
> speed when its cool and ramps up when the processor gets hot.
> 
> The only relevant values for CEFM seem to be just 0 and any number above
> that just gets treated the same. I personally use just 0 and 1.
> 0 seems to be the high fan speed mode and 1 makes it behave like
> Windows.
> 
> Giving 0 as an argument reverts the fan back to the way it was during
> startup where the lowest fan speed is quite high and when load is
> applied, it seems to ramp up to an even higher speed which I think would
> be its 100%.
> 
> A value of 1 seems to have its max speed capped lower than 0.
> 
> For both modes, fan management is still automatic.
> 
> fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
> \_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
> show up on unsupported models. I have tried not hiding it and it just
> outputs a generic error when the value is read.
> 
> I also saw that variables such as eco_mode are kept in memory, however
> for fan_mode I rely on getting and setting the value via ACPI.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 98 +++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index b83113c26f88..3a8bbd633fd1 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -507,6 +507,76 @@ static int set_optd_power_state(int new_state)
>  	return result;
>  }
>  
> +/* on newer models (ex: CF-SR4), fan mode can be set */
> +/* check if this is available */
> +
> +static acpi_status check_fan_mode_present(void)
> +{
> +	acpi_status status = AE_OK;

Unnecessary initialization.

> +	acpi_handle handle;
> +
> +	/* check if read and set are available */
> +	/* read fan speed profile */

The second comment line and the one below seems mostly duplicate 
information so please drop them. If you want, you can to the first line: 

	/* Check if read (CEFM) and set (SEFM) are available */

> +	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
> +	if (ACPI_FAILURE(status))
> +		goto out;

You should return directly from here.

And please return something else than acpi_status from this function.

> +	/* set fan speed profile */
> +	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
> +	if (ACPI_FAILURE(status))
> +		goto out;
> +
> +out:
> +	return status;
> +}
> +
> +/* get fan mode state */
> +

Remove blank line.

> +static int get_fan_mode_state(void)
> +{
> +	acpi_status status;
> +	unsigned long long state;

Please use reverse xmas-tree order.

> +
> +	/* bios default is zero which seems to be some sort of performance mode */

BIOS

> +	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL, &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("evaluation error _SB.PC00.LPCB.EC0.CEFM\n");
> +		state = -EIO;

Just return directly.

> +	}
> +	int result = (int)state;

This intermediate variable doesn't seem useful and is declared in wrong 
place anyway.

> +	return result;
> +}
> +
> +/* set fan mode */
> +
> +static int set_fan_mode_state(int new_state)
> +{
> +	int result;
> +	acpi_status status;

xmas-tree order.

> +
> +	result = get_fan_mode_state();
> +	if (result < 0)
> +		goto out;
> +	if (new_state == result)
> +		goto out;
> +
> +	union acpi_object param[1];
> +	struct acpi_object_list input;
> +
> +	param[0].type = ACPI_TYPE_INTEGER;
> +	param[0].integer.value = new_state;
> +	input.count = 1; /* takes one arg */
> +	input.pointer = param;
> +
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM",
> +			&input, NULL);

Please align to (

> +	if (ACPI_FAILURE(status)) {
> +		pr_err("_SB.PC00.LPCB.EC0.SEFM evaluation failed\n");

Please write the error messages so that they are meaningful for 
non-technical users.

Include for pr_err() is missing it seems.

> +		return -EINVAL;
> +	}
> +out:
> +	return result;
> +}
> +
>  
>  /* sysfs user interface functions */
>  
> @@ -778,6 +848,29 @@ static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static ssize_t fan_mode_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	int state = get_fan_mode_state();
> +
> +	if (state < 0)

As per kernel's coding style, call and its error handling should not have 
an empty line in between them (and a blank line is required after local 
var declarations) so you need to declarate variable first without 
assigning to it on the same line.

> +		return state;
> +
> +	return sysfs_emit(buf, "%d\n", state);

This file seems to be lacking sysfs.h, please add the include now.

> +}
> +
> +static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	int err, val;
> +
> +	err = kstrtoint(buf, 10, &val);

kstrtouint()?

But I'm unsure whether sysfs is right place for this interface. acer-wmi 
driver seems to have fan mode auto/turbo selection using hwmon interface 
but this driver doesn't have hwmon as is...

> +	if (err)
> +		return err;
> +	set_fan_mode_state(val);
> +	return count;
> +}
> +
>  static DEVICE_ATTR_RO(numbatt);
>  static DEVICE_ATTR_RO(lcdtype);
>  static DEVICE_ATTR_RW(mute);
> @@ -787,6 +880,7 @@ static DEVICE_ATTR_RW(ac_brightness);
>  static DEVICE_ATTR_RW(dc_brightness);
>  static DEVICE_ATTR_RW(current_brightness);
>  static DEVICE_ATTR_RW(cdpower);
> +static DEVICE_ATTR_RW(fan_mode);
>  
>  static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
>  {
> @@ -803,6 +897,9 @@ static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr
>  	if (attr == &dev_attr_current_brightness.attr)
>  		return (pcc->num_sifr > SINF_CUR_BRIGHT) ? attr->mode : 0;
>  
> +	if (attr == &dev_attr_fan_mode.attr) /* mostly present on newer models */
> +		return (ACPI_SUCCESS(check_fan_mode_present())) ? attr->mode : 0;
> +
>  	return attr->mode;
>  }
>  
> @@ -816,6 +913,7 @@ static struct attribute *pcc_sysfs_entries[] = {
>  	&dev_attr_dc_brightness.attr,
>  	&dev_attr_current_brightness.attr,
>  	&dev_attr_cdpower.attr,
> +	&dev_attr_fan_mode.attr,
>  	NULL,
>  };
>  
> 

-- 
 i.

