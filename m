Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493541C4A0A
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895960; cv=none; b=fVQoD7vpm6Tm/9I7V0xN6zFeLjexNB67IjA7gyy4vjP7IgLw61Kg0/9WFkYSFRmiAg6Bkq+6Ga2W56X5rSMr6aHYK0ELm9KmRU+E1trDvwkR6YinFHtYvla47YKJ28Q+3p6sx43uPEjBImxGVMMA2KTpfaq3xkZeiyyaszSx9GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895960; c=relaxed/simple;
	bh=ed9EKN7bB0115F5jSDt7HSbfAM72KL/hGwUEw+oYMpw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ara0gSdRBIfsCgOZhSG+SDkKBCSucUDXkk0kCuBpticQxTJxlwjW4oBN2b5OpUF8ZwlfSezxVZCAm+doo0+XFfdjn6mede4q/8X4VLrJiUu4hUdzgx2XbppvK9Cx9ioEYIciJWETF8DMilNn23w8gt5tybj5WpxFvP0chDNEWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UovTLRhG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UovTLRhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751895959; x=1783431959;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ed9EKN7bB0115F5jSDt7HSbfAM72KL/hGwUEw+oYMpw=;
  b=UovTLRhGPjcSDr7dRMwk0mII87ooIpFIYoknr0mG0zs9V6Cgns2tiknT
   94bOI0/fn6KwBLN/8EB/q43/krZ7Xf8SAWhh5ZBO7yX8zWM8DJBK6HUUl
   nzd6MpxJN1ADmPUWJsgZX0gPMIB1Uj8U4+0UHwIyqMeymlJTS+jiOoL13
   mFKerXIbiPX4RIu6wjHLQeR46uY7IorhOj91UEWt39Li6W2/9ErvnwSpj
   OIT3EKWSCgERVReuvHgIyRd052LbslGGPzjAH+uMPdeEhRjoZIElcc/jc
   5prymdGbfwFtTFInHcq7R3Y9b1XIaJdoF3/1arXWM90ofBk9QwGjF0YOY
   w==;
X-CSE-ConnectionGUID: pkKaCAQCROCoAr99hDU2Ig==
X-CSE-MsgGUID: H6glpjgiSDyALTZzmLFHEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54041098"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="54041098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:45:57 -0700
X-CSE-ConnectionGUID: Gas8TCubRVib11WR/nm6Pw==
X-CSE-MsgGUID: gLj0bWZ8QEmEQiOEdVqBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="159559587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:45:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:45:49 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 12/12] platform/x86/intel/pmt: support BMG crashlog
In-Reply-To: <20250703211150.135320-13-michael.j.ruhl@intel.com>
Message-ID: <57cdcf8f-865c-9de1-5adc-7996237dd9da@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com> <20250703211150.135320-13-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> The Battlemage GPU has the type 1 version 2 crashlog feature.
> 
> Update the crashlog driver to support this crashlog version.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 268 ++++++++++++++++++++--
>  1 file changed, 255 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index edc41144909c..35c19e9a2bb6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -53,20 +53,52 @@
>  #define TYPE1_VER0_COMPLETE		BIT(31)
>  #define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
>  
> +/*
> + * Type 1 Version 2
> + * status and control are two different registers
> + */
> +#define TYPE1_VER2_STATUS_OFFSET	0x00
> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
> +
> +/* status register */
> +#define TYPE1_VER2_CLEAR_SUPPORT	BIT(20)
> +#define TYPE1_VER2_REARMED		BIT(25)
> +#define TYPE1_VER2_ERROR		BIT(26)
> +#define TYPE1_VER2_CONSUMED		BIT(27)
> +#define TYPE1_VER2_DISABLED		BIT(28)
> +#define TYPE1_VER2_CLEARED		BIT(29)
> +#define TYPE1_VER2_IN_PROGRESS		BIT(30)
> +#define TYPE1_VER2_COMPLETE		BIT(31)
> +
> +/* control register */
> +#define TYPE1_VER2_CONSUME		BIT(25)
> +#define TYPE1_VER2_REARM		BIT(28)
> +#define TYPE1_VER2_EXECUTE		BIT(29)
> +#define TYPE1_VER2_CLEAR		BIT(30)
> +#define TYPE1_VER2_DISABLE		BIT(31)
> +#define TYPE1_VER2_TRIGGER_MASK		(TYPE1_VER2_EXECUTE | TYPE1_VER2_CLEAR | TYPE1_VER2_DISABLE)

Please use \ to split this on multiple lines.

>  /* After offset, order alphabetically, not bit ordered */
>  struct crashlog_status {
>  	u32 offset;
> +	u32 clear_supported;
>  	u32 cleared;
>  	u32 complete;
> +	u32 consumed;
>  	u32 disabled;
> +	u32 error;
> +	u32 in_progress;
> +	u32 rearmed;
>  };
>  
>  struct crashlog_control {
>  	u32 offset;
>  	u32 trigger_mask;
>  	u32 clear;
> +	u32 consume;
>  	u32 disable;
>  	u32 manual;
> +	u32 rearm;
>  };
>  
>  struct crashlog_info {
> @@ -87,6 +119,26 @@ static const struct crashlog_info crashlog_type1_ver0 = {
>  	.control.manual = TYPE1_VER0_EXECUTE,
>  };
>  
> +const struct crashlog_info crashlog_type1_ver2 = {
> +	.status.offset = TYPE1_VER2_STATUS_OFFSET,
> +	.status.clear_supported = TYPE1_VER2_CLEAR_SUPPORT,
> +	.status.cleared = TYPE1_VER2_CLEARED,
> +	.status.complete = TYPE1_VER2_COMPLETE,
> +	.status.consumed = TYPE1_VER2_CONSUMED,
> +	.status.disabled = TYPE1_VER2_DISABLED,
> +	.status.error = TYPE1_VER2_ERROR,
> +	.status.in_progress = TYPE1_VER2_IN_PROGRESS,
> +	.status.rearmed = TYPE1_VER2_REARMED,
> +
> +	.control.offset = TYPE1_VER2_CONTROL_OFFSET,
> +	.control.trigger_mask = TYPE1_VER2_TRIGGER_MASK,
> +	.control.clear = TYPE1_VER2_CLEAR,
> +	.control.consume = TYPE1_VER2_CONSUME,
> +	.control.disable = TYPE1_VER2_DISABLE,
> +	.control.manual = TYPE1_VER2_EXECUTE,
> +	.control.rearm = TYPE1_VER2_REARM,
> +};
> +
>  struct crashlog_entry {
>  	/* entry must be first member of struct */
>  	struct intel_pmt_entry		entry;
> @@ -143,19 +195,23 @@ static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> -	u32 crash_type, version;
>  
> -	crash_type = GET_TYPE(discovery_header);
> -	version = GET_VERSION(discovery_header);
> +	*crash_type = GET_TYPE(discovery_header);
> +	*version = GET_VERSION(discovery_header);
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
>  static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
> @@ -173,9 +229,118 @@ static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, CRASHLOG_SET_BIT);
>  }
>  
> +static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog cleared flag */
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
> +}
> +
> +static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog consumedflag */

Missing space.

But I'm not convived thes comments really help that much. ...If you still 
want to keep them, make these two comments, at minimum, function comments 
instead.

Ah, there are a few more below, the same applies to them.

> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
> +}
> +
> +static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> +{
> +	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, CRASHLOG_SET_BIT);
> +}
> +
> +static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog error flag */
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
> +}
> +
> +static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog reamed flag */

rearmed

> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
> +}
> +
> +static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> +{
> +	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, CRASHLOG_SET_BIT);
> +}
> +
>  /*
>   * sysfs
>   */
> +static ssize_t
> +clear_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	bool cleared = pmt_crashlog_cleared(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", cleared);
> +}
> +
> +static ssize_t
> +clear_store(struct device *dev, struct device_attribute *attr,
> +	    const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool clear;
> +	int result;
> +
> +	crashlog = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &clear);
> +	if (result)
> +		return result;
> +
> +	/* set bit only */
> +	if (!clear)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	pmt_crashlog_set_clear(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(clear);
> +
> +static ssize_t
> +consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	bool consumed = pmt_crashlog_consumed(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", consumed);
> +}
> +
> +static ssize_t consumed_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool consumed;
> +	int result;
> +
> +	crashlog = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &consumed);
> +	if (result)
> +		return result;
> +
> +	/* set bit only */
> +	if (!consumed)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	if (pmt_crashlog_disabled(crashlog))
> +		return -EBUSY;
> +
> +	if (!pmt_crashlog_complete(crashlog))
> +		return -EEXIST;
> +
> +	pmt_crashlog_set_consumed(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(consumed);
> +
>  static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> @@ -207,6 +372,50 @@ enable_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(enable);
>  
> +static ssize_t
> +error_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	bool error = pmt_crashlog_error(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", error);
> +}
> +static DEVICE_ATTR_RO(error);
> +
> +static ssize_t
> +rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	int rearmed = pmt_crashlog_rearm(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", rearmed);
> +}
> +
> +static ssize_t rearm_store(struct device *dev, struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool rearm;
> +	int result;
> +
> +	crashlog = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &rearm);
> +	if (result)
> +		return result;
> +
> +	/* set only */
> +	if (!rearm)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	pmt_crashlog_set_rearm(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(rearm);
> +
>  static ssize_t
>  trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> @@ -254,30 +463,63 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(trigger);
>  
> -static struct attribute *pmt_crashlog_attrs[] = {
> +static struct attribute *pmt_crashlog_type1_ver0_attrs[] = {
>  	&dev_attr_enable.attr,
>  	&dev_attr_trigger.attr,
>  	NULL
>  };
>  
> -static const struct attribute_group pmt_crashlog_group = {
> -	.attrs	= pmt_crashlog_attrs,
> +static struct attribute *pmt_crashlog_type1_ver2_attrs[] = {
> +	&dev_attr_clear.attr,
> +	&dev_attr_consumed.attr,
> +	&dev_attr_enable.attr,
> +	&dev_attr_error.attr,
> +	&dev_attr_rearm.attr,
> +	&dev_attr_trigger.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group pmt_crashlog_type1_ver0_group = {
> +	.attrs	= pmt_crashlog_type1_ver0_attrs,
>  };
>  
> +static const struct attribute_group pmt_crashlog_type1_ver2_group = {
> +	.attrs = pmt_crashlog_type1_ver2_attrs,
> +};
> +
> +static const struct crashlog_info *select_crashlog_info(u32 type, u32 version)
> +{
> +	if (version == 0)
> +		return &crashlog_type1_ver0;
> +
> +	return &crashlog_type1_ver2;
> +}
> +
> +static const struct attribute_group *select_sysfs_grp(u32 type, u32 version)
> +{
> +	if (version == 0)
> +		return &pmt_crashlog_type1_ver2_group;
> +
> +	return &pmt_crashlog_type1_ver2_group;
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
>  	/* initialize the crashlog struct */
>  	crashlog = container_of(entry, struct crashlog_entry, entry);
>  	mutex_init(&crashlog->control_mutex);
> -	crashlog->info = &crashlog_type1_ver0;
> +
> +	crashlog->info = select_crashlog_info(type, version);
>  
>  	header->access_type = GET_ACCESS(readl(disc_table));
>  	header->guid = readl(disc_table + GUID_OFFSET);
> @@ -286,7 +528,7 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  	/* Size is measured in DWORDS, but accessor returns bytes */
>  	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
>  
> -	entry->attr_grp = &pmt_crashlog_group;
> +	entry->attr_grp = select_sysfs_grp(type, version);

Can't you have this as crashlog->info->attr_grp so you don't need a 
function for selecting it?

>  
>  	return 0;
>  }
> 

-- 
 i.

