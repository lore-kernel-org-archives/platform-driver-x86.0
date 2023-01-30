Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3750BC54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 15:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbjA3PGd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjA3PGc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 10:06:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096281A96B
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675091147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yUM0dPONsUdhNpTsUP0aFbzs6vKtU/sYkU05mhf9k4M=;
        b=d6uFDixRNd0a7u1foj0K0Fxr9XmJE9KevuJTP5cxlegkrdWsx4ruCtfDxTnYbhRVHAg0qB
        TDMx48dWty53amubcthdbTKlSDnv4+PV3zATdbj3q/46bXYqFXETi1tstQGkcaBbmACyf1
        1wbEED8DJ+WWeL71M4YekPgxu0NAtpc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-RO3l2ZYgMyKkVnL8T-nhDw-1; Mon, 30 Jan 2023 10:05:45 -0500
X-MC-Unique: RO3l2ZYgMyKkVnL8T-nhDw-1
Received: by mail-ed1-f72.google.com with SMTP id j10-20020a05640211ca00b0049e385d5830so8484765edw.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUM0dPONsUdhNpTsUP0aFbzs6vKtU/sYkU05mhf9k4M=;
        b=jMiPg62DbEf2wOnWerzNcApqGVkAy8ZXcGWlKwDuQEzsyjTf7LpsTsyNXa92K06Sfe
         raoU8jnp4XZlvM1OZSQ8yJ8Lt9+lbityziCjOoOOSXeF5+BUOPJvkAX8xFonBGbQwAcN
         53Uspap9ZrB4KIkwfQWotiI9aHr4fUYlQ8gpzbalsD3nNj4izk1U6sm8krF84vZRDcLz
         ex4nUjqu9JVSdUURNbCuyaXNjUjKU2po/qHxChltLRDCgsVdAln7Ty0GAblCb0xL5H0J
         yEQKPljWf0vBfHWBaL46bd0LaSCCZW9au8cXYDzONhWe9Tna/c540IvE1lUze1HY/Pqe
         ZOeg==
X-Gm-Message-State: AFqh2kov5ThAKVgPwgkGmIrPJ7ob1rbF2sMea4ZG0ivXbJi5GrHCDJSz
        ZM6JrPAujyUC20E0k58EZ3EaC9kVwdoiGrccxotYtO6WiBLkhS2iOHrSf+CN8QhhnvOirZxgSvg
        5hVMXyF581xyyNZaCT9Ef4S5l3PWrli0V1Q==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id ef11-20020a05640228cb00b0049edb431722mr38656370edb.18.1675091143708;
        Mon, 30 Jan 2023 07:05:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQOsjZdhW/i+bNK1dRKHsjjmyb26SL93PMVoyqdZSzL8SNaRBxQ88jkzC8E8k04Wif130wzw==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id ef11-20020a05640228cb00b0049edb431722mr38656350edb.18.1675091143523;
        Mon, 30 Jan 2023 07:05:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ec2-20020a0564020d4200b004a21d03155bsm4346533edb.88.2023.01.30.07.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:05:42 -0800 (PST)
Message-ID: <c7f18127-6be2-87b4-d462-af312cc68032@redhat.com>
Date:   Mon, 30 Jan 2023 16:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] platform/x86: dell-ddv: Add support for interface
 version 3
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126194021.381092-1-W_Armin@gmx.de>
 <20230126194021.381092-2-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230126194021.381092-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/23 20:40, Armin Wolf wrote:
> While trying to solve a bugreport on bugzilla, i learned that
> some devices (for example the Dell XPS 17 9710) provide a more
> recent DDV WMI interface (version 3).
> Since the new interface version just adds an additional method,
> no code changes are necessary apart from whitelisting the version.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 2bb449845d14..9cb6ae42dbdc 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -26,7 +26,8 @@
> 
>  #define DRIVER_NAME	"dell-wmi-ddv"
> 
> -#define DELL_DDV_SUPPORTED_INTERFACE 2
> +#define DELL_DDV_SUPPORTED_VERSION_MIN	2
> +#define DELL_DDV_SUPPORTED_VERSION_MAX	3
>  #define DELL_DDV_GUID	"8A42EA14-4F2A-FD45-6422-0087F7A7E608"
> 
>  #define DELL_EPPID_LENGTH	20
> @@ -49,6 +50,7 @@ enum dell_ddv_method {
>  	DELL_DDV_BATTERY_RAW_ANALYTICS_START	= 0x0E,
>  	DELL_DDV_BATTERY_RAW_ANALYTICS		= 0x0F,
>  	DELL_DDV_BATTERY_DESIGN_VOLTAGE		= 0x10,
> +	DELL_DDV_BATTERY_RAW_ANALYTICS_A_BLOCK	= 0x11, /* version 3 */
> 
>  	DELL_DDV_INTERFACE_VERSION		= 0x12,
> 
> @@ -340,7 +342,7 @@ static int dell_wmi_ddv_probe(struct wmi_device *wdev, const void *context)
>  		return ret;
> 
>  	dev_dbg(&wdev->dev, "WMI interface version: %d\n", version);
> -	if (version != DELL_DDV_SUPPORTED_INTERFACE)
> +	if (version < DELL_DDV_SUPPORTED_VERSION_MIN || version > DELL_DDV_SUPPORTED_VERSION_MAX)
>  		return -ENODEV;
> 
>  	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> --
> 2.30.2
> 

