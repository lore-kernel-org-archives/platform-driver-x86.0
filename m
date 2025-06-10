Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC8B239E84
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571121; cv=none; b=OVaSqCmy26XJjZPU5e+czoN9I8dG+NLmlK4uah0poCsqQCrM71IdbJskOToeTMS46SdiS8HTH04BVGS77De7OGzyTbv2YcNeOLGo+WzlxK84VsyhkJswe8NDs6+xrYgAWgOqsJt/E33OEmHAAU7b3MhAoJYGVI1y7PSi7cbgiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571121; c=relaxed/simple;
	bh=NN/o4SP3vbtT1wAggTutLHE8DwyJ6AV5TaOMen1W4Mk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XUE1S1RPHeVop3CHTgUQfdcnjeDj4D58jffLkc5kiyBgaAjkygicn0k6JprcWWPvz1+kH9XNvkQS6p61BMZcA2DZoUvfyqqfkY29NrWQDIOX/ESwTUQ8zCdaTG2RTysFNosgaE/7HeIg4PLiyAPvlhxjuWXDj8hTkDhNwiMzU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyZP2Azh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyZP2Azh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749571120; x=1781107120;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NN/o4SP3vbtT1wAggTutLHE8DwyJ6AV5TaOMen1W4Mk=;
  b=GyZP2AzhATNUR7/i5e0tetvVXb89pc1miaUEf9NUZVAkXNq8f1uNajL6
   6pNRpRmin5L4fpARSt1rcxJ8w7rAzWJ4dtDLEFEYC+N7nBDeNgOTJ7um8
   R5V5bY9BS3Kz8yCtbBEi/Bu31Myy0rHXNOo7VlNQfpv4PGmL5CbPCbQel
   cNGx9kKV+Hmd+JwJQd9a0RAcxPumRi4HTLC2YH3bkPuPsXXfLvBakdlny
   zGrSvs+cIG3dTM69pvkxtbf6gQKjruA23QCm+Wqh8AJu25Qt+njX7eqxU
   2hE2LCwsfzusyFy+wMFr6M1uvWM/AzdjWHX7GrtX2PpqMTVSwcaVyWYg7
   g==;
X-CSE-ConnectionGUID: VbtsrXJfR0uz9d9pb/7IFw==
X-CSE-MsgGUID: vauVJVNZRdqgHdZIgWAcUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="74226989"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="74226989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:58:39 -0700
X-CSE-ConnectionGUID: vkmTlFOaRcmjsLXtKQDqbA==
X-CSE-MsgGUID: a7XDepJwQF6W7ArMl+7zkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="150726163"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:58:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 18:58:33 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com, 
    Sanket Goswami <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 03/10] platform/x86/amd/pmf: Extend custom BIOS inputs
 for more policies
In-Reply-To: <20250509072654.713629-4-Shyam-sundar.S-k@amd.com>
Message-ID: <a2c8762f-6d40-8dd1-f562-8f1de7a5210d@linux.intel.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com> <20250509072654.713629-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Shyam Sundar S K wrote:

> The existing amd_pmf driver is limited to supporting just two custom BIOS
> inputs. However, with the updates to the latest PMF TA, there's a
> requirement to broaden this capacity to handle 10 inputs, aligning with
> the TA firmware's capabilities.
> 
> The necessary logic should be implemented to facilitate this expansion of
> functionality.
> 
> Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 19 ++++++++++++++++++-
>  drivers/platform/x86/amd/pmf/spc.c | 13 ++++++++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index eceed2348165..17b46085726e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -631,6 +631,14 @@ struct amd_pmf_pb_bitmap {
>  static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
>  	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
>  	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
>  };
>  
>  enum platform_type {
> @@ -715,7 +723,16 @@ struct ta_pmf_condition_info {
>  	u32 workload_type;
>  	u32 display_type;
>  	u32 display_state;
> -	u32 rsvd5[150];
> +	u32 rsvd5_1[17];
> +	u32 bios_input3;
> +	u32 bios_input4;
> +	u32 bios_input5;
> +	u32 bios_input6;
> +	u32 bios_input7;
> +	u32 bios_input8;
> +	u32 bios_input9;
> +	u32 bios_input10;

These really ought to be an array so the copy-paste madness can be 
reduced in the code.

> +	u32 rsvd5[125];
>  };
>  
>  struct ta_pmf_load_policy_table {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index e72c11aba31d..dfb8036671a0 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -92,6 +92,14 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  		laptop_placement_as_str(in->ev_info.device_state));
>  	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
>  	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
> +	dev_dbg(dev->dev, "Custom BIOS input3: %u\n", in->ev_info.bios_input3);
> +	dev_dbg(dev->dev, "Custom BIOS input4: %u\n", in->ev_info.bios_input4);
> +	dev_dbg(dev->dev, "Custom BIOS input5: %u\n", in->ev_info.bios_input5);
> +	dev_dbg(dev->dev, "Custom BIOS input6: %u\n", in->ev_info.bios_input6);
> +	dev_dbg(dev->dev, "Custom BIOS input7: %u\n", in->ev_info.bios_input7);
> +	dev_dbg(dev->dev, "Custom BIOS input8: %u\n", in->ev_info.bios_input8);
> +	dev_dbg(dev->dev, "Custom BIOS input9: %u\n", in->ev_info.bios_input9);
> +	dev_dbg(dev->dev, "Custom BIOS input10: %u\n", in->ev_info.bios_input10);
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -101,7 +109,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> -	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
> +	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2,
> +		&in->ev_info.bios_input3, &in->ev_info.bios_input4, &in->ev_info.bios_input5,
> +		&in->ev_info.bios_input6, &in->ev_info.bios_input7, &in->ev_info.bios_input8,
> +		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
>  	int i;
>  
>  	if (!pdev->req.pending_req)
> 

-- 
 i.

