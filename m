Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5E258CE5
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786891759; cv=none; b=gycYvsw9BqADp1pJ30adxgNP/UQKKymSvIU6UeTJsZp9rX1kc7fUh9QfCjr/K0uau/bI+H7fiB9G5MOvN5cVT4oVADk73gDFFPSfH0PfU5xu1YdJXPhh+IM7xfmAtUi49BbrFSUB60//6f9/9PxX9Gu9yzMX/vEf9TrripVggaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786891759; c=relaxed/simple;
	bh=PVT4apcdMWw9jj8b6n/n2XDVXaqUAm1xKAkCNyOPfUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJSZb91g0lr2XQDx8SaoQ8JY4urheKJpQyJPmWMt0LsCz6ITZ4qCrkJmqGzurT1VYZnMw4V3F7Fn5yaJSp/t8CmByaaV8KfVTCw99vVoh2oX5XMdMoBP+AD85FjgQEElYKlH0Grya9kdPnYZ8CQ5D3MolmYq5v/j5W+pyaeWcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xhjnC3Ls; arc=none smtp.client-ip=91.218.175.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xhjnC3Ls"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PVT4apcdMWw9jj8b6n/n2XDVXaqUAm1xKAkCNyOPfUI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786891754; v=1; x=1787496554;
 b=xhjnC3LsKdSyz64+xUWa0SaLxMp+SgzXk0UwPWNyMOcKcacVEuf8gWPN2eU0EFcD3kv4W7/N
 JMuG8acTTy+7GOgQxXIich5CsrFuT+CRNk9D/EPdqfvarTBhlxU8F+CnmbmWGQ15m8ytRubmmjx
 s0Utw7angthE/Dq6BeO+znP8=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from [10.80.0.99] (151.61.14.130)
	by smtp.migadu.com with ESMTPS id ac29b107bce22ad5;
	Sun, 16 Aug 2026 14:49:04 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <9cb5f4f9-223f-4162-8b9a-81486944be54@linux.dev>
Date: Sun, 16 Aug 2026 16:48:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for FX517ZR
To: AbdElRahman Soliman <abdelrahman7987@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729110941.26794-1-abdelrahman7987@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260729110941.26794-1-abdelrahman7987@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/29/26 13:09, AbdElRahman Soliman wrote:
> Add DMI match and power-limit table entry for the ASUS TUF Dash F15
> (2022), board FX517ZR, an Alder Lake + RTX 3070 laptop.
>
> AC and DC min/max values for ppt_pl1_spl, ppt_pl2_sppt,
> nv_dynamic_boost and nv_temp_target were read from the sliders in
> ASUS Armoury Crate's manual performance-tuning mode on Windows for
> this exact model, since ASUS does not publish these limits on the Web.
>
> Tested locally: values now report correctly via 'asusctl armoury
> list' instead of unavailable, and Dynamic Boost via nvidia-powerd
> measurably raises GPU power limit under load, consistent with the
> 80W base + 25W boost = 105W max TGP in ASUS's own spec sheet for
> this configuration.
>
> Assisted-by: Claude:claude-sonnet-5
Hi,

Thanks for this.

I would say remove the "Tested locally" paragraph: guidelines says
that commit messages are to be written in the second person as if
you were telling git what to do.

Also I personally never used a commit message so long and
a shorter one will be absolutely be fine too.

Next revision use the -v2 flag and don't forget to email me too.

If you need further help just tell me, thanks!
> Signed-off-by: AbdElRahman Soliman <abdelrahman7987@gmail.com>
> ---
>  drivers/platform/x86/asus-armoury.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index bc899bec7..46c308ba8 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -975,6 +975,32 @@ static const struct dmi_system_id power_limits[] = {
>  			.requires_fan_curve = true,
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "FX517ZR"),
> +		},
> +		.driver_data = &(struct power_data) {
> +			.ac_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 28,
> +				.ppt_pl1_spl_max = 85,
> +				.ppt_pl2_sppt_min = 28,
> +				.ppt_pl2_sppt_max = 135,
> +				.nv_dynamic_boost_min = 5,
> +				.nv_dynamic_boost_max = 25,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +			},
> +			.dc_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 25,
> +				.ppt_pl1_spl_max = 45,
> +				.ppt_pl2_sppt_min = 35,
> +				.ppt_pl2_sppt_max = 60,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +			},
> +			.requires_fan_curve = true,
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),
