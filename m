Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A7359F9D;
	Tue, 16 Dec 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887291; cv=none; b=qWG99PT9dMRKan7HwKfFFvjwUWb7inL5qACre8J934sc7/DHkjtidWv1GuhA8Igdy8PKLz+43T1GABn0gOCL2/Vf+viU4ftaGpiOKiXTfSgaZvuuzshR0qxwfgiZR/XJLye0bVCqctXKu60FhGY8NpF5ua9mByVTqLeLqIyrdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887291; c=relaxed/simple;
	bh=yB1rZFs5At0zBH6CFLwGLajWcQk4sJf4imQYNvu1g7s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M7dUzw2HEt9qPOqZ7oeOBZ9oLVetaXeIOTIZaY/WcFh63o6KBct7omQdkDT9/aUPV//kVnEtIbMijS2bvHcSq2U4kUX0Frfppj69ofoIDGjPCdvB6eMiLjtXSsudA9RtKt/7M/sBAQUSKbzyXPR3+1P0XJg2zg139ZZPIDGWhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSILMDN1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSILMDN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765887290; x=1797423290;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yB1rZFs5At0zBH6CFLwGLajWcQk4sJf4imQYNvu1g7s=;
  b=TSILMDN1rM3410sdJHFPVs1OtV3Zbi0/42wVEXZSDcAPmwihE//Xr5wf
   JhPjKCXwco3Cp80nvkhrH25hJI/e8bbHLd0/Pvh1373SZrZJ9/UjQglei
   YZiORD8qayf4rxMpl36wym/OX849ovZdtVJxe9ZYFFTeSpU5Ob+TsxrBg
   nWlOUOaCUJ1rKl6lPe6bP0ACjmkr8FCRsI9NiOcbnp+Q/fYWcAQI9By5S
   IUvUjH/86VfbyydV+dfeF2RCQtO9vwqJBvLQJQHDU0djC4zmKZsIlX3P1
   FldIx1GoFAAkLXYbKKaL+gSzr7q/Gi0JH78liUGdvkOwhk3H6k6mt7cfo
   Q==;
X-CSE-ConnectionGUID: o38LceQ9QaS8lv0tq6qMGg==
X-CSE-MsgGUID: oYrmoinSRgOO+yGyypHLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67875174"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67875174"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:14:49 -0800
X-CSE-ConnectionGUID: u+Yg+/srSG+m8+Za15icsA==
X-CSE-MsgGUID: viiYDS6+RdOnHz5738mvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197899135"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:14:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 14:14:42 +0200 (EET)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
    njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v4 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
In-Reply-To: <20251216120454.41076-2-nitjoshi@gmail.com>
Message-ID: <42c66ffc-8e36-c595-25bd-e58335087ba3@linux.intel.com>
References: <20251216120454.41076-1-nitjoshi@gmail.com> <20251216120454.41076-2-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Dec 2025, Nitin Joshi wrote:

> Add new sysfs interface to identify the impacted component with location of
> device.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
> Changes since v2:
> -Control visibility of the sysfs attribute based upon ucdd_supported
> Changes since v3:
> -Fix documentation build warning
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 114 +++++++++++++++++-
>  2 files changed, 122 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 2db05f718b11..3a37b14863a8 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>  Hardware damage detection capability
>  ------------------------------------
>  
> -sysfs attributes: hwdd_status
> +sysfs attributes: hwdd_status, hwdd_detail
>  
>  Thinkpads are adding the ability to detect and report hardware damage.
>  Add new sysfs interface to identify the damaged device status.
> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>  - 0 = Not Damaged
>  - 1 = Damaged
>  
> +The command to check location of damaged device is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
> +
> +This value displays location of damaged device having 1 line per damaged "item".
> +For example:
> +if no damage is detected:
> +- No damage detected
> +if damage detected:
> +- TYPE-C: Base, Right side, Center port
> +
>  The property is read-only. If feature is not supported then sysfs
>  attribute is not created.
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index b0f7dc0bd531..0dc6d7e07213 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11089,8 +11089,24 @@ static const struct attribute_group auxmac_attr_group = {
>  #define HWDD_NOT_SUPPORTED	BIT(31)
>  #define HWDD_SUPPORT_USBC	BIT(0)
>  
> -#define PORT_STATUS		GENMASK(7, 4)
> -#define NUM_PORTS		4
> +#define PORT_STATUS     GENMASK(7, 4)
> +#define LID_STATUS      GENMASK(11, 8)
> +#define BASE_STATUS     GENMASK(15, 12)
> +#define POS_STATUS      GENMASK(3, 2)
> +#define PANEL_STATUS    GENMASK(1, 0)
> +
> +#define PORT_DETAIL_OFFSET	16
> +
> +#define PANEL_TOP	0
> +#define PANEL_BASE	1
> +#define PANEL_LEFT	2
> +#define PANEL_RIGHT	3
> +
> +#define POS_LEFT	0
> +#define POS_CENTER	1
> +#define POS_RIGHT	2
> +
> +#define NUM_PORTS	4
>  
>  static bool hwdd_support_available;
>  static bool ucdd_supported;
> @@ -11108,7 +11124,96 @@ static int hwdd_command(int command, int *output)
>  	return 0;
>  }
>  
> -/* sysfs type-c damage detection capability */
> +static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
> +{
> +	unsigned char lid_status, base_status, port_status;
> +	unsigned char loc_status, pos_status, panel_status;
> +	bool damage_detected = false;
> +	int i;
> +
> +	port_status = FIELD_GET(PORT_STATUS, dmg_status);
> +	lid_status = FIELD_GET(LID_STATUS, dmg_status);
> +	base_status = FIELD_GET(BASE_STATUS, dmg_status);
> +	for (i = 0; i < NUM_PORTS; i++) {
> +		if (!(dmg_status & BIT(i)))
> +			continue;
> +
> +		if (port_status & BIT(i)) {

Could this too be using reverse logic to reduce indentation level?

> +			*count += sysfs_emit_at(buf, *count, "%s: ", type);
> +			loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
> +			pos_status = FIELD_GET(POS_STATUS, loc_status);
> +			panel_status = FIELD_GET(PANEL_STATUS, loc_status);
> +
> +			if (lid_status & BIT(i))
> +				*count += sysfs_emit_at(buf, *count, "Lid, ");
> +			if (base_status & BIT(i))
> +				*count += sysfs_emit_at(buf, *count, "Base, ");
> +
> +			switch (pos_status) {
> +			case PANEL_TOP:
> +				*count += sysfs_emit_at(buf, *count, "Top, ");
> +				break;
> +			case PANEL_BASE:
> +				*count += sysfs_emit_at(buf, *count, "Bottom, ");
> +				break;
> +			case PANEL_LEFT:
> +				*count += sysfs_emit_at(buf, *count, "Left, ");
> +				break;
> +			case PANEL_RIGHT:
> +				*count += sysfs_emit_at(buf, *count, "Right, ");
> +				break;
> +			default:
> +				pr_err("Unexpected value %d in switch statement\n", pos_status);
> +			};
> +
> +			switch (panel_status) {
> +			case POS_LEFT:
> +				*count += sysfs_emit_at(buf, *count, "Left port\n");
> +				break;
> +			case POS_CENTER:
> +				*count += sysfs_emit_at(buf, *count, "Center port\n");
> +				break;
> +			case POS_RIGHT:
> +				*count += sysfs_emit_at(buf, *count, "Right port\n");
> +				break;
> +			default:
> +				*count += sysfs_emit_at(buf, *count, "Undefined\n");
> +				break;
> +			};
> +			damage_detected = true;
> +		}
> +	}
> +	return damage_detected;
> +}
> +
> +/* sysfs type-c damage detection detail */
> +static ssize_t hwdd_detail_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	bool damage_detected = false;
> +	unsigned int damage_status;
> +	int err, count = 0;
> +
> +

Please remove the extra empty line.

> +	if (ucdd_supported) {
> +		/* Get USB TYPE-C damage status */
> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +		if (err)
> +			return err;
> +
> +		if (display_damage(buf, &count, "Type-C", damage_status))
> +			damage_detected = true;
> +	} else
> +		return -ENODEV;
> +
> +	if (!damage_detected)
> +		count += sysfs_emit_at(buf, count, "No damage detected\n");
> +
> +	return count;
> +}
> +
> +/* sysfs typc damage detection capability */
>  static ssize_t hwdd_status_show(struct device *dev,
>  				struct device_attribute *attr,
>  				char *buf)
> @@ -11132,13 +11237,14 @@ static ssize_t hwdd_status_show(struct device *dev,
>  	} else
>  		return -ENODEV;
>  
> -
>  	return sysfs_emit(buf, "0\n");

This belongs to the previous patch.

>  }
>  static DEVICE_ATTR_RO(hwdd_status);
> +static DEVICE_ATTR_RO(hwdd_detail);
>  
>  static struct attribute *hwdd_attributes[] = {
>  	&dev_attr_hwdd_status.attr,
> +	&dev_attr_hwdd_detail.attr,
>  	NULL
>  };
>  
> 

-- 
 i.

