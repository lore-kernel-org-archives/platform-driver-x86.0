Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2689285049
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289373; cv=none; b=FHrfoJySnm82MCRefWzaHCnAkFl4DSpAuT6QwExuxGMcpy8LlmPsnFv1LgfdI82gOphsdUFP7SD5CRwtR8uC4M4BCHkhjOcqor+W9+gdDIlf1wazV9lh6GPJuhPHs7yn5hEoLr4y1lnWLOpwfy6ViiTTyeOnxI2gHlzW5bAz5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289373; c=relaxed/simple;
	bh=ufg7guWjHtrn2vpc/arI01gDJsQJdA5UjRPcqZLhieY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MLlJ5enxMoVcZPCYF1AszOnYcT+C7qBVzGkT+4SPo0XJCL7uNfJgTAqDEhvQ4QvJMv/chVSEmVT48CjD1RWdQ35wjTsEyae0XUQCAAq8JtsntfARB7pXYpBwRUWe87TMbyu254smzareQgy7JV9d8lTyavgujd6tvLCaqVoiUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/aYsV03; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/aYsV03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751289371; x=1782825371;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ufg7guWjHtrn2vpc/arI01gDJsQJdA5UjRPcqZLhieY=;
  b=V/aYsV03YNqwG0wWXHSox5nDryp3j6RpX7sN7nNGTc54R/zwufjizpW1
   +BE7qHOC+CzU+UK0kZUnVc2WdXaNIFWu7qJ7JPgKFSZBOsd+VRQMqWuo8
   7/JY7/6KNTqZwRCN5RMHk1socFXJ48pDcALOxvjDS9OrwnrxsyFpTYO2P
   P/FZWJlDvb3+8TP4kZN8r5/7sPNIoHPeQzfxODqMx44io0RCpdF5bmlQg
   MP7k/yJlGW8/QLYutKtNmO+yeBcTcoMB1/8ltx/DNf+qxSpbePPOqx/kw
   UwunHFxoNB2edqO/1bCazY0XIt8/M1kMmo7H9IvWcMUaEgyrUJFQHOtRD
   g==;
X-CSE-ConnectionGUID: fgCJYqTFTUiQacJYA9hjtQ==
X-CSE-MsgGUID: q2PGqTwJQOGZWvszxkuqQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53453025"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53453025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:16:10 -0700
X-CSE-ConnectionGUID: 9xdjim2hT9ipuA9eqTlx7w==
X-CSE-MsgGUID: 80+omfzFTmqi7Po4Y01+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152845538"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:16:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 16:16:04 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com, 
    Sanket Goswami <Sanket.Goswami@amd.com>
Subject: Re: [PATCH v2 2/9] platform/x86/amd/pmf: Fix the custom bios input
 handling mechanism
In-Reply-To: <20250617071413.3906284-3-Shyam-sundar.S-k@amd.com>
Message-ID: <e165a766-ff44-f29a-5b10-4f88b07b7cd6@linux.intel.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com> <20250617071413.3906284-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Shyam Sundar S K wrote:

> Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
> under the assumption that the BIOS would only send a single pending
> request for the driver to process. However, following OEM enablement, it
> became clear that multiple pending requests for custom BIOS inputs might
> be sent at the same time, a scenario that the current code logic does not
> support when it comes to handling multiple custom BIOS inputs.
> 
> To address this, the code logic needs to be improved to not only manage
> multiple simultaneous custom BIOS inputs but also to ensure it is scalable
> for future additional inputs.
> 
> Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
>  drivers/platform/x86/amd/pmf/spc.c | 15 ++++++---------
>  2 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 1a5a8d70c360..696b170255e0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -623,14 +623,14 @@ enum ta_slider {
>  	TA_MAX,
>  };
>  
> -enum apmf_smartpc_custom_bios_inputs {
> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
> +struct amd_pmf_pb_bitmap {
> +	const char *name;
> +	u32 bit_mask;
>  };
>  
> -enum apmf_preq_smartpc {
> -	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
> -	NOTIFY_CUSTOM_BIOS_INPUT2,
> +static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
>  };
>  
>  enum platform_type {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 1d90f9382024..e72c11aba31d 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -101,18 +101,15 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> +	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
> +	int i;
> +
>  	if (!pdev->req.pending_req)
>  		return;
>  
> -	switch (pdev->req.pending_req) {
> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
> -		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
> -		break;
> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
> -		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
> -		break;
> -	default:
> -		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> +		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
> +			*bios_inputs[i] = pdev->req.custom_policy[i];

Hi,

After seeing this version, I think there's better way to solve the 
discontinous layout problem.

Could you instead add a helper amd_pmf_set_ta_bios_input() or something 
along those lines. With that, you don't need to add that local array at 
all. I'd also convert bios_input1/2 to array so both are arrays (I 
understand you cannot change the layout and merge the arrays). The 
helper can then pick which of the arrays it should set to based on the 
index.

And briefly mention in the helper's function comment, that we need to do 
this because the layout does not have continuous area for bios inputs.

That seems simpler approach than this local array approach.

-- 
 i.

