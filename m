Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CA14C6C;
	Wed,  8 Apr 2026 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775689273; cv=none; b=YUC+bNC2v+OpK0Ir2ZoZdxR78K7X/IubqfHuPs9fF8CDdUMFdNm6W/lb94IsXbX6cDNmRXLKRiJ0ZfKH+1aIbA79w8sc7NT+4IJaKWEBQo5X0nJFLrfBjH16yBb1wbTqN6WpTic9yZxUmN5psV9i5xQNtaO7hqiZ01b2ym3E7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775689273; c=relaxed/simple;
	bh=6i1YwBOxQ4I6dyaKq+swvmAR4zcq5QKGFXRvjZwcUVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOLMplcyCY15whs8QZnhkx78XiYuWbn0Fje791ehhYeinrJf+AgLbGH/FUpD74bSZYKxxMVXq3RGMMz5JO0Zi3K9Ry4A+3SJEk++yc/fKyGlBD1L20iIoXfbO5u2fTaliamSR+CArYZtTDP9U6p6j60V1+WTiWkg1GovxxarCuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ltliLoPS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ltliLoPS"
Received: from [192.168.178.25] (i5C75F404.versanet.de [92.117.244.4])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 613972FC021B;
	Thu,  9 Apr 2026 01:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775689268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z+h5+XYzR9F+RXRAtXH78EvUcIBPIWkWJEhz9nAMVQ=;
	b=ltliLoPSPrgoOpBtcMDacbGJwsr5OGWs81Fo5gZ893DLCD5XHR96+iWI1FZ5MmnzHJ3m0v
	VaOaFC0JtB+4wen8Sbd5abjbWXKW+U2+Oy7KV8UnYXIszXITwxVhNyH1zrWZnD50pQEpuS
	M/2SF5OxrdC9D345B+PXhvqavg6Od3Q=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <976b4866-cf80-4846-bdf3-607dd3942447@tuxedocomputers.com>
Date: Thu, 9 Apr 2026 01:01:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86: uniwill-laptop: Accept charging
 threshold of 0
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-3-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260406193653.7799-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.04.26 um 21:36 schrieb Armin Wolf:
> The power supply sysfs ABI states that:
>
> 	Not all hardware is capable of setting this to an arbitrary
> 	percentage. Drivers will round written values to the nearest
> 	supported value. Reading back the value will show the actual
> 	threshold set by the driver.
>
> The driver currently violates this ABI by rejecting a charging
> threshold of 0. Fix this by clamping this value to 1.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 8f16c94221aa..5551f193c2c1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1424,11 +1424,11 @@ static int uniwill_set_property(struct power_supply *psy, const struct power_sup
>   
>   	switch (psp) {
>   	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> -		if (val->intval < 1 || val->intval > 100)
> +		if (val->intval < 0 || val->intval > 100)
>   			return -EINVAL;
>   
>   		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> -					  val->intval);
> +					  max(val->intval, 1));

looks good

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

>   	default:
>   		return -EINVAL;
>   	}
