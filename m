Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF528540A
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 May 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669908; cv=none; b=Ww8OTr1l3m3oLr3AfP1Mvpu0Tj0T5EZRcOi0EA+dUlwZNklYXvHtrCj/bufClFO1hVlfTQyoiEtPLDb4wQE2ePDhiNPI/jG5DlemtrED0rLtI+D640So/VbyXPmmdwqR0oWwOKXILlCC8Iw9xHKxc9mzC7QxwaM0Bg18L8d7gZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669908; c=relaxed/simple;
	bh=TsPJhAMfl/OO+Pjd5/hQvqVuFBYyUbS67EmVUdA4Zrw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=litdf0gBNTimdk4ah16vrLtPYeu8ypJGWl59GmuQcqYmLeNErauYQ43OvCtZWjlX2W6v/hGMe8fYcge6qwTKoiX9PH4X4kG2BCen4NTIcLdpcB2TtGjMBzHI9foIF+CEWBiMY962dIm1/BRHMM/xQeBvyap/7TYhbK24nTj43g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B44Ew3mx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B44Ew3mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669906; x=1779205906;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TsPJhAMfl/OO+Pjd5/hQvqVuFBYyUbS67EmVUdA4Zrw=;
  b=B44Ew3mxU+6hubCKCXgCj8x2j6XfksRAio46KX7tpsjMjguBjez0RsXo
   mxOTYi6ohI5S54sOaMQEiofZqAWSTkO38YfuqRFMb5PSuchnP51n8gRdn
   Y4w6ozl1qBDkqFPKXAZ/i7ohgYGCSPNBA/mzoDCaenQ9kdhsZ4/qr0QZn
   vBnEpEPvfvchuAL6hRL5QFtYQpQR9exkmdmVdvGYtP0UMUcG6i8SZUoDm
   o2fASG8ZNC7sXGWkCRpUBT1LavMvXZ6aSZCBwiMOtFbSSaVIQ3edd7QXp
   nOjJsqtIbUnNnaalTqoDPHv6o15GhpVn98e6iAxke5VHIAdeY/MJPhy7O
   w==;
X-CSE-ConnectionGUID: avPiJ8v5QnaYilF2UOU4dA==
X-CSE-MsgGUID: JmKAEV87RV+3ntdSFDBgVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60915266"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60915266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:51:46 -0700
X-CSE-ConnectionGUID: +RvRGCwwROmHKvoYtuBl/g==
X-CSE-MsgGUID: 3170yhbVTFqXBVC0CFaxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139313306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:51:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 18:51:38 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
In-Reply-To: <20250516150416.210625-5-michael.j.ruhl@intel.com>
Message-ID: <c63b6778-ecf5-e025-4f16-07a35a105e89@linux.intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com> <20250516150416.210625-5-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Michael J. Ruhl wrote:

> The Battlemage GPU has the type 1 version 2 crashlog
> feature.
> 
> Update the crashlog driver to support this crashlog
> version.

Too short lines.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.h    |   2 +
>  drivers/platform/x86/intel/pmt/crashlog.c | 328 +++++++++++++++++++---
>  2 files changed, 288 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 6b3455a86471..9c0c7e2efecf 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -31,6 +31,8 @@ struct telem_endpoint {
>  };
>  
>  struct intel_pmt_header {
> +	u32	type;
> +	u32	version;
>  	u32	base_offset;
>  	u32	size;
>  	u32	guid;
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index c9bfe1c26311..700a51d2563a 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -23,10 +23,17 @@
>  #define CRASH_TYPE_OOBMSM	1
>  
>  /* Crashlog Discovery Header */
> -#define CONTROL_OFFSET		0x0
> -#define GUID_OFFSET		0x4
> -#define BASE_OFFSET		0x8
> -#define SIZE_OFFSET		0xC
> +#define CONTROL_OFFSET		0x00
> +#define GUID_OFFSET		0x04
> +#define BASE_OFFSET		0x08
> +#define SIZE_OFFSET		0x0C

Why did you change this group at all?

> +#define TYPE1_VER0_CONTROL_OFFSET	0x0
> +#define TYPE1_VER0_STATUS_OFFSET	0x0
> +
> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
> +#define TYPE1_VER2_STATUS_OFFSET	0x0
> +
>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>  /* size is in bytes */
>  #define GET_SIZE(v)		((v) * sizeof(u32))
> @@ -56,9 +63,37 @@ struct type1_ver0_base {
>  	u32 complete:		1;  /* ro/v  31:31 */
>  };
>  
> +struct type1_ver2_status {
> +	u32 access_type:	4;  /* ro    0:3  */
> +	u32 crash_type:		4;  /* ro    4:7  */
> +	u32 count:		8;  /* ro    8:15 */
> +	u32 version:		4;  /* ro   16:19 */
> +	u32 clear_support:	1;  /* ro   20:20 */
> +	u32 rsvd:		4;  /* ro   21:24 */
> +	u32 rearmed:		1;  /* ro   25:25 */
> +	u32 error:		1;  /* ro   26:26 */
> +	u32 consumed:		1;  /* ro   27:27 */
> +	u32 disable:		1;  /* ro   28:28 */
> +	u32 cleared:		1;  /* ro   29:29 */
> +	u32 in_progress:	1;  /* ro   30:30 */
> +	u32 complete:		1;  /* ro   31:31 */

See, now you're adding GENMASK()/BIT() arguments into the comment when the 
struct/C bitfield doesn't document that for you. I think this conversion 
away from GENMASK()/BIT() was a step backwards.

> +};
> +
> +struct type1_ver2_control {
> +	u32 rsvd0:		25; /* ro    0:24 */
> +	u32 consumed:		1;  /* rw/v 25:25 */
> +	u32 rsvd1:		1;  /* ro/v 26:26 */
> +	u32 rsvd2:		1;  /* ro/v 27:27 */

Why aren't these two combined?

> +	u32 rearm:		1;  /* rw/v 28:28 */
> +	u32 manual:		1;  /* rw/v 29:29 */
> +	u32 clear:		1;  /* rw/v 30:30 */
> +	u32 disable:		1;  /* rw/v 31:31 */

Really, they converted most bits into reserved (which is fine) but not 
only that, they also relocated the remaining bits just because they 
could. :-(

> +};
> +
>  struct crashlog_status {
>  	union {
>  		struct type1_ver0_base stat;
> +		struct type1_ver2_status stat2;
>  		u32 status;
>  	};
>  };
> @@ -66,6 +101,7 @@ struct crashlog_status {
>  struct crashlog_control {
>  	union {
>  		struct type1_ver0_base ctrl;
> +		struct type1_ver2_control ctrl2;
>  		u32 control;
>  	};
>  };
> @@ -75,97 +111,174 @@ struct pmt_crashlog_priv {
>  	struct crashlog_entry	entry[];
>  };
>  
> +static u32 get_control_offset(struct intel_pmt_header *hdr)
> +{
> +	return hdr->version == 0 ? TYPE1_VER0_CONTROL_OFFSET : TYPE1_VER2_CONTROL_OFFSET;
> +}
> +
> +static u32 get_status_offset(struct intel_pmt_header *hdr)
> +{
> +	return hdr->version == 0 ? TYPE1_VER0_STATUS_OFFSET : TYPE1_VER2_STATUS_OFFSET;
> +}

I suggest you create some per version const version info struct which 
holds all the relevant offsets, field bitmasks that got changed, and 
attrs (perhaps more, the code is complex enough I didn't try to 
understand evenything until it look cleaner). Basically, whenever you want 
to check what the version is and behave differently, consider if you can 
put that somehow into the per version info struct without needed to use 
if () / elvis op logic at all.

Also now, after reading this patch, I'm even more convinced you want to 
keep using BIT/GENMASK(), not C bitfields because the former just happens 
to be more flexible allowing the mask values to be easily put into the 
info struct.

>  /*
>   * I/O
>   */
>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>  {
> +	u32 offset = get_status_offset(&entry->header);
>  	struct crashlog_status status = {
> -		.status = readl(entry->disc_table + CONTROL_OFFSET),
> +		.status = readl(entry->disc_table + offset),
>  	};
>  
>  	/* return current value of the crashlog complete flag */
> -	return status.stat.complete;
> +	if (entry->header.version == 0)
> +		return status.stat.complete;
>  
> +	return status.stat2.complete;
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> +	u32 offset = get_status_offset(&entry->header);
>  	struct crashlog_status status = {
> -		.status = readl(entry->disc_table + CONTROL_OFFSET),
> +		.status = readl(entry->disc_table + offset),
>  	};
>  
>  	/* return current value of the crashlog disabled flag */
> -	return status.stat.disable;
> +	if (entry->header.version == 0)
> +		return status.stat.disable;
> +
> +	return status.stat2.disable;
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	struct crashlog_control discovery_header = {
>  		.control = readl(entry->disc_table + CONTROL_OFFSET),
>  	};
> -	u32 crash_type, version;
>  
> -	crash_type = discovery_header.ctrl.crash_type;
> -	version = discovery_header.ctrl.version;
> +	*crash_type = discovery_header.ctrl.crash_type;
> +	*version = discovery_header.ctrl.version;
>  
>  	/*
> -	 * Currently we only recognize OOBMSM version 0 devices.
> -	 * We can ignore all other crashlog devices in the system.
> +	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> +	 * devices.
> +	 *
> +	 * Ignore all other crashlog devices in the system.
>  	 */
> -	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
> +	if (*crash_type == CRASH_TYPE_OOBMSM && (*version == 0 || *version == 2))
> +		return true;
> +
> +	return false;
>  }
>  
>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>  				     bool disable)
>  {
> +	u32 offset = get_control_offset(&entry->header);
>  	struct crashlog_control control = {
> -		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +		.control = readl(entry->disc_table + offset),
>  	};
>  
> -	/* clear trigger bits so we are only modifying disable flag */
> -	control.ctrl.clear = 0;
> -	control.ctrl.manual = 0;
> -	control.ctrl.complete = 0;
> +	if (entry->header.version == 0) {
> +		/* clear trigger bits so we are only modifying disable flag */
> +		control.ctrl.clear = 0;
> +		control.ctrl.manual = 0;
> +		control.ctrl.complete = 0;
>  
> -	if (disable)
> -		control.ctrl.disable = 1;
> -	else
> -		control.ctrl.disable = 0;
> +		control.ctrl.disable = disable;
> +	} else {
> +		control.ctrl2.manual = 0;
> +		control.ctrl2.clear = 0;
>  
> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
> +		control.ctrl2.disable = disable;
> +	}
> +
> +	writel(control.control, entry->disc_table + offset);
>  }
>  
>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>  {
> +	u32 offset = get_control_offset(&entry->header);
>  	struct crashlog_control control = {
> -		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +		.control = readl(entry->disc_table + offset),
>  	};
>  
> -	/* clear trigger bits so we are only modifying disable flag */
> -	control.ctrl.disable = 0;
> -	control.ctrl.manual = 0;
> -	control.ctrl.complete = 0;
> +	if (entry->header.version == 0) {
> +		/* clear trigger bits so we are only modifying disable flag */
> +		control.ctrl.disable = 0;
> +		control.ctrl.manual = 0;
> +		control.ctrl.complete = 0;
> +
> +		control.ctrl.clear = 1;
> +	} else {
> +		control.ctrl2.disable = 0;
> +		control.ctrl2.manual = 0;
>  
> -	control.ctrl.clear = 1;
> +		control.ctrl2.clear = 1;
> +	}
>  
> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
> +	writel(control.control, entry->disc_table + offset);
>  }
>  
>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>  {
> +	u32 offset = get_control_offset(&entry->header);
>  	struct crashlog_control control = {
> -		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +		.control = readl(entry->disc_table + offset),
> +	};
> +
> +	if (entry->header.version == 0) {
> +		/* clear trigger bits so we are only modifying disable flag */
> +		control.ctrl.disable = 0;
> +		control.ctrl.clear = 0;
> +		control.ctrl.complete = 0;
> +
> +		control.ctrl.manual = 1;
> +	} else {
> +		control.ctrl2.disable = 0;
> +		control.ctrl2.clear = 0;
> +
> +		control.ctrl2.manual = 1;
> +	}
> +
> +	writel(control.control, entry->disc_table + offset);
> +}
> +
> +/* version 2 support */
> +static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry)
> +{
> +	u32 offset = get_control_offset(&entry->header);
> +	struct crashlog_control control = {
> +		.control = readl(entry->disc_table + offset),
>  	};
>  
> -	/* clear trigger bits so we are only modifying disable flag */
> -	control.ctrl.disable = 0;
> -	control.ctrl.clear = 0;
> -	control.ctrl.complete = 0;
> +	control.ctrl2.consumed = 1;
> +
> +	writel(control.control, entry->disc_table + offset);
> +}
>  
> -	control.ctrl.manual = 1;
> +static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry)
> +{
> +	u32 offset = get_status_offset(&entry->header);
> +	struct crashlog_status status = {
> +		.status = readl(entry->disc_table + offset),
> +	};
>  
> -	writel(control.control, entry->disc_table + CONTROL_OFFSET);
> +	return status.stat2.rearmed;
> +}
> +
> +static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry)
> +{
> +	u32 offset = get_control_offset(&entry->header);
> +	struct crashlog_control control = {
> +		.control = readl(entry->disc_table + offset),
> +	};
> +
> +	control.ctrl2.rearm = 1;
> +
> +	writel(control.control, entry->disc_table + offset);
>  }
>  
>  /*
> @@ -177,7 +290,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
>  	int enabled = !pmt_crashlog_disabled(entry);
>  
> -	return sprintf(buf, "%d\n", enabled);
> +	return sysfs_emit(buf, "%d\n", enabled);
>  }
>  
>  static ssize_t
> @@ -251,16 +364,135 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(trigger);
>  
> +static ssize_t consumed_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct crashlog_entry *entry;
> +	bool consumed;
> +	int result;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &consumed);
> +	if (result)
> +		return result;
> +
> +	/* set bit only */
> +	if (!consumed)
> +		return -EINVAL;
> +
> +	mutex_lock(&entry->control_mutex);

Please use guard() and remove the gotos.

> +
> +	if (pmt_crashlog_disabled(&entry->entry)) {
> +		result = -EBUSY;
> +		goto err;
> +	} else if (!pmt_crashlog_complete(&entry->entry)) {
> +		result = -EEXIST;
> +		goto err;
> +	} else {
> +		pmt_crashlog_set_consumed(&entry->entry);
> +	}
> +
> +err:
> +	mutex_unlock(&entry->control_mutex);
> +	return count;
> +}
> +static DEVICE_ATTR_WO(consumed);
> +
> +static ssize_t
> +rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
> +	int rearmed = pmt_crashlog_rearm(entry);
> +
> +	return sysfs_emit(buf, "%d\n", rearmed);
> +}
> +
> +static ssize_t rearm_store(struct device *dev, struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct crashlog_entry *entry;
> +	bool trigger;
> +	int result;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &trigger);
> +	if (result)
> +		return result;
> +
> +	/* set only */
> +	if (!trigger)
> +		return -EINVAL;
> +
> +	mutex_lock(&entry->control_mutex);
> +	pmt_crashlog_set_rearm(&entry->entry);
> +	mutex_unlock(&entry->control_mutex);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(rearm);
> +
> +#define DEBUG_REGISTER_INFO
> +#ifdef DEBUG_REGISTER_INFO
> +static ssize_t
> +status_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +       struct intel_pmt_entry *entry = dev_get_drvdata(dev);
> +       u32 sts_off = get_status_offset(&entry->header);
> +       u32 ctl_off = get_control_offset(&entry->header);
> +       struct crashlog_status status = {
> +               .status = readl(entry->disc_table + sts_off),
> +       };
> +       struct crashlog_control control = {
> +               .control = readl(entry->disc_table + ctl_off),
> +       };
> +       int len = 0;
> +
> +       len += sysfs_emit_at(buf, len, "clear_support: %d\n", status.stat2.clear_support);
> +       len += sysfs_emit_at(buf, len, "rearmed: %d\n", status.stat2.rearmed);
> +       len += sysfs_emit_at(buf, len, "error: %d\n", status.stat2.error);
> +       len += sysfs_emit_at(buf, len, "consumed: %d\n", status.stat2.consumed);
> +       len += sysfs_emit_at(buf, len, "disable: %d\n", status.stat2.disable);
> +       len += sysfs_emit_at(buf, len, "cleared: %d\n", status.stat2.cleared);
> +       len += sysfs_emit_at(buf, len, "in_progress: %d\n", status.stat2.in_progress);
> +       len += sysfs_emit_at(buf, len, "complete: %d\n", status.stat2.complete);
> +       len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", sts_off, ctl_off);
> +       len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status.status);
> +       len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control.control);
> +
> +       return len;
> +}
> +static DEVICE_ATTR_RO(status);
> +#endif
> +
>  static struct attribute *pmt_crashlog_attrs[] = {
>  	&dev_attr_enable.attr,
>  	&dev_attr_trigger.attr,
>  	NULL
>  };
>  
> +static struct attribute *pmt_crashlog_ver2_attrs[] = {
> +	&dev_attr_enable.attr,
> +	&dev_attr_trigger.attr,
> +	&dev_attr_consumed.attr,
> +	&dev_attr_rearm.attr,
> +#ifdef DEBUG_REGISTER_INFO
> +	&dev_attr_status.attr,
> +#endif

You could use a define to hold this so you don't need to use ifdef here. 
Check WMAX_DEV_GROUPS if you want an example what I mean.

> +	NULL
> +};
> +
>  static const struct attribute_group pmt_crashlog_group = {
>  	.attrs	= pmt_crashlog_attrs,
>  };
>  
> +static const struct attribute_group pmt_crashlog_ver2_group = {
> +	.attrs	= pmt_crashlog_ver2_attrs,
> +};
> +
> +static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry, struct device *dev);
> +
>  static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
>  				     struct intel_pmt_entry *entry)
>  {
> @@ -286,14 +518,24 @@ static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
>  	return 0;
>  }
>  
> +static const struct attribute_group *select_sysfs_grp(struct intel_pmt_header *hdr)
> +{
> +	if (hdr->version == 0)
> +		return &pmt_crashlog_group;
> +
> +	return &pmt_crashlog_ver2_group;
> +}
> +
>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  				      struct device *dev)
>  {
>  	void __iomem *disc_table = entry->disc_table;
>  	struct intel_pmt_header *header = &entry->header;
>  	struct crashlog_entry *crashlog;
> +	u32 version;
> +	u32 type;
>  
> -	if (!pmt_crashlog_supported(entry))
> +	if (!pmt_crashlog_supported(entry, &type, &version))
>  		return 1;
>  
>  	/* initialize control mutex */
> @@ -303,11 +545,13 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  	header->access_type = GET_ACCESS(readl(disc_table));
>  	header->guid = readl(disc_table + GUID_OFFSET);
>  	header->base_offset = readl(disc_table + BASE_OFFSET);
> +	header->type = type;
> +	header->version = version;
>  
>  	/* Size is measured in DWORDS, but accessor returns bytes */
>  	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
>  
> -	entry->attr_grp = &pmt_crashlog_group;
> +	entry->attr_grp = select_sysfs_grp(header);
>  
>  	return 0;
>  }
> 

-- 
 i.

