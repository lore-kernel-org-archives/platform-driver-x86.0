Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1214CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 12:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiKGMtV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 07:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiKGMtU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 07:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A04018E3D
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 04:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667825306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qyNpTQ3bNlZrzUgnH5zTxhZYS/OypFRShTgaHqtgAPc=;
        b=FEhdEFnxXKjxFCDVOFaGdPQr/ryM/IXM34zMK84dA0QAexyX9G5egYXhP6Ma3zx4/KJlrZ
        hK2+anSTJ5eiOUkvmz9NPI55QquIvku9DL5/+GMeQNpKI7Forki7DjUfXpj4mhLedji/1q
        q/JGAIUwtxWIBTiNn1PR/XqicYXe68Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-pVx23JkcNhKXKfPwx62jSQ-1; Mon, 07 Nov 2022 07:48:25 -0500
X-MC-Unique: pVx23JkcNhKXKfPwx62jSQ-1
Received: by mail-ej1-f72.google.com with SMTP id qf25-20020a1709077f1900b0078c02a23da3so6267633ejc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 04:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qyNpTQ3bNlZrzUgnH5zTxhZYS/OypFRShTgaHqtgAPc=;
        b=WSy59u7+qf82IKw74pyc8knIu4BLelggTqIkLNtwJzbx4SCTuqC+ih6lqCHI6yM7S4
         JbNP0HsI6jm7GEcn4Sijg3NeUxl+x03uEu7XwwMMbK38tRgT4LG2H2Z7jW39HuGTYkRP
         2pk8zVzvLzCqAf3NitEaWJPL3jvupt9PT5O4Nc3OxZgpvfIJCpFSemMR/feU7loWxijc
         BJW/u2UH6S0FHz6rpRCfme+/YaCqnfr1L2xF4uthjUqBtp8kYQj7CWKmqFdPPKgHKpDj
         Yii5HyGJqhbA5Q0gYEd9QqHCK/sY3d4GOaEobwvpzK6w3qXk0pFKPQsY8EmezpYEI5bS
         /KEQ==
X-Gm-Message-State: ACrzQf2KEpYduiSQr1UR/j7/EoWrV2qSXWfq25tGgi9Jisrlf3psrBPI
        k56hThWnuH4RYyiO/FAUMfJ3ZYGOnNaXk9BYtGlfTy5vNnUqGcwKcii1AQ9Na3GwKCEvz66zT9L
        mJk2XbzXRGuiGNWSt03/QpDCb98Zfohhyxg==
X-Received: by 2002:a50:e616:0:b0:461:fc07:b630 with SMTP id y22-20020a50e616000000b00461fc07b630mr50132178edm.219.1667825304094;
        Mon, 07 Nov 2022 04:48:24 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6QWLox4LV6N7P5SMAHcQNIJdEfww5QxUfM4i3qzTQTLJtYDme+b+TLApyKEjVRi5p2mmZ5kA==
X-Received: by 2002:a50:e616:0:b0:461:fc07:b630 with SMTP id y22-20020a50e616000000b00461fc07b630mr50132161edm.219.1667825303868;
        Mon, 07 Nov 2022 04:48:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ue5-20020a170907c68500b007a559542fcfsm3398631ejc.70.2022.11.07.04.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:48:23 -0800 (PST)
Message-ID: <d2872c2a-46eb-528b-5e2f-d8b75c745b1b@redhat.com>
Date:   Mon, 7 Nov 2022 13:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [ibm-acpi-devel] [PATCH] platform/x86: thinkpad_acpi: Fix a
 max_brightness of thinklight
Content-Language: en-US
To:     =?UTF-8?Q?Micha=c5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>,
        ibm-acpi-devel@lists.sourceforge.net
Cc:     hmh@hmh.eng.br, platform-driver-x86@vger.kernel.org
References: <55400326-e64f-5444-94e5-22b8214d00b6@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <55400326-e64f-5444-94e5-22b8214d00b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Michał,

On 10/8/22 20:49, Michał Szczepaniak wrote:
> Thinklight has only two values, on/off so it's reasonable for max_brightness to be 0 and 1 as if you write anything between 0 and 255 it will be 255 anyway so there's no point for it to be 255.
> 
> Also sorry for repeated messages, I got no reply so I'm trying to figure out what I did wrong.

Your patch is missing a Signed-off-by line in the commit-message. I can only
accept patches with a Signed-off-by line in the commit-message like this:

Signed-off-by: Your Real Name <email@your.domain>

See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Also your patch is malformed (it has been reflowed by your email client)
and it does not apply properly.

Since this is only a trivial single line change I've just manually recreated
the patch myself, with me as author to avoid the S-o-b problem.

I have given you credit by adding:

Reported-by: Michał Szczepaniak <m.szczepaniak.000@gmail.com>

to the commit message of the patch.

Regards,

Hans



> 
> 
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 22d4e8633e30e9..775c2f327dc3a8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5562,6 +5562,7 @@ static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
>  static struct tpacpi_led_classdev tpacpi_led_thinklight = {
>      .led_classdev = {
>          .name        = "tpacpi::thinklight",
> +        .max_brightness    = 1,
>          .brightness_set_blocking = &light_sysfs_set,
>          .brightness_get    = &light_sysfs_get,
>      }
> 
> 
> 
> 

