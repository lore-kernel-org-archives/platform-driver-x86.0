Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D813AA50
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709042374; cv=none; b=SfOsgyFyp9FTDw31nvxnbtR6c27iw513Hgm9mYj1l/0Bj5QNQVyI8kjQH13LqCsPtpJHVZFPfCw20QsnlbMzD1B3H3wA4fkpxqTR1dy8pf+z6QLdXIfB21TMHc9f+CFAwT/ZR54y1V2eTQ2/m1RMcPrBn6iwSA6U+beGa61ugLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709042374; c=relaxed/simple;
	bh=GeOovgroPKVuST448CDh7VcITZszAmUcPGW5n+ObmnU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U1BeAlvNRjwjSyAZchS24VKL1+CwzS2nqpmecMyCv1GykilN2T594feygynhgVAtpwNGunMHwgeVfonSJdxqqC7had99Q/Xheyk1w1/CUOXyQ7mDHRvJ5xRg2hkx+dWdaXYlsWufVZnrOIvXJyXQ8a5BFzQRyP2M0ddDr2OVFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQBaTu2o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQBaTu2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709042373; x=1740578373;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GeOovgroPKVuST448CDh7VcITZszAmUcPGW5n+ObmnU=;
  b=VQBaTu2oBhFUQJuEETxAw2SK7iqBz4jr68uzxh+Da6pRWilD05Y+y8Pn
   xFOlprPGvreGgzRs00mDLEZbucyRuMhYsOSDPUnHvE1wKDvJNUbkDaIT+
   /nat6HgTRrNVKUrs5oZzBurIgRD2lcmkmlJeHYcsOtQ9H/+f4Qf1YOfWk
   irOLUDFysyZyM+KOWYdAxeD+TJZQZEkwZ7DQEygcgqK0qbqCjkmconTT9
   piyPsUrB9P3JzG2wsZLg8DPkof3qVKiLMZmPxK5WZHHQehJLtrCtJmtjI
   GCYfwvRY08PDLTIBDuch1/mpgmowpDhiAeVl6YtwFtBsa1BeqBzYCd5IH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14529218"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="14529218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7036697"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:59:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 15:59:26 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 6/7] platform/x86/amd/pmf: Add support to get sps default
 APTS index values
In-Reply-To: <20240227125520.3153140-7-Shyam-sundar.S-k@amd.com>
Message-ID: <17f6c260-42c7-a37b-65b3-cbdb85007557@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Shyam Sundar S K wrote:

> During the driver probe, the default cache values for the static slider
> would be obtained by evaluating the APTS method. Add support to use
> these values as the thermal settings to be updated on the system based
> on the changing platform-profiles.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> @@ -79,11 +80,56 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
>  	pr_debug("dc_battery_saver: %u\n", data->sps_idx.dc_battery_saver);
>  	pr_debug("Static Slider APTS state index data - END\n");
>  }
> +
> +static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
> +{
> +	int i;
> +
> +	pr_debug("Static Slider APTS index default values data - BEGIN");
> +
> +	for (i = 0; i < APTS_MAX_STATES; i++) {
> +		pr_debug("index[%d]: table_version = %u\n", i, info->val[i].table_version);
> +		pr_debug("index[%d]: fan_table_idx = %u\n", i, info->val[i].fan_table_idx);
> +		pr_debug("index[%d]: pmf_ppt = %u\n", i, info->val[i].pmf_ppt);
> +		pr_debug("index[%d]: ppt_pmf_apu_only = %u\n", i, info->val[i].ppt_pmf_apu_only);
> +		pr_debug("index[%d]: stt_min_limit = %u\n", i, info->val[i].stt_min_limit);
> +		pr_debug("index[%d]: stt_skin_temp_limit_apu = %u\n",
> +			 i, info->val[i].stt_skin_temp_limit_apu);
> +		pr_debug("index[%d]: stt_skin_temp_limit_hs2 = %u\n",
> +			 i, info->val[i].stt_skin_temp_limit_hs2);

Again, underscores seem mostly unnecessary. There's also inconsistency in 
capitalization and space/underscore usage compared with the existing 
printouts now that I looked also the existing pr_debug()s. Please try to 
make things mostly consistent.

> +	}
> +
> +	pr_debug("Static Slider APTS index default values data - END");
> +}
>  #else
>  static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
>  static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
> +static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info) {}
>  #endif
>  
> +static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
> +{
> +	struct amd_pmf_apts_granular_output output;
> +	int i;
> +
> +	memset(&apts_config_store, 0, sizeof(apts_config_store));
> +
> +	for (i = 0; i < APTS_MAX_STATES; i++) {
> +		apts_get_static_slider_granular_v2(pdev, &output, i);
> +		apts_config_store.val[i].table_version = output.val.table_version;
> +		apts_config_store.val[i].fan_table_idx = output.val.fan_table_idx;
> +		apts_config_store.val[i].pmf_ppt = output.val.pmf_ppt;
> +		apts_config_store.val[i].ppt_pmf_apu_only = output.val.ppt_pmf_apu_only;
> +		apts_config_store.val[i].stt_min_limit = output.val.stt_min_limit;
> +		apts_config_store.val[i].stt_skin_temp_limit_apu =
> +							output.val.stt_skin_temp_limit_apu;
> +		apts_config_store.val[i].stt_skin_temp_limit_hs2 =
> +							output.val.stt_skin_temp_limit_hs2;

Add a temporary variabled for apts_config_store.val[i] to make these 
shorter?


-- 
 i.

