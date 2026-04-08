Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B531619D;
	Wed,  8 Apr 2026 22:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775689161; cv=none; b=NWMT7yaMjAsl55pmdC219XNukwNVw2TpK8F9leZQW+P1mxiEl2Qaiz3YJudXNMN4tlYIhEhMoMhBhxBsyG523q1avt7Q7drY50bweFg4kYQDQrehBTPRhOqWh7A50Xafjxn80Le2RzkWULrpxliDXaL1P3jfYjAw3pPshrGFUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775689161; c=relaxed/simple;
	bh=YDEdFpvoq0ETluooa5b0Ex6WvRO5WFZZ2g4ERceg0VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1GhOrP96I0QHPa3FFnCKXMFNwbzmq7qcbpkeMTqWS/bePRQRYobi3Oo8j+qYEouw+8JFYl+2MnQrfxKIlI4KvSPwTU9+4OSe4GXnzRN5r1rD6BCJpOKQk/0tGrof8IwYhpQ6q5M8hADUhgNuKMP8DTt32U/qE7elm3LtWVH1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Q2RQ2VRm; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Q2RQ2VRm"
Received: from [192.168.178.25] (i5C75F404.versanet.de [92.117.244.4])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 17C3B2FC021B;
	Thu,  9 Apr 2026 00:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775689150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nehHcmaFlB3gWLWBOBRCE3hC56HFT2BlqMPRuZmfwZE=;
	b=Q2RQ2VRmcInU+qlbhd4Re3Fs1/yyQ9WLu1kqA2Z8M0prfVPaeCj6TvOG3DaqECzTgCRcV9
	8S6AR1G+3N/CM/QQtgS95uecjWWINx265naUk7kK2IbGwcDM9atnVo9vHDH0+um6/QY0LZ
	tKBhL3ANSmesLKYCyK6oTpPNypXFuuk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <d99162c3-a940-46a0-a0e8-3a777cabfcc8@tuxedocomputers.com>
Date: Thu, 9 Apr 2026 00:59:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-2-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260406193653.7799-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.04.26 um 21:36 schrieb Armin Wolf:
> The EC might initialize the charge threshold with 0 to signal that
> said threshold is uninitialized. Detect this and replace said value
> with 100 to signal the EC that we want to take control of battery
> charging. Also set the threshold to 100 if the EC-provided value
> is invalid.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index faade4cf08be..8f16c94221aa 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_supply *psy, const struct power_sup
>   		if (ret < 0)
>   			return ret;
>   
> -		val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
> +		regval = FIELD_GET(CHARGE_CTRL_MASK, regval);
> +		if (!regval)
personal preference: explicitly compair to the uninitialized-value "0" with == 
for better readability, but don't know if that is the normal coding style for 
the kernel
> +			val->intval = 100;
> +		else
> +			val->intval = min(regval, 100);
> +
We silently correct invalid values here. Wouldn't it be better to detect that 
something is off?
>   		return 0;
>   	default:
>   		return -EINVAL;
> @@ -1499,11 +1504,32 @@ static int uniwill_remove_battery(struct power_supply *battery, struct acpi_batt
>   
>   static int uniwill_battery_init(struct uniwill_data *data)
>   {
> +	unsigned int value, threshold;
>   	int ret;
>   
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>   		return 0;
>   
> +	ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The charge control threshold might be initialized with 0 by
> +	 * the EC to signal that said threshold is uninitialized. We thus
> +	 * need to replace this value with 100 to signal that we want to
> +	 * take control of battery charging. For the sake of completeness
> +	 * we also set the charging threshold to 100 if the EC-provided
> +	 * value is invalid.
> +	 */
> +	threshold = FIELD_GET(CHARGE_CTRL_MASK, value);
> +	if (threshold == 0 || threshold > 100) {
> +		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
> +		ret = regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	ret = devm_mutex_init(data->dev, &data->battery_lock);
>   	if (ret < 0)
>   		return ret;
