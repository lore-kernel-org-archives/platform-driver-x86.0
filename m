Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119962E11BC;
	Wed,  3 Dec 2025 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755059; cv=none; b=sTHlU6Wy0R3yblA3yOxbK8GGhnBBTo1jm41v/M+ELbGQdfJJTjcJpxngidN9eMlkcqe4J6YRr4elpJTxkQOnRcd9Pr1cNpm0kzVtsFPb4xCsy4Rk1xiJwqw9QqWYhA4v08VMrRalafoqUKi5LAJ7VMn1S+51HjlTb1UOGfFHRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755059; c=relaxed/simple;
	bh=LdBhpWg8/eykStJzqctbNnJJCbhQLZgKsJX8yI2zxBM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tg+LPyLWhWPNaUQ45m3UoQExa1afkv+lkordnqXRn5o8vzMf0J4X07STeTmLh36PRL7oFdJfCaZi3YXzwmuotRsE/YmooBCtJB6u7iyhvHWz0ZI0WzFKNL+0xKj9LiHW91jdXnn+SV1J39YotDvnx86KWBbRTSoHkafoiSuRwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQVHg5Mx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQVHg5Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764755057; x=1796291057;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LdBhpWg8/eykStJzqctbNnJJCbhQLZgKsJX8yI2zxBM=;
  b=LQVHg5MxgSpH03O1DrpOQJpOLH8VdIg6+HAMDTYgDrnqWzO7gMbtVDjW
   2m4ot48PH+y0TbGMideoObG2kfgih9kWelENKK85v2rRrbEwe70BN1GZN
   opvwZaYIMCAjM5aV6f6oXOyPDYn3m2QHGPmF7O0d5xlgMB3G48ynT38I0
   V009FPetvfWMyZ3OfFQdNygPJ4739YH+6JC4crJMwkrWbBU06gMnW+QCT
   6p2uUS+6fWj0Cfz2IM7ojOdl9Q7pNndNH4RiQd3OPWC0dTHKOqfUGC8jo
   kekEGpLwsVgOLXrzWq6cprAneZsNa86El8hs1othq/CYXEu/FQBKOxyxA
   w==;
X-CSE-ConnectionGUID: SqzbUPQlR4eV7LpkRNK1/A==
X-CSE-MsgGUID: xd4VBo+rSH6bg77+X1VR7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78090120"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="78090120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:44:16 -0800
X-CSE-ConnectionGUID: FHmLhG/STHinNyhd3FVlRw==
X-CSE-MsgGUID: x3/lQIw0ReW33+MFvfp8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199759583"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:44:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 3 Dec 2025 11:44:09 +0200 (EET)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
In-Reply-To: <20251203034032.6018-1-nitjoshi@gmail.com>
Message-ID: <22f766d6-9010-3e87-f05b-bfd9b5888881@linux.intel.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Nitin Joshi wrote:

> Thinkpads are adding the ability to detect and report hardware damage
> status. Add new sysfs interface to identify the impacted component
> with status.
> Initial support is available for the USB-C replaceable connector.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>  2 files changed, 205 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 4ab0fef7d440..4a3220529489 100644
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
> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>  The exact semantics of the attributes may be found in
>  Documentation/ABI/testing/sysfs-class-power.
>  
> +Hardware damage detection capability
> +-----------------
> +
> +sysfs attributes: hwdd_status
> +
> +Thinkpads are adding the ability to detect and report hardware damage.
> +Add new sysfs interface to identify the impacted component.
> +Initial support is available for the USB-C replaceable connector.
> +
> +The available commands are::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
> +
> +This value displays device type and location of device with damage status.
> +For example:
> +if no damage is detected:
> +  No damage detected
> +if damage detected:
> +  Damage detected:
> +  Device: TYPE-C
> +  Location: Base, Right side, Center port
> +
> +The property is read-only. If feature is not supported then sysfs
> +class is not created.
> +
>  Multiple Commands, Module Parameters
>  ------------------------------------
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..c3629bed9a8e 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11080,6 +11080,180 @@ static const struct attribute_group auxmac_attr_group = {
>  	.attrs = auxmac_attributes,
>  };
>  
> +/*************************************************************************
> + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
> + */
> +
> +#define HWDD_GET_DMG_USBC 0x80000001
> +#define HWDD_GET_CAP 0
> +#define HWDD_NOT_SUPPORTED BIT(31)
> +#define HWDD_SUPPORT_USBC BIT(0)

Align values.

> +#define HWDD_GET_CAP       0
> +
> +#define DAMAGE_STATUS_BIT  BIT(0)
> +#define PORT_STATUS_OFFSET  4
> +#define LID_STATUS_OFFSET  8
> +#define BASE_STATUS_OFFSET 12
> +#define PORT_DETAIL_OFFSET 16
> +
> +#define PORT_POS_OFFSET    2
> +#define PORT_LOC_MASK      0x3
> +
> +#define PANEL_TOP   0
> +#define PANEL_BASE  1
> +#define PANEL_LEFT  2
> +#define PANEL_RIGHT 3
> +
> +#define POS_LEFT    0
> +#define POS_CENTER  1
> +#define POS_RIGHT   2
> +
> +#define NUM_PORTS 4

Add an empty line

> +static bool hwdd_support_available;
> +static bool ucdd_supported;

Add an empty line

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
> +static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
> +{
> +	unsigned char lid_status, base_status, port_status;
> +	unsigned char loc_status, pos_status, panel_status;
> +	bool damage_detected = false;
> +	unsigned int i;
> +
> +	port_status = (dmg_status >> PORT_STATUS_OFFSET) & 0xF;
> +	lid_status = (dmg_status >> LID_STATUS_OFFSET) & 0xF;
> +	base_status = (dmg_status >> BASE_STATUS_OFFSET) & 0xF;

Define these as fields using GENMASK() and use FIELD_GET() here. Don't 
forget to check you also have the includes for those.

> +	for (i = 0; i < NUM_PORTS; i++) {
> +		if (dmg_status & BIT(i)) {
> +			if (port_status & BIT(i)) {

Reverse the logic in these and use continue to bring down indentation 
level.

> +				*count += sysfs_emit_at(buf, *count, "%s damage detected:\n", type);
> +				loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
> +				pos_status = (loc_status  >> PORT_POS_OFFSET) & PORT_LOC_MASK;

Extra space & use FIELD_GET().

> +				panel_status = loc_status & PORT_LOC_MASK;
> +
> +				*count += sysfs_emit_at(buf, *count, "Location: ");
> +				if (lid_status & BIT(i))
> +					*count += sysfs_emit_at(buf, *count, "Lid, ");
> +				if (base_status & BIT(i))
> +					*count += sysfs_emit_at(buf, *count, "Base, ");
> +
> +				switch (pos_status) {
> +				case PANEL_TOP:
> +					*count += sysfs_emit_at(buf, *count, "Top, ");
> +					break;
> +				case PANEL_BASE:
> +					*count += sysfs_emit_at(buf, *count, "Bottom, ");
> +					break;
> +				case PANEL_LEFT:
> +					*count += sysfs_emit_at(buf, *count, "Left, ");
> +					break;
> +				case PANEL_RIGHT:
> +					*count += sysfs_emit_at(buf, *count, "Right, ");
> +					break;

Some checkers likely won't be happy if you're not having default: at all, 
even if it is unnecessary here. So add something like this:

				default:
					WARN_ON(1);
					return ...;

> +				};
> +
> +				switch (panel_status) {
> +				case POS_LEFT:
> +					*count += sysfs_emit_at(buf, *count, "Left port\n");
> +					break;
> +				case POS_CENTER:
> +					*count += sysfs_emit_at(buf, *count, "Center port\n");
> +					break;
> +				case POS_RIGHT:
> +					*count += sysfs_emit_at(buf, *count, "Right port\n");
> +					break;
> +				default:
> +					*count += sysfs_emit_at(buf, *count, "Undefined\n");
> +					break;
> +				};
> +				damage_detected = true;
> +			}
> +		}
> +	}
> +	return damage_detected;
> +}
> +
> +/* sysfs typc damage detection capability */
> +static ssize_t hwdd_status_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	bool damage_detected = false;
> +	unsigned int damage_status;
> +	int err, count = 0;
> +
> +	if (ucdd_supported) {
> +		/* Get USB TYPE-C damage status */
> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +		if (err)
> +			return err;
> +
> +		if (display_damage(buf, &count, "Type-C", damage_status))
> +			damage_detected = true;
> +	}
> +
> +	if (!damage_detected)
> +		count  = count + sysfs_emit_at(buf, count, "No damage detected\n");

Extra space, please also use += instead.

> +
> +	return count;
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
> @@ -11139,6 +11313,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&kbdlang_attr_group,
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
> +	&hwdd_attr_group,
>  	NULL,
>  };
>  
> @@ -11752,6 +11927,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

-- 
 i.

