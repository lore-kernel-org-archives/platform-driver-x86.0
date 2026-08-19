Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2223672AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172907; cv=none; b=hiEZoLPcrp97qcCao5rQaDu9TFW4yQAH07/VPEBw/p26fbRm8Xw77/i07T7s4WSdLAyTQBc6TfjyajyYQcIJEouKGssny/zfkdDnyQYn36Ji6GAGOoTz7qZrL/qZQwGFykJnSvgccFY2Jr+6MltTGj11OyTX+mpTyNrRIQlkr6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172907; c=relaxed/simple;
	bh=c0mwkg79B3Ik3FfuRemJZ4k2exL0/eU+/3H+oGcOsvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXPLJbsAZg0KotUq8p7sDJB2mpmn+bwWyR6204lRL+8iEfK9znaWiuKLjOa3tFT/e5YuPNVSLHrdYwcD7Jj2OsCLmXgm0AK+aXs2dOCy5kMG5Ttiuw2fxDAj18cZqRGJLghuhht8KgBYbiX87sB6RjCh6bkSQMhVxrBPN8/3Czw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J1eJ4LOw; arc=none smtp.client-ip=95.215.58.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J1eJ4LOw"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c0mwkg79B3Ik3FfuRemJZ4k2exL0/eU+/3H+oGcOsvc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787172904; v=1; x=1787777704;
 b=J1eJ4LOwkQhn9SGgh8mrCcii1nPZW+gof9HKUvIUt3jvJd03F3NRaPZyUpTs4Sx5kAQ01adH
 ZdXzxEoX6hQqxwKk795r2XbTD8t/v+qrGJS65rge956/wFpgbucAAOXCnCD90G16qoz3K9AW3x3
 RDIsvP+nMgXabBgsHCWvdN1k=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from [10.80.0.99] (151.61.14.130)
	by smtp.migadu.com with ESMTPS id d3facaf19b03902e;
	Wed, 19 Aug 2026 20:55:01 +0000
X-Mizu-Trace-ID: d3facaf19b03902e
X-Migadu-Flow: FLOW_OUT
Message-ID: <19443596-887f-4f06-ba74-c75637d6913f@linux.dev>
Date: Wed, 19 Aug 2026 22:55:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: fix unclear usage of
 bd->props.power
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?B?TWFudWVsIEEuIFIuIGRlIE9yw7plIFLDrW9z?= <deor001@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Ponali <ponali2k@gmail.com>
References: <20260819205353.1651888-1-denis.benato@linux.dev>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260819205353.1651888-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/19/26 22:53, Denis Benato wrote:
> The bd->props.power is checked in parts of the driver correctly comparing with
> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
> and !bd->props.power, moreover in certain checks the logic has been
> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
> usage and the inconsistencies by using proper comparisons.
Can someone having the regression please try this out please?
> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
> Closes: https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
> Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8610663b8269..3600dddd8f36 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4500,7 +4500,8 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
>  	u32 ctrl_param = bd->props.brightness;
>  	int err = 0;
>  
> -	if (bd->props.power) {
> +	switch (bd->props.power) {
> +	case BACKLIGHT_POWER_ON:
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>  		if (err < 0)
>  			return err;
> @@ -4508,12 +4509,17 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>  		if (err < 0)
>  			return err;
> -	}
> +		break;
>  
> -	if (!bd->props.power) {
> +	case BACKLIGHT_POWER_OFF:
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>  		if (err < 0)
>  			return err;
> +		break;
> +
> +	default:
> +		pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
> +		return -EINVAL;
>  	}
>  
>  	return err;
