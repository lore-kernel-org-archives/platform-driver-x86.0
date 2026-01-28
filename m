Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432D10A1E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614240; cv=none; b=HLakCb18/lP31GpboY7imZotMrL30/ePcvKR5YSfPw2SNxunw2UQm199NDDVZytl48NJzj0serRqE9V6EB6GSbh0D5oqZushIw/QpZOzV6UrHoHQe/ejtn/c8ANoLmMR0bJfKlBFSW13E4QMgWlUXaM+9ODKyeqHU6wHe/br6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614240; c=relaxed/simple;
	bh=6zPd5spmWJWQQqvS+/TKoBN5KReKeBDGB+kuYGaloQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VZUXQwemzVpS2B4qbB2z8CkuW6zclb/prTp6fdrt3ukNwiHzraELjxzFbMGY2CNdfTYS1xwHwTsImwXCCvxodGgNlKpF66LXkxCV2lMaPmVrTpJC/S1DzHPU+1PsuGRlfbSJd4PwhyDx8edCFJbcfUNuMQgmG5pHEyrqfiAagB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZXAr0cl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZXAr0cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769614239; x=1801150239;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6zPd5spmWJWQQqvS+/TKoBN5KReKeBDGB+kuYGaloQA=;
  b=YZXAr0clxZwSnSAh3t4Gqk9LQB1+Ec3Ctt+QmWNMv1xuw6Nhb/m9aGRh
   MoN2jp3V4IAk4FhEYguxjpl7Brx/MwGVVUiiSa/gqIXGmxiV89MYN80jq
   6Leucb53e46JpI6HNYJlRkPZaFDB/DqikLedjBdfdtmcP2s0wRZaq26na
   a21TNrO1vqs6mq41eamE6uySDB8qhL0zilQvlMVbs3G7olXyvNGpfave6
   w7MxT8nHNj22QWKl3A169nTAslHlfPNd23H/xmoGfKcOuDE6kCvv2UGoD
   pb/p+1gxc7ceLYnXhrIMPYj0sHeh/Ad2nUT/QInnxx3T2/9qkaZDx+4bz
   Q==;
X-CSE-ConnectionGUID: 9h5Ff6eKQ6KnruBaTHjMqA==
X-CSE-MsgGUID: d6y9NahHRsm7U7VWbCt0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81557828"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81557828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:30:38 -0800
X-CSE-ConnectionGUID: LZdElvtJT5y4ax/7q8xgDQ==
X-CSE-MsgGUID: W4uQP4cPT3u8k47ODINEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208536126"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.207])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:30:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 1/5] pmt: Add register access callbacks
In-Reply-To: <20260127182418.640701-8-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-8-michael.j.ruhl@intel.com>
Date: Wed, 28 Jan 2026 17:30:31 +0200
Message-ID: <7c4167508d597118cab2470daadab05e10297d5e@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 27 Jan 2026, "Michael J. Ruhl" <michael.j.ruhl@intel.com> wrote:
> Some HW does not have the explicit access via MMIO.  Allow
> for parent drivers to control access to the status/control
> path.

I think this is quite vague, and could use some copy-paste from the
cover letter, for posterity.

BR,
Jani.

>
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
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset);
> +	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {

-- 
Jani Nikula, Intel
