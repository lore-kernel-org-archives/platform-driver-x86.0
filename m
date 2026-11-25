Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650991;
	b=ajngN12n6b2iu7ocNrCLui/NE8G1e3E7o5fjxS6DLYg051uV9TR2tGEHLCzbPvv7bYyM
	 lBJgbsLfDswKlvKh6uWRFzjKi28opnDgCFITTHzAJH2DnT2zfhfayu6VDrdvbtarUgg7a
	 qjs1P0l3fmbqEaCv804aaD1YLA1N7VlxnIW+jiDtaHW4dbkoYByE+23i/WZAkdXmxYQlE
	 EhEMG37rsYnc5/ueDmeiRMxq32qlgK5U0xnunHXKVT8S5nj9COJ2+PpOTf5lzLd34aazh
	 QEb0FYiW52D7ctg54lMa0fE7dAk/QeBRNqU7gq4DEOrzKcbf8MhSn0kvU5j1/WCObHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650991;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=nzmbmUrdM9CoB+LD3uDLv1+sNLFM9+y+EQrSvwS43eY=;
	b=1ZCfQZlI00etLvW5ZcBoJJn9Jl9ybzWYC+c+u2RhS38LFhuWiUGy68Ab3Xjcjn+bvQsF
	 msczAGv+rnn293xh3m+To70hCA3kxnJwbYPSXYnIPkvtAjuAddN7H6O+PidFy/pbB9ZI7
	 bLwCzy7xU57efUKJ7Wauq/nmvgmiW3CaFZ7yg/ab6uDc6p9aTC9t/97e3K+myEaPfIirN
	 s8MkP7lb21D1/IT++5fTz0Q1b3+NGF3WJqPetAwsbjmuHTrOLkM4JxGDe7wcTxz2oLEc5
	 8gYtxp1VT4dJ8RtNJ8NvbBlSDv/mfwQWg3kshZKcnM89nae0y13k4a9V2HwfPdg3vhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=giXcuoHj;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC99606A31E;
	Wed, 25 Nov 2026 23:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=giXcuoHj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650991; x=1827186991;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3SZySGmGZ/6zaBV/zxbuC06d9SCUvUnwpfXqYO3xQQM=;
  b=giXcuoHju6EkFJ/A84YDUGW2uf6MUDvDvRwOvqPxHrBOEP2JH5xSoxQg
   aC+D4e8M4DpR8tlgGxKLagjnokqQGo/l97kASHMRKFz67v+dQCwlibuxm
   HK1VVAVsl5Rg0WUFWbJO1QL78cm3wK2lRS6tscXJ/nUyHb6UYeeZm8JgT
   BPqQdh3NyaEmbTZgud2ANjuMd51JgG1zGmVMVORAcFYxf1EsRswCX/JdU
   a37N5su6vVKYNn7zla0j/p0RQsZdwSRRGpAxwpAX2N24KuTcACpHjEC2Q
   En5hh+fWfN+ht/IBydgmPREKVu8/hxClcUzrcBzaQux4w/qtsfwAoi0RJ
   w==;
X-CSE-ConnectionGUID: 6DPRbxj2RqSWWoYDl6POtw==
X-CSE-MsgGUID: kyA+FjxOSB6/JVdLN/rV2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4454400"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4454400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:56:31 -0800
X-CSE-ConnectionGUID: uQvXQlThQjmt+ZS/8eZAUg==
X-CSE-MsgGUID: pCKsUiAgT/mAnb4vEcF+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12008787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:56:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Nov 2026 01:56:25 +0200 (EET)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86/intel-uncore-freq: Fix deadlock when
 removing attributes
In-Reply-To: <20261115014948.2517688-3-srinivas.pandruvada@linux.intel.com>
Message-ID: <4ff9e62f-db67-6eb5-94e1-8d8e36a2756e@linux.intel.com>
References: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com> <20261115014948.2517688-3-srinivas.pandruvada@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Nov 2026, Srinivas Pandruvada wrote:

> uncore_freq_remove_die_entry() holds uncore_lock while removing the
> attribute group of an entry. Removing attributes waits for active sysfs
> callbacks of these attributes to finish. But the show and store callbacks
> take uncore_lock, which results in an ABBA deadlock:
> 
>   CPU0                              CPU1
>   ----                              ----
>   kernfs_fop_read_iter()
>     show_attr()                     uncore_freq_remove_die_entry()
>                                       mutex_lock(&uncore_lock)
>       mutex_lock(&uncore_lock)        delete_attr_group()
>                                         sysfs_remove_group()
>                                           waits for CPU0
> 
> Mark the entry as not valid with an invalid control CPU under
> uncore_lock, and remove the attribute group after releasing it. Free
> the seqnum_id after the attribute group is removed, so that the name
> can't be used by a new entry while the old attributes still exist.
> 
> Adding and removing the same entry is serialized by the callers: CPU
> hotplug callbacks in the MSR based driver, and device probe and remove
> in the TPMI driver. Callbacks running before the attributes are removed
> are safe: the MSR based driver returns -ENXIO for an invalid control CPU,
> and the TPMI driver MMIO is unmapped only after the device is removed.
> 
> Fixes: ae7b2ce57851 ("platform/x86/intel/uncore-freq: Use sysfs API to create attributes")
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../uncore-frequency-common.c                 | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 6051aa040abf..22019099a857 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -313,17 +313,24 @@ void uncore_freq_remove_die_entry(struct uncore_data *data)
>  {
>  	mutex_lock(&uncore_lock);
>  	/* Nothing to remove, if the entry was not added or already removed */
> -	if (!data->valid)
> -		goto uncore_unlock;
> +	if (!data->valid) {
> +		mutex_unlock(&uncore_lock);
> +		return;
> +	}
>  
> -	delete_attr_group(data, data->name);
>  	data->control_cpu = -1;
>  	data->valid = false;
> +	mutex_unlock(&uncore_lock);

Please redo with scoped_guard() to avoid having to split unlock.

> +
> +	/*
> +	 * Removing the attributes waits for active sysfs callbacks, which take
> +	 * uncore_lock. So this can't be done while holding uncore_lock.
> +	 */
> +	delete_attr_group(data, data->name);
> +
> +	/* Free the ID after the attributes with the name using it are removed */
>  	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID)
>  		ida_free(&intel_uncore_ida, data->seqnum_id);
> -
> -uncore_unlock:
> -	mutex_unlock(&uncore_lock);
>  }
>  EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, "INTEL_UNCORE_FREQUENCY");
>  
> 

-- 
 i.

