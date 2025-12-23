Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915BD335550;
	Tue, 23 Dec 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492103; cv=none; b=L3bhfdEOjx+IP80/Kb5tqBMM/4yM702Cwbr39gibmQDOxGEBYi9N/CGeI1UIwlNS8D4tQPniecTyjdbHTmUwkekjDACNCu4p74XeftYAOBuew6Z1mLGYjhETZGKFIvyaU0tWwiEQxhkqG+FJnyC0/bTrZ1aFkINB7Hw1SAXXPhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492103; c=relaxed/simple;
	bh=L+08YRMeX1yIw69iq81eywxqmxk/cMV4uDhNi4qBYkM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NudUmwtTE91E+PjrItQ3oGmqOOMbQ3JkGt7AY3L42ogRuNq1O8zqJ51nUtR1lFjTlMxFaxyLIn7C7iqZ0D2gHPcuNuy1qnAJ4PCUXjhWM3mE/dQ1LJoSobZeXIySK2TR+au5CCjuKo+81Jb6rLH2iNPy2hRNoW5UtxPU3uHMFRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1wnvS5V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1wnvS5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766492100; x=1798028100;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=L+08YRMeX1yIw69iq81eywxqmxk/cMV4uDhNi4qBYkM=;
  b=m1wnvS5VtDTmYMrmVaU3SJ3YQ/TQsF8Ilo9ih3iEA9VFamPGsqSWY982
   TMcsgKO6IRUVHvtj5nMloUO6fs0SzwkUb/5QQyF38ssG/+xtvY9lTdnPB
   g99Q4/7pht4WrCBLJYKKJsm9RsWedK0LuXjoXxC2OTYyb4K/Ciq5tHbYS
   Q6RZWZoIekP4dkJFOWhzdnQLkI38XLS1iFeeHu4M/4NiJWEj+Y07QSBo1
   ytVcAtfBrYJ4sd/UFFlerwBBclhO/U791bkarzzzamkXPLOSWWIjlfEP5
   wl5MzkVHI3G5bmLCqU4KhUdYMqZAuxWbd0kkSKjwfM1XncpTOsfa2nWgu
   g==;
X-CSE-ConnectionGUID: cCuuP6oPSSWVuxfqnNWxsA==
X-CSE-MsgGUID: F/NoHE3PSQWvFTBsqS9ELQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67334652"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="67334652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:14:59 -0800
X-CSE-ConnectionGUID: yHtsWi2lQ6O1Hp4sZ5+vPw==
X-CSE-MsgGUID: NUf7zR4pQ+SNmHtgRhrguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="237181182"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:14:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 23 Dec 2025 14:14:53 +0200 (EET)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v5 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
In-Reply-To: <20251217065523.48399-1-nitjoshi@gmail.com>
Message-ID: <5ba8fe79-ff4f-2dc1-f80d-8e3a32a29efa@linux.intel.com>
References: <20251217065523.48399-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Dec 2025, Nitin Joshi wrote:

> Thinkpads are adding the ability to detect and report hardware damage
> status. Add new sysfs interface to identify whether hardware damage
> is detected or not.
> 
> Initial support is available for the USB-C replaceable connector.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
> Changes since v1:
> -Split patch between hwdd_status and hwdd_detail
> -Incorporated review comments
> Changes since v2:
> -Control visibility of the sysfs attribute based upon ucdd_supported
> Changes since v3:
> -Fix documentation build warning
> Changes since v4:
> -Removed extra line
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 105 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 4ab0fef7d440..2db05f718b11 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -54,6 +54,7 @@ detailed description):
>  	- Setting keyboard language
>  	- WWAN Antenna type
>  	- Auxmac
> +	- Hardware damage detection capability
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1576,6 +1577,26 @@ percentage level, above which charging will stop.
>  The exact semantics of the attributes may be found in
>  Documentation/ABI/testing/sysfs-class-power.
>  
> +Hardware damage detection capability
> +------------------------------------
> +
> +sysfs attributes: hwdd_status
> +
> +Thinkpads are adding the ability to detect and report hardware damage.
> +Add new sysfs interface to identify the damaged device status.
> +Initial support is available for the USB-C replaceable connector.
> +
> +The command to check device damaged status is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
> +
> +This value displays status of device damaged
> +- 0 = Not Damaged
> +- 1 = Damaged
> +
> +The property is read-only. If feature is not supported then sysfs
> +attribute is not created.
> +
>  Multiple Commands, Module Parameters
>  ------------------------------------
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..cb1f6dae9334 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11080,6 +11080,106 @@ static const struct attribute_group auxmac_attr_group = {
>  	.attrs = auxmac_attributes,
>  };
>  
> +/*************************************************************************
> + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
> + */
> +
> +#define HWDD_GET_DMG_USBC	0x80000001
> +#define HWDD_GET_CAP		0
> +#define HWDD_NOT_SUPPORTED	BIT(31)
> +#define HWDD_SUPPORT_USBC	BIT(0)
> +
> +#define PORT_STATUS		GENMASK(7, 4)
> +#define NUM_PORTS		4
> +
> +static bool hwdd_support_available;
> +static bool ucdd_supported;
> +
> +static int hwdd_command(int command, int *output)
> +{
> +	acpi_handle hwdd_handle;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "HWDD", &hwdd_handle)))
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(hwdd_handle, output, NULL, "dd", command))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/* sysfs type-c damage detection capability */
> +static ssize_t hwdd_status_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	unsigned int damage_status, port_status;
> +	int err, i;
> +
> +	if (ucdd_supported) {
> +		/* Get USB TYPE-C damage status */
> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +		if (err)
> +			return err;
> +
> +		port_status = FIELD_GET(PORT_STATUS, damage_status);
> +		for (i = 0; i < NUM_PORTS; i++) {
> +			if (!(damage_status & BIT(i)))
> +				continue;
> +			if (port_status & BIT(i))
> +				return sysfs_emit(buf, "1\n");
> +		}
> +	} else
> +		return -ENODEV;

The usual approach is to first check not supported + return errno, then 
you don't even need "else". The same comment to the other patch.

-- 
 i.


> +
> +	return sysfs_emit(buf, "0\n");
> +}
> +static DEVICE_ATTR_RO(hwdd_status);
> +
> +static struct attribute *hwdd_attributes[] = {
> +	&dev_attr_hwdd_status.attr,
> +	NULL
> +};
> +
> +static umode_t hwdd_attr_is_visible(struct kobject *kobj,
> +				struct attribute *attr, int n)
> +{
> +	return hwdd_support_available ? attr->mode : 0;
> +}
> +
> +static const struct attribute_group hwdd_attr_group = {
> +	.is_visible = hwdd_attr_is_visible,
> +	.attrs = hwdd_attributes,
> +};
> +
> +static int tpacpi_hwdd_init(struct ibm_init_struct *iibm)
> +{
> +	int err, output;
> +
> +	/* Below command checks the HWDD damage capability */
> +	err = hwdd_command(HWDD_GET_CAP, &output);
> +	if (err)
> +		return err;
> +
> +	if (!(output & HWDD_NOT_SUPPORTED))
> +		return -ENODEV;
> +
> +	hwdd_support_available = true;
> +
> +	/*
> +	 * BIT(0) is assigned to check capability of damage detection is
> +	 * supported for USB Type-C port or not.
> +	 */
> +	if (output & HWDD_SUPPORT_USBC)
> +		ucdd_supported = true;
> +
> +	return err;
> +}
> +
> +static struct ibm_struct hwdd_driver_data = {
> +	.name = "hwdd",
> +};
> +
>  /* --------------------------------------------------------------------- */
>  
>  static struct attribute *tpacpi_driver_attributes[] = {
> @@ -11139,6 +11239,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&kbdlang_attr_group,
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
> +	&hwdd_attr_group,
>  	NULL,
>  };
>  
> @@ -11752,6 +11853,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = auxmac_init,
>  		.data = &auxmac_data,
>  	},
> +	{
> +		.init = tpacpi_hwdd_init,
> +		.data = &hwdd_driver_data,
> +	},
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 
