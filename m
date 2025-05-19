Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0E27511A
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 May 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667606; cv=none; b=PHOQIvt1v5XMFCe+XE7IySjFZJq9He2t0NXGg6wmjeXFb0OGIyW/NJ7+W9+Gpj/RV1/DGpuJQ/x3kpNo7QpYZHZPYoLqFS67dhCZl12b19UdjkKgYW5gozngJ19tmarn8YYI4gEw2YK+w7tpADrlDO866Jk0WWJ1voHPXhP0934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667606; c=relaxed/simple;
	bh=x1qcQyJJr4gWeZVeThTRtLSDGu5CqIMI+3N2XMa2SJ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YUX6Z67udxRhwCXDeDTCN/yCR5TEpz37rZvZJjax3xCOYtR8vTa4sRiWblgXMO0/la7LSFP9ND25KX92U4bVfIC/oAXFURRz+okgUQZr5uu7DX+kK+Hxi3wLMiJs1CxgKmGTqWSwoSK98wX4Ph4K0/O80SWBRHr67H21VlvVEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzK9J+YQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzK9J+YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747667604; x=1779203604;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=x1qcQyJJr4gWeZVeThTRtLSDGu5CqIMI+3N2XMa2SJ0=;
  b=IzK9J+YQ2hCdl9Rf4TRez0XcO5qVtHpDyB6dwq3CNrp5MtfPwaMom94a
   4lSxelRR+no4uFUZ20uIEg8G/rhVs7Ok66rp4c4eLQqekZe+O9y0CZTI5
   Gp2LzUjLNiLrC/MH1hpyQLpiniaWdshEQIUYycGzYtzA2HPm7lo6ZskLP
   q2lfc37RDMkQ0YQzHMPyIeP5NmsLnGtKSZ3gigMfy5+Nb+Wpv7Ani8yEe
   IznmUWz+1qwWq6JVLNKG36lzIjIZAg+Bfv1M9fiFHUyQs7f23MnU0saI4
   TZIVPnYlyZ+5SWssKu6ckcDpC9szRQxbatGuIf+DNEeDl+3CwNbHZ61Ha
   Q==;
X-CSE-ConnectionGUID: AZzKGxoaSamtP4wYKCXsZw==
X-CSE-MsgGUID: GftJAxrSSCCloGWoNxS1/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49499693"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49499693"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:13:23 -0700
X-CSE-ConnectionGUID: B/7tmK+tT22p/GhIzCIXKQ==
X-CSE-MsgGUID: Rl7WbEzhQ/y5LFrrVaKF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="170434787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:13:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 18:13:19 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/4] platform/x86/intel/pmt: crashlog binary file
 endpoint
In-Reply-To: <20250516150416.210625-2-michael.j.ruhl@intel.com>
Message-ID: <6486a90b-6d5d-01c3-c9a4-6921e8c2692c@linux.intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com> <20250516150416.210625-2-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Michael J. Ruhl wrote:

> The export API added a requirement for end point data to be
> used by the intel_pmt_read() function to access mmio data.

Can you please try to rephrase this, something feels wrong with the 
grammar (but do realize I'm a non-native speaker).

I'm unsure what requires it due to general vagueness feel of the wording.

I guess you wanted to say something along these lines:

PMT export API intel_pmt_read() requires end point data to perform
MMIO access.

> Without the ep, the call causes a NULL pointer exception.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 12 UID: 0 PID: 5721 Comm: cat Tainted: G           OE       6.15.0-rc4+ #3 PREEMPT(voluntary)
> Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 1641 02/21/2024
> RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
> Code:
> RSP: 0018:ffffb19981ebba18 EFLAGS: 00010246
> RAX: ffffffffc0ef8e08 RBX: 0000000000000800 RCX: 0000000000000800
> RDX: ffff99aee03af450 RSI: ffff99ae86552000 RDI: 0000000000000000
> RBP: ffffb19981ebba58 R08: 0000000000000000 R09: 0000000000000800
> R10: 000000000e2f8200 R11: 0000000000000000 R12: 0000000000000000
> R13: ffff99aee03af450 R14: ffff99ae8a4bbc00 R15: ffff99ae86a35a40
> FS:  00007f097dd88740(0000) GS:ffff99b62fbe8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000198860005 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? sysfs_kf_bin_read+0xc0/0xe0
>  kernfs_fop_read_iter+0xac/0x1a0
>  vfs_read+0x26d/0x350
>  ksys_read+0x6b/0xe0
>  __x64_sys_read+0x1d/0x30
>  x64_sys_call+0x1bc8/0x1d70
>  do_syscall_64+0x6d/0x110
>  ? __mod_memcg_lruvec_state+0xe7/0x240
>  ? __lruvec_stat_mod_folio+0x8f/0xe0
>  ? set_ptes.isra.0+0x3b/0x80
>  ? do_anonymous_page+0x101/0x9c0
>  ? ___pte_offset_map+0x20/0x180
>  ? __handle_mm_fault+0xba3/0x1010
>  ? __count_memcg_events+0xca/0x190
>  ? count_memcg_events.constprop.0+0x1e/0x40
>  ? handle_mm_fault+0x1a8/0x2b0
>  ? do_user_addr_fault+0x2f6/0x7b0
>  ? irqentry_exit_to_user_mode+0x33/0x170
>  ? irqentry_exit+0x3f/0x50
>  ? exc_page_fault+0x94/0x1b0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f097db25701

Please trim this splat to have only what's relevant.

> Add the endpoint information to the crashlog driver to avoid
> the NULL pointer exception.
> 
> Two minor white space issues are addressed as well.
> 
> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to read telemetry")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 38 ++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 6a9eb3c4b313..952bfe341f53 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  
>  static ssize_t
>  enable_store(struct device *dev, struct device_attribute *attr,
> -	    const char *buf, size_t count)
> +	     const char *buf, size_t count)
>  {
>  	struct crashlog_entry *entry;
>  	bool enabled;
> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
>  
>  static ssize_t
>  trigger_store(struct device *dev, struct device_attribute *attr,
> -	    const char *buf, size_t count)
> +	      const char *buf, size_t count)
>  {
>  	struct crashlog_entry *entry;
>  	bool trigger;

Please separate these, in general, put whitespace cleanups outside the 
lines you touch due to real code changes always into own patch.

> @@ -222,6 +222,31 @@ static const struct attribute_group pmt_crashlog_group = {
>  	.attrs	= pmt_crashlog_attrs,
>  };
>  
> +static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
> +				     struct intel_pmt_entry *entry)
> +{
> +	struct telem_endpoint *ep;
> +
> +	/* Endpoint lifetimes are managed by kref, not devres */
> +	entry->ep = kzalloc(sizeof(*entry->ep), GFP_KERNEL);
> +	if (!entry->ep)
> +		return -ENOMEM;
> +
> +	ep = entry->ep;

Since you have the local var here anyway, I'd kzalloc into ep and only 
assign into entry->ep later (after error checks and filling it).

> +	ep->pcidev = ivdev->pcidev;
> +	ep->header.access_type = entry->header.access_type;
> +	ep->header.guid = entry->header.guid;
> +	ep->header.base_offset = entry->header.base_offset;
> +	ep->header.size = entry->header.size;
> +	ep->base = entry->base;
> +	ep->present = true;
> +	ep->cb = ivdev->priv_data;
> +
> +	kref_init(&ep->kref);
> +
> +	return 0;
> +}

This is 100% copy from telemetry.c, isn't it? The code duplication should 
be avoided.

>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  				      struct device *dev)
>  {
> @@ -252,6 +277,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns = {
>  	.xa = &crashlog_array,
>  	.attr_grp = &pmt_crashlog_group,
>  	.pmt_header_decode = pmt_crashlog_header_decode,
> +	.pmt_add_endpoint = pmt_crashlog_add_endpoint,
>  };
>  
>  /*
> @@ -262,8 +288,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
>  	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
>  	int i;
>  
> -	for (i = 0; i < priv->num_entries; i++)
> -		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
> +	for (i = 0; i < priv->num_entries; i++) {
> +		struct intel_pmt_entry *entry = &priv->entry[i].entry;
> +
> +		kfree(entry->ep);
> +		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
> +	}
>  }
>  
>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
> 

-- 
 i.

