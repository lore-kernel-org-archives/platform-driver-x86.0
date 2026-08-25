Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3593EC685
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650492; cv=none; b=ImhqDUjzWzuLxUBo+FM1ETrP4qQbi5JH5td9bn3QeWOuLKOVYwJzqsDA7fZHsjGEmaHbJlND50GIYkcEMX/xErkVEtrdxuDjEylPzs9M97zWNOuE5jIyodawqNzaCa0gcpWJahkc1hiVeA3Qp6Y1ae8cT6i76JTpMXHYgbfxoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650492; c=relaxed/simple;
	bh=KlF/8GVOr+Pgut7IyB9p0C8vh65ERwpQ25zE27gbb3M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g8ElL4U0miuqRMRS5jGbOTWuurL/rnrpskvmm1nF45z9Hr/iOH7r00IlvRST608w0OnzdMEvXkbANH0izZokA03n6Odq4kPiav+YSfa4j43fi3JGxmN4O/9NJuq8gi+87INJa4O5A1lJ9T++zDU0YFXJnz9w2wQm1N3IZOJei0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eznmjm1O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eznmjm1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787650490; x=1819186490;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KlF/8GVOr+Pgut7IyB9p0C8vh65ERwpQ25zE27gbb3M=;
  b=eznmjm1OTw/vormoSLKFkLWKKmkLcZQhRHILFUtNWdnQ0WVVAgV+UDoO
   pmOumRUmfuWPyPFiIZPJUlW2nbF747G9C42QXhI1+1F/GkiARrExyvX+Z
   P0/spdYPxCY8ewx8wH3DG+h4TL/Ktag0KRLYMQgmr7xLl6PYb1GN41p+J
   1FCgBFkZC8lFO0GRgJ70kI5G+8c381P1a25ShPVuPxcuX0XBHVJD7cIRa
   p2ff0ftMSmMBmyq0WoNx6P5UUPmy7m++KRwx+pSQs29huUzFao/i89HCK
   AD7LYYxfmVN4MAipYlQgfqMui7Fz9sGJGrTOCe8vVpTRx2Ob5QlFS5lGI
   g==;
X-CSE-ConnectionGUID: fG+uMFG1TY6/Nhqoccbpuw==
X-CSE-MsgGUID: G0aeTnujQsCX8pr65WoUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88129495"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88129495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:34:49 -0700
X-CSE-ConnectionGUID: /yxF89rURqCy/kBjwuWgpg==
X-CSE-MsgGUID: GY+AQnHERUCkSGIzWXx6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263965814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:34:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 12:34:41 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
In-Reply-To: <20260824162317.2450380-14-michael.j.ruhl@intel.com>
Message-ID: <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-14-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Some HW does not have direct MMIO access to PMT control and data
> features.
> 
> Augment the current callback infrastructure (data access) to allow
> a registered driver to customize read/write access to the control
> paths for PMT usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
>  include/linux/intel_vsec.h                | 14 +++++++-
>  2 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index f936daf99e4d..5923ad7abbd9 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control = &crashlog->info->control;
>  	struct intel_pmt_entry *entry = &crashlog->entry;
> -	u32 reg = readl(entry->disc_table + control->offset);
> +	u32 guid = entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb && entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->dev, guid, &reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);

Never print __func__ in any user consumable message (level > debug) but 
write the message in plain English.

Also, this needs include.

> +			return;
> +		}
> +	} else {
> +		reg = readl(entry->disc_table + control->offset);

Add include.

> +	}
>  
>  	reg &= ~control->trigger_mask;
>  
> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb && entry->cb->write_reg) {
> +		err = entry->cb->write_reg(entry->dev, guid, reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to write reg: %d\n", __func__, err);

Rephrase without using __func__.

> +			return;
> +		}
> +	} else {
> +		writel(reg, entry->disc_table + control->offset);
> +	}
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
> -	u32 reg = readl(crashlog->entry.disc_table + status->offset);
> +	struct intel_pmt_entry *entry = &crashlog->entry;
> +	u32 guid = entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb && entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->dev, guid, &reg, status->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return false;

It seems you need a lerger rework here to properly return error codes.

> +		}
> +	} else {
> +		reg = readl(crashlog->entry.disc_table + status->offset);

entry->disc_table

> +	}

This looks mostly duplicated code, add a helper?

>  
>  	return !!(reg & bit);
>  }
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 843cda8f8644..917d9397a993 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -90,13 +90,25 @@ enum intel_vsec_quirks {
>   * @read_telem: when specified, called by client driver to access PMT
>   * data (instead of direct copy).
>   * * dev:   device reference for the callback's use
> - * * guid:  ID of data to acccss
> + * * guid:  ID of data to access
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_reg: when specified called by client driver to read PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to read
> + * @write_reg: when specified called by client driver to write PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to write
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
> +	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {
> 

-- 
 i.

