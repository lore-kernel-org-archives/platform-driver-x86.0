Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E183EC816
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340066; cv=none; b=Qryry8FS4uABWYUuS6YOgNodqialHx7eqEw8iqmdhw1GRw1IQy9QnSNng9qtXHNuf/33jUgIsWcjsA14/MS/lOedSOZjnfJ1Dh73vlE4v/Lyhrh2GXWgQVeokbha4obXvxZ8rVXJVZkgMhrdI7IG50yFtlHw2VyGQfKbZ4i4Y8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340066; c=relaxed/simple;
	bh=24uNEfkJ70aINnryHhjrdD1pIcsXRicv+Qr31a1Grjg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aAURXbZH6S9z7UcMnIkq0M+aPuKmAiB4XeXWQ1afFJXdVJ+hFxpfyBPcQhqCznppTpKQqkHfdjPMrUjFNJ8ruiuJzStApgDwfx47NzNQ1GIq6Msofe9TPm9mRIm9Y5Tio1uHiROpumb3ypImvpTCSRNX6Nmb3CfaUpsgpyshE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpXfeor3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpXfeor3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788340065; x=1819876065;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=24uNEfkJ70aINnryHhjrdD1pIcsXRicv+Qr31a1Grjg=;
  b=kpXfeor3IMoA5qe09PowWtathcPAs+lGNMHMnaLc/7sI45vzbTGZI26j
   CVbLwCvApEUX33v8HcGPGN67+oBGu5fcxxvxocefvOvl2y0kPBl+tNUGv
   8ZVolojTrUyAWQH7z6Hb3z0nzAahmVgAbejolz+Vt6loaKKG/qXYdwEcz
   ZBuicoBbahuwdVnmB9HGoU6alNjTNelBxfTuJDJkDWzcXCWdWMAVoH0C9
   CGrsAmOzStYMl7t/0tB46ytEy9Dnr5twq4VvXlsYE+Kk0TUnO2BRodDzT
   7/8Aa7t+G1cuNVR5LYqF2RXxCCq3ZUsVX/Zb4+vC49xvt1lzlk7kzFDup
   w==;
X-CSE-ConnectionGUID: 1kD6LceeSQG/W7/9QKHW6w==
X-CSE-MsgGUID: mUDNVYXwTiG7UEXrrU97mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99954608"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99954608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:07:44 -0700
X-CSE-ConnectionGUID: F1AxMNoJQ0aDIFdPLSvvww==
X-CSE-MsgGUID: oUTL62K3Q/CeL0Ut1gQ3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269912935"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:07:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:07:32 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4 02/18] platform/x86/intel/pmt: refactor rmw with a
 return value
In-Reply-To: <20260901192736.626777-22-michael.j.ruhl@intel.com>
Message-ID: <5a191af8-3432-4948-9f97-e562f1176557@linux.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com> <20260901192736.626777-22-michael.j.ruhl@intel.com>
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

Too short line.

> Refactor pmt_crashlog_rwm with a return value.

Also, please include () in the changelog to any function name.

--
 i.

> 
> Update all necessary usage to use the return code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 88 ++++++++++++-----------
>  1 file changed, 45 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index f936daf99e4d..ebc7880d95bd 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -125,7 +125,7 @@ struct pmt_crashlog_priv {
>   */
>  
>  /* Read, modify, write the control register, setting or clearing @bit based on @set */
> -static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
> +static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control = &crashlog->info->control;
>  	struct intel_pmt_entry *entry = &crashlog->entry;
> @@ -139,6 +139,8 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  		reg &= ~bit;
>  
>  	writel(reg, entry->disc_table + control->offset);
> +
> +	return 0;
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> @@ -181,20 +183,20 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_typ
>  	return false;
>  }
>  
> -static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
> +static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
>  				     bool disable)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
>  }
>  
> -static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
>  }
>  
> -static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
>  }
>  
>  static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> @@ -207,9 +209,9 @@ static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
>  }
>  
> -static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
>  }
>  
>  static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> @@ -222,9 +224,9 @@ static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
>  }
>  
> -static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
>  }
>  
>  /*
> @@ -245,13 +247,13 @@ clear_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool clear;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &clear);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &clear);
> +	if (ret)
> +		return ret;
>  
>  	/* set bit only */
>  	if (!clear)
> @@ -259,9 +261,9 @@ clear_store(struct device *dev, struct device_attribute *attr,
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_clear(crashlog);
> +	ret = pmt_crashlog_set_clear(crashlog);
>  
> -	return count;
> +	return ret ? ret : count;
>  }
>  static DEVICE_ATTR_RW(clear);
>  
> @@ -280,13 +282,13 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  {
>  	struct crashlog_entry *crashlog;
>  	bool consumed;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &consumed);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &consumed);
> +	if (ret)
> +		return ret;
>  
>  	/* set bit only */
>  	if (!consumed)
> @@ -300,9 +302,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  	if (!pmt_crashlog_complete(crashlog))
>  		return -EEXIST;
>  
> -	pmt_crashlog_set_consumed(crashlog);
> +	ret = pmt_crashlog_set_consumed(crashlog);
>  
> -	return count;
> +	return ret ? ret : count;
>  }
>  static DEVICE_ATTR_RW(consumed);
>  
> @@ -321,19 +323,19 @@ enable_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool enabled;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &enabled);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &enabled);
> +	if (ret)
> +		return ret;
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_disable(crashlog, !enabled);
> +	ret = pmt_crashlog_set_disable(crashlog, !enabled);
>  
> -	return count;
> +	return ret ? ret : count;
>  }
>  static DEVICE_ATTR_RW(enable);
>  
> @@ -362,13 +364,13 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool rearm;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &rearm);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &rearm);
> +	if (ret)
> +		return ret;
>  
>  	/* set only */
>  	if (!rearm)
> @@ -376,9 +378,9 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_rearm(crashlog);
> +	ret = pmt_crashlog_set_rearm(crashlog);
>  
> -	return count;
> +	return ret ? ret : count;
>  }
>  static DEVICE_ATTR_RW(rearm);
>  
> @@ -400,13 +402,13 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool trigger;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &trigger);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &trigger);
> +	if (ret)
> +		return ret;
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> @@ -415,17 +417,17 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  		return -EBUSY;
>  
>  	if (!trigger) {
> -		pmt_crashlog_set_clear(crashlog);
> -		return count;
> +		ret = pmt_crashlog_set_clear(crashlog);
> +		return ret ? ret : count;
>  	}
>  
>  	/* we cannot trigger a new crash if one is still pending */
>  	if (pmt_crashlog_complete(crashlog))
>  		return -EEXIST;
>  
> -	pmt_crashlog_set_execute(crashlog);
> +	ret = pmt_crashlog_set_execute(crashlog);
>  
> -	return count;
> +	return ret ? ret : count;
>  }
>  static DEVICE_ATTR_RW(trigger);
>  
> 

-- 
 i.

