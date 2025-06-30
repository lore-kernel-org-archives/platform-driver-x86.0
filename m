Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE538F40
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289502; cv=none; b=t0b0bd5vigqJMotf4JKMeraQR4jvidzNOMn9yYXaMcUjHwNgule11BDNowtiIasY44fMG7s3cm3jIJfmsowOqFxcf02yHZoGIKxDZmW/v02TJYuNiEqzrdrzS2qGxreCptH7ziC3iQ1c+awl6aMCRNbgS1vBXRdGdh8EJvp6/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289502; c=relaxed/simple;
	bh=CyyIE+8v+qoF0w/DJ2DstEJDIye9j6V4oi0sVRn6PTg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WQYFU3CLnExasiUDCuJaqQUqvAi6hrhG9QQtmLfQIIpw7cPI8K4e6pwpuMHsQjsokvE3N9/52zGrBk1utnX/uRuozzCWSPD2uffx2v9qRI/Lt12pOHyk0EVkfsRsLUnMGl0/uwtHm7cy+R65k4UHg5Lu1WExJd29jkn68Z3M+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwbRLAwp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwbRLAwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751289501; x=1782825501;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CyyIE+8v+qoF0w/DJ2DstEJDIye9j6V4oi0sVRn6PTg=;
  b=NwbRLAwplw4qWctt+Wr8lsYWzyHiwtLZdJJC52o6IJj8lqqzgb/AsUVg
   tq//bPs2We/riJ1C2uiL2nAcdndmmTZ7wjcDCrYjj2Zcl8IhAVPquiO51
   JIt01LzdhhUR5wLTs6NZyJ+tMrAk04UouAj/felnQilU6sBM4dx1Ueh8W
   +xiRpGLm2YcOhRPrylh/c8HEN1YGaq+wblyBgAPlblhHGiU1MeBLUr40G
   k+tXiAkD1dusRA99ye824d7M1HBJiIsiU9qThWV988g2QgKSbsFjAiGH7
   4Pd4cGGGXObZO1Qzptoc6FYZymG7LMi7BgqH3QJWWmr7bFIdwq1LLvRdk
   A==;
X-CSE-ConnectionGUID: VJrjLSLrTzqXt4ikx5Ga5w==
X-CSE-MsgGUID: ujCwRenYRFG7H3/flSsX6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64111425"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64111425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:18:19 -0700
X-CSE-ConnectionGUID: BYb0MFMcTiquwc4zfO1dPA==
X-CSE-MsgGUID: nN16YgYeTPWhu2VpRZAlaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157732237"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:18:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 16:18:14 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com, 
    Sanket Goswami <Sanket.Goswami@amd.com>
Subject: Re: [PATCH v2 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs
 for more policies
In-Reply-To: <20250617071413.3906284-4-Shyam-sundar.S-k@amd.com>
Message-ID: <4fd24ae7-e74a-ece9-eb31-b80702799219@linux.intel.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com> <20250617071413.3906284-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Shyam Sundar S K wrote:

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
>  drivers/platform/x86/amd/pmf/pmf.h | 12 +++++++++++-
>  drivers/platform/x86/amd/pmf/spc.c | 13 ++++++++++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 696b170255e0..10d658dd66cf 100644
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
> @@ -715,7 +723,9 @@ struct ta_pmf_condition_info {
>  	u32 workload_type;
>  	u32 display_type;
>  	u32 display_state;
> -	u32 rsvd5[150];
> +	u32 rsvd5_1[17];
> +	u32 bios_input[8];
> +	u32 rsvd5[125];
>  };
>  
>  struct ta_pmf_load_policy_table {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index e72c11aba31d..167b7455d6b0 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -92,6 +92,14 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  		laptop_placement_as_str(in->ev_info.device_state));
>  	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
>  	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
> +	dev_dbg(dev->dev, "Custom BIOS input3: %u\n", in->ev_info.bios_input[0]);
> +	dev_dbg(dev->dev, "Custom BIOS input4: %u\n", in->ev_info.bios_input[1]);
> +	dev_dbg(dev->dev, "Custom BIOS input5: %u\n", in->ev_info.bios_input[2]);
> +	dev_dbg(dev->dev, "Custom BIOS input6: %u\n", in->ev_info.bios_input[3]);
> +	dev_dbg(dev->dev, "Custom BIOS input7: %u\n", in->ev_info.bios_input[4]);
> +	dev_dbg(dev->dev, "Custom BIOS input8: %u\n", in->ev_info.bios_input[5]);
> +	dev_dbg(dev->dev, "Custom BIOS input9: %u\n", in->ev_info.bios_input[6]);
> +	dev_dbg(dev->dev, "Custom BIOS input10: %u\n", in->ev_info.bios_input[7]);

You know, this can use loop. :-D

If you do a similar getter that abstracts the discontinuity from the 
caller as I suggested for the setter side in the other patch, this too can
become a single loop.

>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -101,7 +109,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> -	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
> +	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2,
> +		&in->ev_info.bios_input[0], &in->ev_info.bios_input[1], &in->ev_info.bios_input[2],
> +		&in->ev_info.bios_input[3], &in->ev_info.bios_input[4], &in->ev_info.bios_input[5],
> +		&in->ev_info.bios_input[6], &in->ev_info.bios_input[7]};
>  	int i;
>  
>  	if (!pdev->req.pending_req)
> 

-- 
 i.

