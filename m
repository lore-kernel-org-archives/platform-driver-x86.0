Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D719D89E
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290812; cv=none; b=c3IwkgzPxRX+7NLFrxjAllk7QWgJwPYsuJx0iHb5POpaXQtU8/G8enAP3qso0UT36DnDyqaD8+ZSRBru30tZY0iB2OoNJKRWkyANXK2WOFtXpMxhwUurR3Nt14AWrhucPlGMHYjESpZqOp2gaVSEzO+AH74s/6W/mMYIhIQS3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290812; c=relaxed/simple;
	bh=ngftSvu1mIeoLudMiy+n/Zjl8ViUjSSUjDX/PxwwHuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/MveEbxh+FiQ0eVkOIVc1rig4HD8PyWxmOYS0sJuPiAYrkHZRu9qkdr7FYPMUNfSy6iVg1pD5WNM0ZHreLAxRnNWz8r31D41/ttnXDHQWSjCpj6LYSIBvWNXlTJUEJy7bg/QbQJWw36TGT/DzxIsxHBXLM/8xqGCt0Ob6matQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IILnFae0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IILnFae0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3AAC4CEF0;
	Fri, 19 Sep 2025 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758290811;
	bh=ngftSvu1mIeoLudMiy+n/Zjl8ViUjSSUjDX/PxwwHuA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IILnFae0TUaV5PjIUEXEKfZEzwie3ayuFCUAVHwZbBe1Sld+K51BAHbvoe3R6zD4z
	 ZLVt/A2s/huuGwr8bN+SnG8SnlISFHKE6TENRTZbUIhBZWuXI/iGIc+LQliW29z6Zq
	 cpiDR30gLTqY8vlDAPNE1EFGMqZoyNYRSqZZbKKm3OtYWFwEycx5qEXMOKWe58gsKm
	 O9c4P0YLpPpPAtZk9PW7SOevic29E9N7NmrOHlFCceK294ZJxBbJHfBQCpmTkndkTh
	 0MdAVKPzkubZFki+nFgW2+d6hW8yLf8iuS3kjHafXLwIk+lJa6LoSsMf1tpI4vRTGD
	 EmP3aMvNbfO8Q==
Message-ID: <59b6952f-32ec-45a5-9576-a046c0d9ed0e@kernel.org>
Date: Fri, 19 Sep 2025 09:06:49 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Rename ipu fields to npu in
 smu_pmf_metrics_v2 structure
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/2025 12:54 AM, Shyam Sundar S K wrote:
> Rename multiple fields in the struct smu_pmf_metrics_v2 from "ipu" to "npu"
> to align with updated hardware terminology and enhance code clarity.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip commit
> "8236b4667aca"
> 
>   drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index bd19f2a6bc78..6ea5380f3b23 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -243,12 +243,12 @@ struct smu_pmf_metrics_v2 {
>   	u16 vclk_freq;			/* MHz */
>   	u16 vcn_activity;		/* VCN busy % [0-100] */
>   	u16 vpeclk_freq;		/* MHz */
> -	u16 ipuclk_freq;		/* MHz */
> -	u16 ipu_busy[8];		/* NPU busy % [0-100] */
> +	u16 npuclk_freq;		/* MHz */
> +	u16 npu_busy[8];		/* NPU busy % [0-100] */
>   	u16 dram_reads;			/* MB/sec */
>   	u16 dram_writes;		/* MB/sec */
>   	u16 core_c0residency[16];	/* C0 residency % [0-100] */
> -	u16 ipu_power;			/* mW */
> +	u16 npu_power;			/* mW */
>   	u32 apu_power;			/* mW */
>   	u32 gfx_power;			/* mW */
>   	u32 dgpu_power;			/* mW */
> @@ -257,9 +257,9 @@ struct smu_pmf_metrics_v2 {
>   	u32 filter_alpha_value;		/* time constant [us] */
>   	u32 metrics_counter;
>   	u16 memclk_freq;		/* MHz */
> -	u16 mpipuclk_freq;		/* MHz */
> -	u16 ipu_reads;			/* MB/sec */
> -	u16 ipu_writes;			/* MB/sec */
> +	u16 mpnpuclk_freq;		/* MHz */
> +	u16 npu_reads;			/* MB/sec */
> +	u16 npu_writes;			/* MB/sec */
>   	u32 throttle_residency_prochot;
>   	u32 throttle_residency_spl;
>   	u32 throttle_residency_fppt;

