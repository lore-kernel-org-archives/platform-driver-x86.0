Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359C3B47C9
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910654; cv=none; b=YC8oE9cZQt4ae7WLAnB6KCEN1AQLUjhkoZfHicCIry80hZTKjWG3VR5+OVVNOQrFenISgun23cZilnT5XfaDOH25rZNWAc+uVIn2mSbZkVXqPeBXOYINQEpINGpEoaSNU4DN6hGDZ7Crm4OZQgL+ndZ4Db0dpwJ0grj6ZlB8xhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910654; c=relaxed/simple;
	bh=x/uC1VBdzJgwKtz5ZhwokGfgELBUtr+rvaQWJTqwyCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNDFQTZJS1pJxPC1Rkj8mL/5avt7Ad1AYxaBGHMsr9WcY1KbBVAGVrUIMAad+xSZCr3xE90QVYaS3HY/n8NzRH2edc/u06Tqrwc7DHDyNLV8eUIZdPnWGH1MBftD7sCoY0xDvcIUu5ZG8a5v2POjhLvTQa43T9/hNDvtS28qQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GB5JcgwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GB5JcgwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70EE1F00893;
	Mon,  8 Jun 2026 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910652;
	bh=mwtTiAAk6W65uYsOiCD0cyabw1gJhL0aM7kZYmfBEf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GB5JcgwLbnbS9bDv5nU6SO7L5E/DDwg/QrLjyvYk7qpeXDcYEXE3mHpD576WbabwV
	 I/bz+DGzkbzjBgpvKcYZgYsQAVL49xNBvwH/gtVZBpnnOKfcWnnrXhIeD2APy4NTB7
	 d6S117mkS4qqCYlhqhdfZLcitZwUetStuonb4SQFr4yDwGOWN62FIaOlj5DQyq4GgQ
	 kUx+m2FTQz6VRxAOeg3ryI0YTi5Di033NyPTSUmBPnzMevXSyrGR+NPq5ImTQifsOx
	 sAWpmjim8EWW+IQl1NBvqB1mi7szjj3E8FEyN37mQw7nVOfVUb5ecbGB+LNm8l3OAD
	 uj4OFfZ3OyPhw==
Message-ID: <90038882-254f-4507-ae85-867fafe295d2@kernel.org>
Date: Mon, 8 Jun 2026 11:24:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] platform/x86/amd/pmf: Add feature discovery
 support to util interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-4-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260527140205.4073335-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
> Add feature discovery capability to the util layer interface, allowing
> userspace tools to query which PMF features are supported and enabled
> on the current platform.
> 
> The following features can now be queried through the
> /dev/amdpmf_interface ioctl:
> *  Auto Mode: Automatic power profile switching based on system activity
> *  Static Power Slider: User-selectable power profiles
> *  Policy Builder (Smart PC): Action based policy management
> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  include/uapi/linux/amd-pmf.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index d29a4abe1145..9de054cfeee7 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -14,6 +14,7 @@
>  #ifndef _UAPI_LINUX_AMD_PMF_H
>  #define _UAPI_LINUX_AMD_PMF_H
>  
> +#include <linux/bits.h>
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  
> @@ -34,9 +35,19 @@
>  
>  #define AMD_PMF_BIOS_PARAMS_MAX		10
>  
> +/* AMD PMF feature flags - bitmask indicating supported features */
> +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
> +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
> +
>  struct amd_pmf_info {
>  	__u64 size;
>  
> +	/* Feature info */
> +	__u32 features_supported;
> +
>  	/* Power and state info */
>  	__u32 platform_type;
>  	__u32 power_source;

You are now changing the userspace ABI between patch 1 and
this patch. Please just squash this patch into patch 1.

Regards,

Hans


