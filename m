Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C352746A
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 May 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667953; cv=none; b=ha7p8LB2l8Z2klnhlZ5WfahyyFMGZKD6lZVBWO+v9GC03xE3vos7jB0tLrAzFsgqd2MI/EPQ875qzbJ3Plt/o9+SD/2GNxayY6SRKFhaE6iRiR7YJjGdxcIz2QojNkngp30AVI8uC8woPIzlV6gw9S/SRQbKdKW43nHTbTUj9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667953; c=relaxed/simple;
	bh=0MatwH9Sqr580nLpu3vD7O9MO7m4bGYdhn+FHWViPCY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FeqsSGRvNBe5tgCZAsK8+lMOLm1KYSahMS4RI0TXG8ScfHxD4p17dwUmTF5JqSHY0yI8KruqRw+uHkWN98H297qBoWS4wThAlCknxOipRpZD48dBOOhzQdzLkaRy7cWSVgUT/hLmoHbkyr+73sfBlxeh1BKfDQsrmQpXCMAPrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzvqR6H2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzvqR6H2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747667951; x=1779203951;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0MatwH9Sqr580nLpu3vD7O9MO7m4bGYdhn+FHWViPCY=;
  b=OzvqR6H2NtGji+DDToo8HrQ1fFRL4Kdsfb1B0/eMEqpTxRcBjbvTUUQc
   CSYL+kAz09SukzyrSAIsPxAeIT47DSh9pCsx2kU+Mv3C76CT/zE3pEyzE
   B40r6SVBmwT87gangiD4iTC6KOsyLDPYQfIC98N4hUOjGxObXfr0k/WYM
   6GOA2A19jQmnJqEWbWtgFH0r5KSJSde0jtPgXNbPYeHBEE4LyDGj8EBsH
   l0ZdEAx6Ia3JKlhjk1d++a6ZTHnjQfmD1stH+520sHHH2y0X9Do/ZPIrE
   P6Xuo7aRxKPYfaR1Y44lTxcZJ8K4bq4YopelGhpf8nGdqD9GuGzo1K9/P
   A==;
X-CSE-ConnectionGUID: lRaUQGNXQ6ue7BDdpuR1Xg==
X-CSE-MsgGUID: W2YSNNDDSUabvKmZEK5r4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53371192"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="53371192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:19:10 -0700
X-CSE-ConnectionGUID: TJceXrECRxa2xRko8LJNBg==
X-CSE-MsgGUID: 07evKwfrSKyzaR64W+3hMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="162680173"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:18:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 18:18:46 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86/intel/pmt: update to bit access
In-Reply-To: <20250516150416.210625-3-michael.j.ruhl@intel.com>
Message-ID: <4d89e26e-72a4-d79e-2b60-3e9b401fca0e@linux.intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com> <20250516150416.210625-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Michael J. Ruhl wrote:

> The current usage of BIT offsets limits adding new

BIT()

> functionality to the crashlog register access.

Please be more precise how it limits, as I don't buy it in the current 
form.

I suspect the limitation is self-imposed by not naming field properly with 
defines but putting GENMASK() inside defines that custom-coded also 
FIELD_GET/PREP() so please check if using FIELD_GET/PREP() within the 
functions (not in the macros) with named defines that only specify field 
masks can overcome the supposed limitations.

> Update the bit mask #defines to use a bit defined
> structure.

These seem quite short lines.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 116 +++++++++++++++-------
>  1 file changed, 79 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 952bfe341f53..dba7e7c1585d 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -22,29 +22,12 @@
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
>  #define BASE_OFFSET		0x8
>  #define SIZE_OFFSET		0xC
>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
> -#define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
> -#define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
>  /* size is in bytes */
>  #define GET_SIZE(v)		((v) * sizeof(u32))
>  
> @@ -54,6 +37,39 @@ struct crashlog_entry {
>  	struct mutex			control_mutex;
>  };
>  
> +struct type1_ver0_base {
> +	u32 access_type:	4;  /* ro     0:3  */
> +	u32 crash_type:		4;  /* ro     4:7  */
> +	u32 count:		8;  /* ro     8:15 */
> +	u32 version:		4;  /* ro    16:19 */
> +	u32 rsvd:		8;  /* ro    20:27 */
> +	u32 disable:		1;  /* rw    28:28 */
> +	/*
> +	 * Bits 29 and 30 control the state of bit 31.
> +	 *
> +	 * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
> +	 * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
> +	 * Bit 31 is the read-only status with a 1 indicating log is complete.
> +	 */
> +	u32 clear:		1;  /* rw    29:29 */
> +	u32 manual:		1;  /* rw/1s 30:30 */
> +	u32 complete:		1;  /* ro/v  31:31 */
> +};
> +
> +struct crashlog_status {
> +	union {
> +		struct type1_ver0_base stat;
> +		u32 status;
> +	};
> +};
> +
> +struct crashlog_control {
> +	union {
> +		struct type1_ver0_base ctrl;
> +		u32 control;
> +	};
> +};
> +
>  struct pmt_crashlog_priv {
>  	int			num_entries;
>  	struct crashlog_entry	entry[];
> @@ -64,27 +80,34 @@ struct pmt_crashlog_priv {
>   */
>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_status status = {
> +		.status = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
>  
>  	/* return current value of the crashlog complete flag */
> -	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +	return status.stat.complete;
> +
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_status status = {
> +		.status = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
>  
>  	/* return current value of the crashlog disabled flag */
> -	return !!(control & CRASHLOG_FLAG_DISABLE);
> +	return status.stat.disable;
>  }
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>  {
> -	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_control discovery_header = {
> +		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
>  	u32 crash_type, version;
>  
> -	crash_type = GET_TYPE(discovery_header);
> -	version = GET_VERSION(discovery_header);
> +	crash_type = discovery_header.ctrl.crash_type;
> +	version = discovery_header.ctrl.version;
>  
>  	/*
>  	 * Currently we only recognize OOBMSM version 0 devices.
> @@ -96,37 +119,53 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>  				     bool disable)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_control control = {
> +		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
>  
>  	/* clear trigger bits so we are only modifying disable flag */
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +	control.ctrl.clear = 0;
> +	control.ctrl.manual = 0;
> +	control.ctrl.complete = 0;
>  
>  	if (disable)
> -		control |= CRASHLOG_FLAG_DISABLE;
> +		control.ctrl.disable = 1;
>  	else
> -		control &= ~CRASHLOG_FLAG_DISABLE;
> +		control.ctrl.disable = 0;
>  
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>  }
>  
>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_control control = {
> +		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
>  
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
> +	/* clear trigger bits so we are only modifying disable flag */
> +	control.ctrl.disable = 0;
> +	control.ctrl.manual = 0;
> +	control.ctrl.complete = 0;
>  
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	control.ctrl.clear = 1;
> +
> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>  }
>  
>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	struct crashlog_control control = {
> +		.control = readl(entry->disc_table + CONTROL_OFFSET),
> +	};
> +
> +	/* clear trigger bits so we are only modifying disable flag */
> +	control.ctrl.disable = 0;
> +	control.ctrl.clear = 0;
> +	control.ctrl.complete = 0;
>  
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
> +	control.ctrl.manual = 1;
>  
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	writel(control.control, entry->disc_table + CONTROL_OFFSET);
>  }
>  
>  /*
> @@ -304,6 +343,9 @@ static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
>  	size_t size;
>  	int i, ret;
>  
> +	BUILD_BUG_ON(sizeof(struct crashlog_control) != sizeof(u32));
> +	BUILD_BUG_ON(sizeof(struct crashlog_status) != sizeof(u32));
> +
>  	size = struct_size(priv, entry, intel_vsec_dev->num_resources);
>  	priv = devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
>  	if (!priv)
> 

-- 
 i.

