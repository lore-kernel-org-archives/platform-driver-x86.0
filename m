Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7B3B961B;
	Wed, 21 Jan 2026 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020471; cv=none; b=UfjCNY2FhQyhBlSKyE5NyEye/ACmjA+Bqr+bL3P3z+VCzcLjKjOnuxmKFV9eIWD/L98LAsOua4ueDCkmFoMUzUhtcUYk/lcZ3Q7Rg9Wz0/06FoOOmRnOzRtOWOyKAnAAvE+po/EsZiDAZ8p5U9556LXSCrfAIdHDS2bZMRSdJn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020471; c=relaxed/simple;
	bh=zU0xVrnkRkESZBXHuITPL+Um62T0kE45O1eEUsi96do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROQk50WSoR1fzVAH0nNPcmbtTUQirFToBQX2zPuBRoyyhWl4ZGjZlPIumUSdsQzmSvVMqb8KLlCsNXDHxNvYn5mnekGVKprrFI2bl4vKvu4V7AvFmtcZv40qqf3VFdY3XNhqoz3kZS9w5YC9UALLppor0zWFVdxuWdCE5s7ADcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL5fm+A5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL5fm+A5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E9C4CEF1;
	Wed, 21 Jan 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769020470;
	bh=zU0xVrnkRkESZBXHuITPL+Um62T0kE45O1eEUsi96do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cL5fm+A5BZlPR9SBdKxRZQRtfcVUrjmBmGiZSqmn4LlETVXvpca5snWUlRYsJXPcT
	 Bb9KoyjslPCx2jANxSWKVMJu9SIWsssDImOvC2OxK9BItK6wxM+eM/DmHnzXhzgU8o
	 rxkhcLYj5a7W/O5aWbadQm+BYTd23giDMmrwM/cmQkht6JUAvZlvjNTb09N+Gptg7g
	 HkjERoTAEiEUZjBBXfiKvU0NIHYYCjLVSU5cxlVUz7qi5UrlaIrstGSE4pnpecGDsY
	 XjH7nxrEHfdChHWbLtIdKt2GdArkVwmana+GBtyFQLDsKy21mf4mHSEaChujlJCNSM
	 wGqULuQrUugSQ==
Message-ID: <8d83da95-07e7-4e4e-b508-fa194c31490f@kernel.org>
Date: Wed, 21 Jan 2026 12:34:29 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Added a module parameter to
 disable the Smart PC function
To: Alexey Zagorodnikov <xglooom@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20260121143519.12318-1-xglooom@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260121143519.12318-1-xglooom@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 8:35 AM, Alexey Zagorodnikov wrote:
> Addresses a low power limits issue on HP ZBook Ultra G1a [1]
> 

No need to have the [1] in the subject IMV.

> If vendor firmware capped APU power limits with 3rd-party AC adapters,
> the user can disable the Smart PC function via the module parameter
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4868 [1]
> Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>
> ---

LGTM though otherwise.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>   drivers/platform/x86/amd/pmf/core.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8fc293c9c5380..ee7b3adc63a02 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -53,6 +53,10 @@ static bool force_load;
>   module_param(force_load, bool, 0444);
>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>   
> +static bool smart_pc_support = true;
> +module_param(smart_pc_support, bool, 0444);
> +MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
> +
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -362,11 +366,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>   		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>   	}
>   
> -	amd_pmf_init_smart_pc(dev);
> -	if (dev->smart_pc_enabled) {
> -		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> -		/* If Smart PC is enabled, no need to check for other features */
> -		return;
> +	if (smart_pc_support) {
> +		amd_pmf_init_smart_pc(dev);
> +		if (dev->smart_pc_enabled) {
> +			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> +			/* If Smart PC is enabled, no need to check for other features */
> +			return;
> +		}
> +	} else {
> +		dev->smart_pc_enabled = false;
>   	}
>   
>   	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {

