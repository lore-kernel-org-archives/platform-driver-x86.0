Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569212E612E
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639937; cv=none; b=OK5/5veOE/ZhMfZBXTkfDyGoAvvbZvFR8GIyTcAJH1IQAl1amsoNZSE17/uqtkbwO3D9/cmqD4yd2Ab8j16pNsZ7mC2u6I/v0L5yHrzmtPHF2hjdzy0Ebob+8M4YsIACMOnlRzG5ktHLacy0HUp+d7sfXJ+VQdO6pKAYA7AgZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639937; c=relaxed/simple;
	bh=JPatgAPif3kNCjXXxa5m+oPrqdFS1LOCq2Nm59nka3M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iIUp921cRnorzq8ToRdDV7iUD8k0BMnP9yFHxfeIWplkkcN08Hfb2IKKqClSYQUoTADwYpxIhVYFAQdr8MyNGd2/7VLPI2WylLNJvUD9nH4iVUu3eX7uWvhbQvq7dH+2GZwMGa6fb/1g8VnadtcDXH0srYH7HFn6dui4uqz34NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjsHl4Tc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjsHl4Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749639935; x=1781175935;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JPatgAPif3kNCjXXxa5m+oPrqdFS1LOCq2Nm59nka3M=;
  b=SjsHl4TcdbwbF1LPVY7V5vIQ8j8WvO1pZCivUDtVzDNDdUHmzVhfdbRz
   BX8bBuoaV84as0GseyhgvIojEoZMnibXOadkDz1zib6e2CEmi1BevnOKk
   Acu145/RRx4MvKXdE4YjZxTBLyg78G4O1oQ2mX23aKEx6m1sPbOODeJ2A
   MAWEF5QmeP4Ig5j+B8KUEHlD0xD4NJGxCqVcQfT7mBFqHrVYgNmTL3260
   6w1Ab82FlIYgi6eH8EMR9gcl0lFI/XMpK1S7STerCgc1/8Z34C70ocHcD
   IQsuHtbrBvxjXbQr1pPrh5Mw/rCQ5ywfjl+Wf6jAcNgIyGa6tdxwXeAx5
   A==;
X-CSE-ConnectionGUID: B7IRXPr1QESedhs2GPn7xw==
X-CSE-MsgGUID: sYqw/GC5R+az2A7cTrhoMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51001208"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51001208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:05:17 -0700
X-CSE-ConnectionGUID: /v4Ve7wZSEOTKCJNsLcbJw==
X-CSE-MsgGUID: mZyptZgFQTOJ4wBD0SMwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147656751"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:05:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 14:05:09 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 09/10] platform/x86/intel/pmt: use a version struct
In-Reply-To: <20250610211225.1085901-10-michael.j.ruhl@intel.com>
Message-ID: <28b72a47-47ff-dda0-5505-d43ffdf5a437@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com> <20250610211225.1085901-10-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> In preparation for supporting multiple crashlog versions, use a struct
> to keep bit offset info for the status and control bits.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 174 ++++++++++++++--------
>  1 file changed, 108 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index e11865686f2a..7c259b1cf95b 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -23,21 +23,6 @@
>  /* Crashlog discovery header types */
>  #define CRASH_TYPE_OOBMSM	1
>  
> -/* Control Flags */
> -#define CRASHLOG_FLAG_DISABLE		BIT(28)
> -
> -/*
> - * Bits 29 and 30 control the state of bit 31.
> - *
> - * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
> - * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
> - * Bit 31 is the read-only status with a 1 indicating log is complete.
> - */
> -#define CRASHLOG_FLAG_TRIGGER_CLEAR	BIT(29)
> -#define CRASHLOG_FLAG_TRIGGER_EXECUTE	BIT(30)
> -#define CRASHLOG_FLAG_TRIGGER_COMPLETE	BIT(31)
> -#define CRASHLOG_FLAG_TRIGGER_MASK	GENMASK(31, 28)
> -
>  /* Crashlog Discovery Header */
>  #define CONTROL_OFFSET		0x0
>  #define GUID_OFFSET		0x4
> @@ -49,10 +34,63 @@
>  /* size is in bytes */
>  #define GET_SIZE(v)		((v) * sizeof(u32))
>  
> +/*
> + * Type 1 Version 0
> + * status and control registers are combined.
> + *
> + * Bits 29 and 30 control the state of bit 31.
> + * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
> + * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
> + * Bit 31 is the read-only status with a 1 indicating log is complete.
> + */
> +#define TYPE1_VER0_STATUS_OFFSET	0x00
> +#define TYPE1_VER0_CONTROL_OFFSET	0x00
> +
> +#define TYPE1_VER0_DISABLE		BIT(28)
> +#define TYPE1_VER0_CLEAR		BIT(29)
> +#define TYPE1_VER0_EXECUTE		BIT(30)
> +#define TYPE1_VER0_COMPLETE		BIT(31)
> +#define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
> +
> +/* After offset, order alphabetically, not bit ordered */
> +struct crashlog_status {
> +	u32 offset;
> +	u32 cleared;
> +	u32 complete;
> +	u32 disabled;
> +};
> +
> +struct crashlog_control {
> +	u32 offset;
> +	u32 trigger_mask;
> +	u32 clear;
> +	u32 disable;
> +	u32 manual;
> +};
> +
> +struct crashlog_info {
> +	struct crashlog_status status;
> +	struct crashlog_control control;
> +};
> +
> +static const struct crashlog_info crashlog_type1_ver0 = {
> +	.status.offset = TYPE1_VER0_STATUS_OFFSET,
> +	.status.cleared = TYPE1_VER0_CLEAR,
> +	.status.complete = TYPE1_VER0_COMPLETE,
> +	.status.disabled = TYPE1_VER0_DISABLE,
> +
> +	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
> +	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
> +	.control.clear = TYPE1_VER0_CLEAR,
> +	.control.disable = TYPE1_VER0_DISABLE,
> +	.control.manual = TYPE1_VER0_EXECUTE,
> +};
> +
>  struct crashlog_entry {
>  	/* entry must be first member of struct */
>  	struct intel_pmt_entry		entry;
>  	struct mutex			control_mutex;
> +	const struct crashlog_info	*info;
>  };
>  
>  struct pmt_crashlog_priv {
> @@ -60,74 +98,76 @@ struct pmt_crashlog_priv {
>  	struct crashlog_entry	entry[];
>  };
>  
> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +{
> +	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 crash_type, version;
> +
> +	crash_type = GET_TYPE(discovery_header);
> +	version = GET_VERSION(discovery_header);
> +
> +	/*
> +	 * Currently we only recognize OOBMSM version 0 devices.
> +	 * We can ignore all other crashlog devices in the system.
> +	 */
> +	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
> +}
> +
>  /*
>   * I/O
>   */
> -#define SET	true
> -#define CLEAR	false
> +#define SET     true
> +#define CLEAR   false

Unrelated space change, and the pre-spacing with tabs is better.

> -static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bool set)
> +static void read_modify_write(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
> -	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +	const struct crashlog_control *control = &crashlog->info->control;
> +	struct intel_pmt_entry *entry = &crashlog->entry;
> +	u32 reg = readl(entry->disc_table + control->offset);
>  
> -	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +	reg &= ~control->trigger_mask;
>  
>  	if (set)
>  		reg |= bit;
>  	else
>  		reg &= bit;
>  
> -	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +	writel(reg, entry->disc_table + control->offset);
>  }
>  
> -static bool read_check(struct intel_pmt_entry *entry, u32 bit)
> +static bool read_check(struct crashlog_entry *crashlog, u32 bit)
>  {
> -	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +	const struct crashlog_status *status = &crashlog->info->status;
> +	u32 reg = readl(crashlog->entry.disc_table + status->offset);
>  
>  	return !!(reg & bit);
>  }
>  
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
>  {
>  	/* return current value of the crashlog complete flag */
> -	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +	return read_check(crashlog, crashlog->info->status.complete);
>  }
>  
> -static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
>  {
>  	/* return current value of the crashlog disabled flag */
> -	return read_check(entry, CRASHLOG_FLAG_DISABLE);
> +	return read_check(crashlog, crashlog->info->status.disabled);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
>  {
> -	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> -	u32 crash_type, version;
> -
> -	crash_type = GET_TYPE(discovery_header);
> -	version = GET_VERSION(discovery_header);
> -
> -	/*
> -	 * Currently we only recognize OOBMSM version 0 devices.
> -	 * We can ignore all other crashlog devices in the system.
> -	 */
> -	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
> +	read_modify_write(crashlog, crashlog->info->control.disable, disable);
>  }
>  
> -static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> -				     bool disable)
> +static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
>  {
> -	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
> +	read_modify_write(crashlog, crashlog->info->control.clear, SET);
>  }
>  
> -static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  {
> -	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
> -}
> -
> -static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> -{
> -	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
> +	read_modify_write(crashlog, crashlog->info->control.manual, SET);
>  }
>  
>  /*
> @@ -136,8 +176,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>  static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
> -	bool enabled = !pmt_crashlog_disabled(entry);
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	bool enabled = !pmt_crashlog_disabled(crashlog);
>  
>  	return sprintf(buf, "%d\n", enabled);
>  }
> @@ -146,19 +186,19 @@ static ssize_t
>  enable_store(struct device *dev, struct device_attribute *attr,
>  	     const char *buf, size_t count)
>  {
> -	struct crashlog_entry *entry;
> +	struct crashlog_entry *crashlog;
>  	bool enabled;
>  	int result;
>  
> -	entry = dev_get_drvdata(dev);
> +	crashlog = dev_get_drvdata(dev);
>  
>  	result = kstrtobool(buf, &enabled);
>  	if (result)
>  		return result;
>  
> -	guard(mutex)(&entry->control_mutex);
> +	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_disable(&entry->entry, !enabled);
> +	pmt_crashlog_set_disable(crashlog, !enabled);
>  
>  	return count;
>  }
> @@ -167,11 +207,11 @@ static DEVICE_ATTR_RW(enable);
>  static ssize_t
>  trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	struct intel_pmt_entry *entry;
> +	struct crashlog_entry *crashlog;
>  	bool trigger;
>  
> -	entry = dev_get_drvdata(dev);
> -	trigger = pmt_crashlog_complete(entry);
> +	crashlog = dev_get_drvdata(dev);
> +	trigger = pmt_crashlog_complete(crashlog);
>  
>  	return sprintf(buf, "%d\n", trigger);
>  }
> @@ -180,32 +220,33 @@ static ssize_t
>  trigger_store(struct device *dev, struct device_attribute *attr,
>  	      const char *buf, size_t count)
>  {
> -	struct crashlog_entry *entry;
> +	struct crashlog_entry *crashlog;
>  	bool trigger;
>  	int result;
>  
> -	entry = dev_get_drvdata(dev);
> +	crashlog = dev_get_drvdata(dev);
>  
>  	result = kstrtobool(buf, &trigger);
>  	if (result)
>  		return result;
>  
> -	guard(mutex)(&entry->control_mutex);
> +	guard(mutex)(&crashlog->control_mutex);

Could you please do the entry -> crashlog variable rename first in a 
separate patch for the cases where it's already struct crashlog_entry to 
keep this patch focused on real change.
 
>  	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(&entry->entry))
> +	if (pmt_crashlog_disabled(crashlog))
>  		return -EBUSY;
>  
>  	if (!trigger) {
> -		pmt_crashlog_set_clear(&entry->entry);
> +		pmt_crashlog_set_clear(crashlog);
>  		return count;
>  	}
>  
>  	/* we cannot trigger a new crash if one is still pending */
> -	if (pmt_crashlog_complete(&entry->entry))
> +	if (pmt_crashlog_complete(crashlog))
>  		return -EEXIST;
>  
> -	pmt_crashlog_set_execute(&entry->entry);
> +	pmt_crashlog_set_execute(crashlog);
> +
>  
>  	return count;
>  }
> @@ -231,9 +272,10 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  	if (!pmt_crashlog_supported(entry))
>  		return 1;
>  
> -	/* initialize control mutex */
> +	/* initialize the crashlog struct */
>  	crashlog = container_of(entry, struct crashlog_entry, entry);
>  	mutex_init(&crashlog->control_mutex);

Unrelated to this patch, there seems to be no mutex_destroy() done for 
this mutex anywhere.

> +	crashlog->info = &crashlog_type1_ver0;
>  
>  	header->access_type = GET_ACCESS(readl(disc_table));
>  	header->guid = readl(disc_table + GUID_OFFSET);
> 

-- 
 i.

