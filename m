Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D62773E4
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340128; cv=none; b=uQ4PzJaFvg/J5T37ThNeA2wqQ6YukM//ZTtTmSoFGTnTyfjv+UbaF7Dfqc5rX73AgFLyzHGw3gnC+tYYX4+1Rauj5amoKBKpOWtZpXIXBt3LAGTA4fcu7AF5AQMrkKWcFXxTC5OL35l5hdqvNvEYZ0YpTmV+mfR144yib4Gd8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340128; c=relaxed/simple;
	bh=LMnNvpdhoOAlijcw3ecgFA7ZYpkco01TmH3XBPAknHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P9UNKnyBDvCpHzQxpsPPr3kYl1aMkxuL3tVcEqAp8ryrNHcezHBQHEbNKFM2qoRqDPQqI75wyLMQ/QJk61JWP9FyNFc/YPWjvPvtSXuMgdsQ/lnqiPFc99q0WnVyVV9bmcFpCLUVDyCQagXK6rqYy5sYFsFP7q9aA6rptT1/bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ju/Oc1ho; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ju/Oc1ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788340127; x=1819876127;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LMnNvpdhoOAlijcw3ecgFA7ZYpkco01TmH3XBPAknHE=;
  b=ju/Oc1hoA1Jqn/63nAF/8UlvQ9Nuq7vcmD5oapnxyxphPojTTjOisJ8b
   Lf71Ygb7XlnRGtZ86u6lT0aXJNPcphTvPJxNToYaLtdRoWShdiRtbbKNj
   R2jvEspyHOArYXZRxlNiv2JR9wGHU1z1817UtfixULO0tytoxIp8IIpDY
   /U3Kvzias5czHRWKC20jhEhveRetKCq1VdUrtIdSwbziyD2bL2ckTUBBg
   iTgTm2HnIPS3foVEk3FSb6KqCu/TVEqoUZV5C902NI4XtNtYvsLMevorM
   KGEPEH/cW10XmFgTRxO4UANxSLKxS7OTKIJNqs8o3x0eVNXUHzErherDe
   w==;
X-CSE-ConnectionGUID: iAR2ZOadREiZujMF2McRyA==
X-CSE-MsgGUID: DuFk9vuMS/aQdJ1ky4n/ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99388896"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99388896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:08:46 -0700
X-CSE-ConnectionGUID: c6cm49SHSsanreb3xrjo7w==
X-CSE-MsgGUID: 96Oahfi0Rj2WR6hwOWRVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266757996"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:08:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:08:38 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4 03/18] platform/x86/intel/pmt: refactor rc with a
 return value
In-Reply-To: <20260901192736.626777-23-michael.j.ruhl@intel.com>
Message-ID: <4251f034-6955-8bc8-6408-269d8bbd238b@linux.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com> <20260901192736.626777-23-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Sep 2026, Michael J. Ruhl wrote:

> Upcoming changes will include possible failures from HW
> accesses.
> 
> Refactor pmt_crashlog_rw with a return value.
> 
> Update all necessary usage to use the return code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 109 +++++++++++++++-------
>  1 file changed, 77 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index ebc7880d95bd..83323b1ce4a9 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> -static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
> +static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
>  	u32 reg = readl(crashlog->entry.disc_table + status->offset);
>  
> -	return !!(reg & bit);
> +	*state = !!(reg & bit);
> +
> +	return 0;
>  }
>  
> -static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog complete flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
>  }
>  
> -static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog disabled flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
> +static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
>  
> @@ -184,7 +186,7 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_typ
>  }
>  
>  static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
> -				     bool disable)
> +				    bool disable)
>  {
>  	return pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
>  }
> @@ -199,14 +201,14 @@ static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
>  }
>  
> -static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_cleared(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared, state);
>  }
>  
> -static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_consumed(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed, state);
>  }
>  
>  static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> @@ -214,14 +216,14 @@ static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
>  }
>  
> -static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_error(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.error, state);
>  }
>  
> -static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_rearm(struct crashlog_entry *crashlog, bool *state)
>  {
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed, state);
>  }
>  
>  static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> @@ -236,9 +238,14 @@ static ssize_t
>  clear_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool cleared = pmt_crashlog_cleared(crashlog);
> +	bool cleared;
> +	int ret;
>  
> -	return sysfs_emit(buf, "%d\n", cleared);
> +	ret = pmt_crashlog_cleared(crashlog, &cleared);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);

Never emit errors like this but just return the error code from a _show() 
function.

-- 
 i.

> +	else
> +		return sysfs_emit(buf, "%d\n", cleared);
>  }
>  
>  static ssize_t
> @@ -271,9 +278,14 @@ static ssize_t
>  consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool consumed = pmt_crashlog_consumed(crashlog);
> +	bool consumed;
> +	int ret;
>  
> -	return sysfs_emit(buf, "%d\n", consumed);
> +	ret = pmt_crashlog_consumed(crashlog, &consumed);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", consumed);
>  }
>  
>  static ssize_t
> @@ -281,7 +293,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  	       size_t count)
>  {
>  	struct crashlog_entry *crashlog;
> +	bool complete;
>  	bool consumed;
> +	bool disabled;
>  	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
> @@ -296,10 +310,16 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	if (pmt_crashlog_disabled(crashlog))
> +	ret = pmt_crashlog_disabled(crashlog, &disabled);
> +	if (ret)
> +		return ret;
> +	if (disabled)
>  		return -EBUSY;
>  
> -	if (!pmt_crashlog_complete(crashlog))
> +	ret = pmt_crashlog_complete(crashlog, &complete);
> +	if (ret)
> +		return ret;
> +	if (!complete)
>  		return -EEXIST;
>  
>  	ret = pmt_crashlog_set_consumed(crashlog);
> @@ -312,9 +332,14 @@ static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool enabled = !pmt_crashlog_disabled(crashlog);
> +	bool enabled;
> +	int ret;
>  
> -	return sprintf(buf, "%d\n", enabled);
> +	ret = pmt_crashlog_disabled(crashlog, &enabled);
> +	if (ret)
> +		return sysfs_emit(buf, "error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", enabled);
>  }
>  
>  static ssize_t
> @@ -343,9 +368,14 @@ static ssize_t
>  error_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	bool error = pmt_crashlog_error(crashlog);
> +	bool error;
> +	int ret;
>  
> -	return sysfs_emit(buf, "%d\n", error);
> +	ret = pmt_crashlog_error(crashlog, &error);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", error);
>  }
>  static DEVICE_ATTR_RO(error);
>  
> @@ -353,9 +383,14 @@ static ssize_t
>  rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> -	int rearmed = pmt_crashlog_rearm(crashlog);
> +	bool rearmed;
> +	int ret;
>  
> -	return sysfs_emit(buf, "%d\n", rearmed);
> +	ret = pmt_crashlog_rearm(crashlog, &rearmed);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", rearmed);
>  }
>  
>  static ssize_t
> @@ -389,11 +424,15 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog;
>  	bool trigger;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
> -	trigger = pmt_crashlog_complete(crashlog);
>  
> -	return sprintf(buf, "%d\n", trigger);
> +	ret = pmt_crashlog_complete(crashlog, &trigger);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", trigger);
>  }
>  
>  static ssize_t
> @@ -401,6 +440,8 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	      const char *buf, size_t count)
>  {
>  	struct crashlog_entry *crashlog;
> +	bool complete;
> +	bool disabled;
>  	bool trigger;
>  	int ret;
>  
> @@ -413,7 +454,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	guard(mutex)(&crashlog->control_mutex);
>  
>  	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(crashlog))
> +	ret = pmt_crashlog_disabled(crashlog, &disabled);
> +	if (ret)
> +		return ret;
> +	if (disabled)
>  		return -EBUSY;
>  
>  	if (!trigger) {
> @@ -422,7 +466,8 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  	}
>  
>  	/* we cannot trigger a new crash if one is still pending */
> -	if (pmt_crashlog_complete(crashlog))
> +	ret = pmt_crashlog_complete(crashlog, &complete);
> +	if (complete)
>  		return -EEXIST;
>  
>  	ret = pmt_crashlog_set_execute(crashlog);
> 
