Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EBDCD37B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 15:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjIRPub (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 11:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjIRPua (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 11:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B939CCF7
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695051849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wGtArAeMB9GZxmO9vKCrGvuHZSz8eHSUPOKIKq8XF6o=;
        b=cSNZBznXV78B5UF2EyJk6EpSMg/nKGgXnb8kCQ2I4T561qjqT+ZjhJjlZrRFC3LO7grRxj
        soGqVSNdTYyoTukPsonzV9lKrO6E2y3H6lemvXLBHCORsQKvHrFx9p/rR845HEQ1a8EKvz
        apPv4o1C4r1l76F9R9tEXJ283kHVAcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-u2VcLsPRNGCHcD-_9u4mmQ-1; Mon, 18 Sep 2023 09:43:22 -0400
X-MC-Unique: u2VcLsPRNGCHcD-_9u4mmQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-320004980a2so1347740f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 06:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695044601; x=1695649401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGtArAeMB9GZxmO9vKCrGvuHZSz8eHSUPOKIKq8XF6o=;
        b=lUbsNa1Iarq97c06TTKRBrDC0VQ81r4RYb/U9GFNSXE61519+7yBXTLKEq7CelslkU
         YzcQKvWB9OGdtem4PqBsZDe2KNAVrmkiDhzF5BJLt6wuZb6FTmge8cQcpqDj1IQU/erm
         8j5wIuHacYVtYZVYxXDg8Gpte/LgE8Wi5+qjtu6VFl6/C9uZOFnX4cM8dipbClJdanxf
         q/h+vibtWf0Hl00Yv+R98ahc2frPdnhKlgc5iAp+/tzX2FW6wxWXAEzyhhfTekJrECgd
         xrTDkNxaH53P+Vgk4MOyHRhQsKYaH0Z6eyk4RnPmsafw53+brWxcmEYW4r3PfNdGEL3C
         M0Zw==
X-Gm-Message-State: AOJu0YweeUkMgi7SL+s2YgUJALC/wDp4st/8X3RDV5qz0Tfq1TLctO4F
        HURA3ULAGeGxRuSY/pgbmXIcvL0OiiTN0e+7BNO87+1iNGWiSYsecylnNw4emL4XdNjp8PVJ9e2
        72DFWHPPnp1UBTBLCYOk2E03mjd+uYeXsvg==
X-Received: by 2002:a5d:48c9:0:b0:313:ecd3:7167 with SMTP id p9-20020a5d48c9000000b00313ecd37167mr6698956wrs.42.1695044601456;
        Mon, 18 Sep 2023 06:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqg/YVoNOSd4z0HHkqO+SjQMAgGAGS6J7hZ/VOzR7wy7Z954+VZuQHKBJ9vaaEl52BhE9r3Q==
X-Received: by 2002:a5d:48c9:0:b0:313:ecd3:7167 with SMTP id p9-20020a5d48c9000000b00313ecd37167mr6698943wrs.42.1695044601155;
        Mon, 18 Sep 2023 06:43:21 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906134700b009a0955a7ad0sm6457579ejb.128.2023.09.18.06.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:43:20 -0700 (PDT)
Message-ID: <9645f22e-e580-974f-c03d-6549c6beb8f6@redhat.com>
Date:   Mon, 18 Sep 2023 15:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix Lenovo Yoga Tablet
 2 830F/L vs 1050F/L detection
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230915214933.62595-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230915214933.62595-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/15/23 23:49, Hans de Goede wrote:
> gpio_crystalcove pin 10 is already in input mode and passing GPIOD_IN
> when requesting the GPIO changes its pull-up/-down settings causing
> the 830F/L to get misdetected as 1050F/L.
> 
> Switch to using GPIOD_ASIS when requesting the GPIO to fix
> the misdetection.
> 
> Fixes: 4014ae236b1d ("platform/x86: x86-android-tablets: Stop using gpiolib private APIs")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 904290526173..585f10a57810 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -454,7 +454,7 @@ static int __init lenovo_yoga_tab2_830_1050_init_touchscreen(void)
>  
>  	/* Use PMIC GPIO 10 bootstrap pin to differentiate 830 vs 1050 */
>  	ret = x86_android_tablet_get_gpiod("gpio_crystalcove", 10, "yoga_bootstrap",
> -					   false, GPIOD_IN, &gpiod);
> +					   false, GPIOD_ASIS, &gpiod);
>  	if (ret)
>  		return ret;
>  

