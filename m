Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA3AECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Sep 2022 12:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIJMSX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 10 Sep 2022 08:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJMSW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Sep 2022 08:18:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A67564F1
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662812300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/FRsG/dVUcBq+AAvCuweXj5HBJV8wUmwtqqS0ZZG34=;
        b=Z9SNdh5pBf8wW4NdmkyqIDpywaixO0NXfJwsOgPPwUvIICiJAhkvF6zhqIpYxz+ApnZQbt
        Re3UTtxa2S851dyxqFHymiGMUUfpd7Tg6X7Eg3lmlt5yVi+PXArr6M7992eldFxZNjsSAF
        0oTgAl6XuNM9GomMD9eU2MNInKTyZuE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-996-2Dy1P6KzsZwpJi1NYg-1; Sat, 10 Sep 2022 08:18:09 -0400
X-MC-Unique: 996-2Dy1P6KzsZwpJi1NYg-1
Received: by mail-ed1-f71.google.com with SMTP id e15-20020a056402190f00b0044f41e776a0so2979983edz.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=i/FRsG/dVUcBq+AAvCuweXj5HBJV8wUmwtqqS0ZZG34=;
        b=tuXYJy+qvPCjWl/kMXMeHbdj9xi2Arcou6I28w6A53P05x7psBVy3WzO09+5F4hjV1
         6t5LRnUECVIDZtphjaJ26sATZMeUdeg7+ZlrE4OFqfEhC4Wfolwyq9ulXc4vg9joRoO6
         U0UxSvR8UScyFrJFkUUvK1+XGiRVBH3CymJE7K+PklN1e91GRVW4qMhHOxoVMGj9rYL2
         BpnbW3a65ltrZQUTKIdSDOXJJBOxVDlw1nHRsXr2EUuqNQcxu/hgB9GXDoK07hZYoMAH
         AiaYainXS4YFyLVu1dbqg+Yg38IYN9rjvGXKXf6vK5ieVyObSeLvdlCwK5VFSmh99HdA
         gocA==
X-Gm-Message-State: ACgBeo0sOrYIKqB+ZsTYUPeMt4YA2zBwmhUOwpFf93j70vOQu18959AB
        fdj8cUdmHI0FSQ061vkgb/Udu9G8r1PXW0GR/CniPqFySlax0upRd3h/iRXdFEpCxj6tK7ctD5f
        GpVHa+9GWvnGKALEOtIQ5BJfr2LKoWVX3JA==
X-Received: by 2002:a17:907:7625:b0:779:e6f7:a669 with SMTP id jy5-20020a170907762500b00779e6f7a669mr4987103ejc.472.1662812288492;
        Sat, 10 Sep 2022 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Bk2s8xyq2yOpGzT95zQqoFlBekTedY+iINGUaiPKyiDZH5kXo6Xhm77IOMGQQGS9VBgzAeA==
X-Received: by 2002:a17:907:7625:b0:779:e6f7:a669 with SMTP id jy5-20020a170907762500b00779e6f7a669mr4987099ejc.472.1662812288320;
        Sat, 10 Sep 2022 05:18:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906310900b00779cde476e4sm1665800ejx.62.2022.09.10.05.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 05:18:07 -0700 (PDT)
Message-ID: <25825749-1c7b-eb81-cfce-2d4c589c10c1@redhat.com>
Date:   Sat, 10 Sep 2022 14:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] leds: simatic-ipc-leds-gpio: Make
 simatic_ipc_led_gpio_table static
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>,
        Henning Schild <henning.schild@siemens.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220910085836.84962-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220910085836.84962-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 9/10/22 10:58, Hans de Goede wrote:
> simatic_ipc_led_gpio_table is only used inside simatic-ipc-leds-gpio.c,
> make it static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note since this is a fix to a patch which I merged through the pdx86
> tree I plan to merge this today through the pdx86 tree as well.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/leds/simple/simatic-ipc-leds-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.c b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> index 0d73dcbeec2d..b9eeb8702df0 100644
> --- a/drivers/leds/simple/simatic-ipc-leds-gpio.c
> +++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> @@ -15,7 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/x86/simatic-ipc-base.h>
>  
> -struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
> +static struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
>  
>  static struct gpiod_lookup_table simatic_ipc_led_gpio_table_127e = {
>  	.dev_id = "leds-gpio",

