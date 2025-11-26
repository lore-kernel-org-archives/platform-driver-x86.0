Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883772D979C
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149769; cv=none; b=R1GZubsHObHRKd6tzEN2MGr7um2HXDUKkTGoqq1uj60PRBqUGP+QcrRN9ieb4nIylumHk4Od6DLaMdUIKzYrc0/16IXk+dWrDj3XfXJfK3JPMWU2BK3B/993xF4yZFoDtPOKAaFx971VLRvD5t1ikntjaNdIohHUnzqRNUz/lqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149769; c=relaxed/simple;
	bh=urfMf677KyoJePGmFtbCs3nnfx6FWuYRxKUz/WCWwGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3uM5g7FdD7IDIOvLIa/SbVWuIO1Xa4R1Fn71b3S+S4Ibw9YA0ZUNV2bVOtUIvi9GwDxX+3gvAxiaIv3Y23VzDpV8getjuiGnaGlM47Ftm14JW+wCT0QQdKD7MKjulSdha93BbfWXewm9XFe1I5sMTlbLM5QEl7ozzDh5dtBvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daeuWg2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daeuWg2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032E6C113D0;
	Wed, 26 Nov 2025 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149766;
	bh=urfMf677KyoJePGmFtbCs3nnfx6FWuYRxKUz/WCWwGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=daeuWg2Vx2hOAnBJWbsV0Zk1mrIQb8jsyZ/7zItzWF+/lSXekQiE+AMGCrXsRHNTP
	 9GrsrsdCXgWpZCqFrSWCo6HbAxO1hFNiwQ46YdnhyaodFpfe87sH4qPqm0DxOykhwm
	 NDqQs0svZ/QE8ZdTRrIQ8+d9JRzmYp9ovkpble0jUh58kFcs29zhCS8sLdCSNgKjys
	 yVJ9a5+JNWoguj6fp2Z8VSXj7Q5dqo5DVKeMwXglqHNZjwF1vZAkipWNM4hQWMQs6x
	 7Z/2cM+qvQcWZxLfpo6UlwgC4MfbZz5CERfokjxyWchTbWIijZ2HsTsgNpW+fdHKL0
	 lXavXM27EHO0g==
Message-ID: <07435916-caed-41db-aaa6-7c94d44f0284@kernel.org>
Date: Wed, 26 Nov 2025 10:36:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Refactor repetitive BIOS output
 handling
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20251126093146.3775572-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126093146.3775572-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 26-Nov-25 10:31 AM, Shyam Sundar S K wrote:
> Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
> with a helper function and consolidated case handling. This reduces code
> duplication and improves maintainability.
> 
> The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
> PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
> with identical logic. This patch introduces
> pmf_policy_to_bios_output_index() to map policy values to array indices,
> consolidating the handling into a single case block with fallthrough.
> 
> This approach handles non-sequential policy enum values gracefully and
> makes future additions easier to implement.
> 
> No functional changes.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> This can be applied on ilpo-next branch.
> 
>  drivers/platform/x86/amd/pmf/tee-if.c | 64 +++++++++++++++------------
>  1 file changed, 36 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 2c74ba2a0b51..a379556032fe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -73,6 +73,34 @@ static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>  	input_sync(dev->pmf_idev);
>  }
>  
> +static int amd_pmf_policy_to_bios_output_index(u32 action_idx)
> +{
> +	switch (action_idx) {
> +	case PMF_POLICY_BIOS_OUTPUT_1:
> +		return 0;
> +	case PMF_POLICY_BIOS_OUTPUT_2:
> +		return 1;
> +	case PMF_POLICY_BIOS_OUTPUT_3:
> +		return 2;
> +	case PMF_POLICY_BIOS_OUTPUT_4:
> +		return 3;
> +	case PMF_POLICY_BIOS_OUTPUT_5:
> +		return 4;
> +	case PMF_POLICY_BIOS_OUTPUT_6:
> +		return 5;
> +	case PMF_POLICY_BIOS_OUTPUT_7:
> +		return 6;
> +	case PMF_POLICY_BIOS_OUTPUT_8:
> +		return 7;
> +	case PMF_POLICY_BIOS_OUTPUT_9:
> +		return 8;
> +	case PMF_POLICY_BIOS_OUTPUT_10:
> +		return 9;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>  {
>  	u32 val;
> @@ -183,45 +211,25 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_1:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_2:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_3:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_4:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_5:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_6:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_7:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_8:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_9:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_10:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
> +		{
> +			u32 bios_idx = amd_pmf_policy_to_bios_output_index(out->actions_list[idx]
> +					.action_index);
> +			if (bios_idx >= 0) {
> +				amd_pmf_smartpc_apply_bios_output(dev, val,
> +								  BIT(bios_idx), bios_idx);
> +			}

Since you know you are in case PMF_POLICY_BIOS_OUTPUT_1 .. PMF_POLICY_BIOS_OUTPUT_10 here
amd_pmf_policy_to_bios_output_index() will always return a valid index, so IMHO you
can drop the "if (bios_idx >= 0)" check here.

Otherwise this is a nice cleanup, thank you for cleaning this up.

Regards,

Hans

