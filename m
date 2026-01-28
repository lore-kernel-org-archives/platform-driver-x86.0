Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F444242D6C
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603257; cv=none; b=BQCcF6CI2/rYRs764GzQU6n0DKNNDNn689+XwfyNb3HYSztttHeqi9ekY46VKiFZ7Dj67tiM+26crFSjiTpgo9qyloX8slHQ5rJbV9cOqpFY2VHmqklZtNnn1Ss4C178N3xtrKtCiXgxLQFy7qCRzjW9eAG7ilE5yozmuBqxjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603257; c=relaxed/simple;
	bh=mSU9Od5pfumgAGx59V+h4QAONM+CmRRuzzgcCfSxee0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g0PSQ+LSnSPuMy8+5sdNQ1IjL023txyL6Z/qMINneDfeXNBQ0JWYZ6rh7MpWqjgQg8JntII5OsYVQwRwn6fqB07U8nzbrkXQpxu9zJU08VhpgpFQlPii17T3qUe0nGxeLCPso4v7AUZeimk9iJHaECbTax4aUC8v51rdC5j/Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tl7Zhi+w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tl7Zhi+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769603256; x=1801139256;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mSU9Od5pfumgAGx59V+h4QAONM+CmRRuzzgcCfSxee0=;
  b=Tl7Zhi+wX4Lfz3cOWAnx06ktB5zkjgeCqBkGpujFh8/RNENdc71QVYlt
   o/tu21YHGd08tqU4G3RbIbXD9vUjubBDRU0wy6f8A6pSo29/G0QhyzPI5
   5hBL8wcfzWAQIbkylskW3H347LTEEllhn/jmqYdRsSkbNTsiCeq3SgvB2
   cBZwLPWjsMO8VvjBD5HyWuY3PrgKOn8EPQh80KT+eFI+Sb/g5Xu7SpW0n
   r9qoof0GbEOGHyONtyyLRyrKiNvAnQfj7q2LsShkc9aCxWhT7FVI7jdU7
   DhJeze6d4nfBgH7Ilgxb5q21hkNqutHHgAQ7BSOC030uhgaYutosO9SEz
   Q==;
X-CSE-ConnectionGUID: gfDwYe3bSG2nYbeXbU4PMA==
X-CSE-MsgGUID: RzRFxqW6SYiwdXHyb+hfKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74673331"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74673331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:27:35 -0800
X-CSE-ConnectionGUID: tyt7dcc8Tseq5OQRWqUuLg==
X-CSE-MsgGUID: dER6XLW+QxOSz2Q8raJCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213123560"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:27:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:27:29 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 1/5] pmt: Add register access callbacks
In-Reply-To: <20260127182418.640701-8-michael.j.ruhl@intel.com>
Message-ID: <406d5451-0f09-df2c-1b49-4e643e605a24@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com> <20260127182418.640701-8-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> Some HW does not have the explicit access via MMIO.  Allow

One space is enough after a stop.

Please reflow to 72 chars.

> for parent drivers to control access to the status/control
> path.

This sounds quite vague compared with what you're doing (adding ability to 
provide custom read/write accessors).

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
>  include/linux/intel_vsec.h                | 26 +++++++++++----
>  2 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index b0393c9c5b4b..978b35d56888 100644
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
> +	if (entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->pcidev, guid, &reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);

Please don't ever use __func__ in prints intended to be visible for normal 
users.

> +			return;
> +		}
> +	} else {
> +		reg = readl(entry->disc_table + control->offset);
> +	}
>  
>  	reg &= ~control->trigger_mask;
>  
> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb->write_reg) {
> +		err = entry->cb->write_reg(entry->pcidev, guid, reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
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
> +	if (entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->pcidev, guid, &reg, status->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return false;
> +		}
> +	} else {
> +		reg = readl(crashlog->entry.disc_table + status->offset);
> +	}
>  
>  	return !!(reg & bit);
>  }
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 1a0f357c2427..5416f84aca40 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -80,16 +80,28 @@ enum intel_vsec_quirks {
>  
>  /**
>   * struct pmt_callbacks - Callback infrastructure for PMT devices
> - * @read_telem: when specified, called by client driver to access PMT
> - * data (instead of direct copy).
> - * * pdev:  PCI device reference for the callback's use
> - * * guid:  ID of data to acccss
> - * * data:  buffer for the data to be copied
> - * * off:   offset into the requested buffer
> - * * count: size of buffer
> + * ->read_telem() when specified, called by client driver to access PMT data (instead
> + * of direct copy).
> + * @pdev:  PCI device reference for the callback's use
> + * @guid:  ID of data to access
> + * @data:  buffer for the data to be copied
> + * @off:   offset into the requested buffer
> + * @count: size of buffer
> + * ->read_reg() when specified called by client driver to read PMT state
> + * @pdev: PCI device reference for the callback's use
> + * @guid: ID of data to access
> + * @data: buffer for the register data to be read
> + * @offset: offset of control register to access
> + * ->write_reg() when specified called by client driver to write PMT state
> + * @pdev: PCI device reference for the callback's use
> + * @guid: ID of data to access
> + * @data: buffer data to be written to the register
> + * @offset: offset of control register to access

Have you checked that these don't generate warnings and how they look 
visually?

>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset);
> +	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {
> 

-- 
 i.

