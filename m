Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838615921D
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870211; cv=none; b=nc0K42O5W9D909cKc7rHRodiNwHjki8IH5lHphuTpXSa8RoaTkxEdlt3JjYMlJgIS7WkFBOp6jSEss65K74nEdhNKfK5Gm5GGmBpNalj2WUekTtWEU6x1GE+KY3Rb0wDTj87ed401hQDq50nCmrCWySuCZZSF/Wq6DE4PupyiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870211; c=relaxed/simple;
	bh=8NCvRCPszDP770NVWQjH0bVN8l1lKGt9mQp6iLY0crY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFxF3aoPRpTvLvk6vjbCDadzM72xvy+pmM7+1AAfhUePYDXJi5+6fXGVgbJJq0Lf928fH096QV/L6ENGlwkCSb3JCoZ5W60mPzONoA+4R2MpowT8qtnkbbzkg9sbVuTdGXkDc994TWJU/+Ymn3bK6YYB2AKPUErycshtK5V6wao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cnu5xh1s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cnu5xh1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722870209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFIfN5jKOq5ZhTYRJtUZ4L4CMUsrG3a4wMcH/m481CA=;
	b=Cnu5xh1sQ/zPsYRbBkHN7fXD88LviM+kfvpBlC4sl6IOZauw8U7e4zqYzTorzkNdu6YP97
	1nO6vHOeUQBq3jZY8oF7hOmyzLI6Rf7d8pMosvjzzKUtyJhhRGF1/PHOe+qafZ4j0VWeuJ
	zufuRKIcmWhy1zFcnLTpDLDEltQwPBk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-FYGFIZAWOYGHzwZlqfUBng-1; Mon, 05 Aug 2024 11:03:25 -0400
X-MC-Unique: FYGFIZAWOYGHzwZlqfUBng-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5a7c6a0f440so6951767a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Aug 2024 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870204; x=1723475004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFIfN5jKOq5ZhTYRJtUZ4L4CMUsrG3a4wMcH/m481CA=;
        b=qNLIfU7J+FwjkHuv5z7a97N713eCfc5wN3bXy1XfyHY8NSCfgISiu0SsGZg6em3mc+
         HslvW4sE4CUV3JqYiSIzMXDFRrhLFKt/g+iL5leclqdcubZ6C7Vw7w1MwNg9PhLr7KIy
         8schpp3oEXil6NydoeMUVT0/yoYKRSl7ySRvtgWNGG6UdaBl4vTtbpa1WgrKZrqMmrjV
         s20FSg4iMuzJ3KmIOlMo+odVQO+4DcEh2w6SSCUlx22+dTfwC3dcoWrDPVp6ISaNuUMJ
         k88rtWfHosntL9HLdQGziCq11x8pUod8hv33TG1nq1Z4eDRXwwXZ3rfSQ4L5x8VbtsiH
         XYjA==
X-Forwarded-Encrypted: i=1; AJvYcCXO2xHm81TwWqHuQlUMgGLLIL4MW1TUQF2YjtY7rg5jZyJ5E/6k5m3zd1H8q0178wHvcdLQxYEjRpOzY1mYu7OXOusYntAZsP8wa+x0gMxZVOWV+A==
X-Gm-Message-State: AOJu0YxmltyrinpPceDsZO/Mn2E0930RmZ2SIH2xjipVqxAFK4oQXdpC
	Gx7ek6LEyNkOQF7DlyYF8H7gXuL56zftR3Ani0tIw+VorQVPdCk2ScTlexzERJmhFU1lgQgJ1Qc
	EMolGJwjEA+N1yt8f1xr6p2OOwf9p6EqVvQNOOFiNQ/hCnf9W0+KOyqrD0z7q6xWkZ0UBKIo=
X-Received: by 2002:a05:6402:1617:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b7f59e2356mr7216109a12.37.1722870203800;
        Mon, 05 Aug 2024 08:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY4KvQ0+BJEnLI9rO5TIRdEj8vWqOtH9qDmkKXjoU3ZGyyFKD/pz1M9a/Cdq0PuEf2NFAzXg==
X-Received: by 2002:a05:6402:1617:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b7f59e2356mr7216079a12.37.1722870203228;
        Mon, 05 Aug 2024 08:03:23 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3b99dsm4986110a12.91.2024.08.05.08.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:03:22 -0700 (PDT)
Message-ID: <0fc180ae-a5df-4199-a428-b108bff0415b@redhat.com>
Date: Mon, 5 Aug 2024 17:03:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] hid-asus: use hid for brightness control on
 keyboard
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org
References: <20240713074733.77334-1-luke@ljones.dev>
 <20240713074733.77334-2-luke@ljones.dev>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240713074733.77334-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/13/24 9:47 AM, Luke D. Jones wrote:
> On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> also has a HID packet used for setting the brightness. This is usually
> the same as the WMI method. But in some laptops the WMI method either
> is missing or doesn't work, so we should default to the HID control.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/hid/hid-asus.c                     |  7 +++++
>  drivers/platform/x86/asus-wmi.c            |  3 +-
>  include/linux/platform_data/x86/asus-wmi.h | 36 ++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 37e6d25593c2..af57a5f03193 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -492,12 +492,19 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>   */
>  static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>  {
> +	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  	u32 value;
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_ASUS_WMI))
>  		return false;
>  
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> +			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> +		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> +		return false;
> +	}
> +
>  	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>  				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
>  	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f9b6285c9a6..799d928c7d3d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL)) {
> +	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> +		pr_info("using asus-wmi for asus::kbd_backlight\n");
>  		asus->kbd_led_wk = led_val;
>  		asus->kbd_led.name = "asus::kbd_backlight";
>  		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 3eb5cd6773ad..74b32e1d6735 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/types.h>
> +#include <linux/dmi.h>
>  
>  /* WMI Methods */
>  #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
> @@ -160,4 +161,39 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  }
>  #endif
>  
> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> +static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> +		},
> +	},
> +	{ },
> +};
> +
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */

