Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249F4ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 09:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiISJSs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiISJS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 05:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D3424BF1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663579103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/4XBcZ7h2UUM1XkHffVpSpFztwkIYrVe5G+MINi2gLw=;
        b=b/wquXzxFVMTi8nQ4TBwWkORayNrLT+28PmKbjSsbirPuLmGUN5uvMNrzCQVI+5uVvqB99
        wISJYBvHgKEsIE7Y8EMB3uR/o4cy8ZU9oHLQmjyolgowFsVk6B+x99K0/GH2cMnI3oNK+b
        k06DTBnw6zgFdN3rozjcZMQBa8fHw2I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-gYa6dDAiNZSZmaceSKSjnw-1; Mon, 19 Sep 2022 05:18:21 -0400
X-MC-Unique: gYa6dDAiNZSZmaceSKSjnw-1
Received: by mail-ej1-f71.google.com with SMTP id ne4-20020a1709077b8400b0078114a1a6d8so635591ejc.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/4XBcZ7h2UUM1XkHffVpSpFztwkIYrVe5G+MINi2gLw=;
        b=UUdsttbCYLLfzXmy2bYAqVXUuwthaOaRn5pM4ZEZX0Y83iOd94Rxi2RY5F4Qlal+Vn
         1UikJSUllPFzSvGWDskgMmkIw7YXPq8poas1XSW6VMSc0O4swSnPiCzYPRqv3PkjAkWd
         KAG8H8gy9Qj+AdXKe/uFtd7gnk443ZywrhCURaMYzwi5o3Hvw243GKTRikXdrIhW2904
         h5nULePadiYh0lGZjEgNMzyhSnXihYffL6WzKWy8Bfi/+3Svbyzs0V+4vQR2CrRS8+zx
         WAxmk2CFVXxtQO0TvwUbkA4jHpjAMtCW/9JIGNTaSS/uaVfKlqsmZiKCtuISS5i4QUDX
         YAlg==
X-Gm-Message-State: ACrzQf37/F+5RwbJtYaDoaIBMnumiOqmAzXJbVWgvBQ7d++DAq/TCWjK
        VRUE5CvgrE8F63yl7s5rnkY8DJV1ebFVag9zReaK9m7jjUI6Hh/aMgh7l6F15Ne3u0L/dBdEeaK
        pjE2ZcTewVtZSrC9QZkDc9D100wKRc0AZ/w==
X-Received: by 2002:a17:907:8a1a:b0:780:ee1:b71e with SMTP id sc26-20020a1709078a1a00b007800ee1b71emr12662392ejc.474.1663579100304;
        Mon, 19 Sep 2022 02:18:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JlIjT8VIryJO48NwxeWh4ji66pC+r1hb56Z3t8Ss8/1FSLM03xDpmZ3CxM+obqAwNnqW6Sg==
X-Received: by 2002:a17:907:8a1a:b0:780:ee1:b71e with SMTP id sc26-20020a1709078a1a00b007800ee1b71emr12662382ejc.474.1663579100054;
        Mon, 19 Sep 2022 02:18:20 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id w12-20020a50d78c000000b0044ebe6f364csm20115340edi.45.2022.09.19.02.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:18:19 -0700 (PDT)
Message-ID: <b0e690d4-8d1f-d8f6-bc45-29c84880ef08@redhat.com>
Date:   Mon, 19 Sep 2022 10:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Set correct parent for input
 device.
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>
References: <20220911193106.555938-1-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220911193106.555938-1-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/22 20:31, Arvid Norlander wrote:
> This solves the input device showing up as a virtual device.
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>

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
>  drivers/platform/x86/toshiba_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 3227a5f57633..9f1394b73895 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2883,6 +2883,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>  	dev->hotkey_dev->name = "Toshiba input device";
>  	dev->hotkey_dev->phys = "toshiba_acpi/input0";
>  	dev->hotkey_dev->id.bustype = BUS_HOST;
> +	dev->hotkey_dev->dev.parent = &dev->acpi_dev->dev;
>  
>  	if (dev->hotkey_event_type == HCI_SYSTEM_TYPE1 ||
>  	    !dev->kbd_function_keys_supported)

