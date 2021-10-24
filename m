Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC85FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 24 Oct 2021 08:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9604860D07
	for <platform-driver-x86@archiver.kernel.org>; Sun, 24 Oct 2021 08:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhJXIVg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 24 Oct 2021 04:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54014 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhJXIVf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Oct 2021 04:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635063554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TThxIOYGR5ELqT9OPOHrsFzCq6olSpunpDYH9OWv8t0=;
        b=Pwy21EJdQiaEIg2FEUtWLPd+1llwDJF4ZnZBwyTH+jIL2hisUT+H4fy42bunx8HbE4lDsp
        2yU3rhKLz6x3fDtFIeAnvbjnA+u0E7mtsm4LVQv679pLlwhq0nP32fbKUv/WTkwamNouBp
        b8fmc8kUK/PQphQNCeGDh43ZAvAPboo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-tBRWRvs2NIepCNxJw8stfg-1; Sun, 24 Oct 2021 04:19:13 -0400
X-MC-Unique: tBRWRvs2NIepCNxJw8stfg-1
Received: by mail-ed1-f69.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so7301046edx.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Oct 2021 01:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TThxIOYGR5ELqT9OPOHrsFzCq6olSpunpDYH9OWv8t0=;
        b=XGB7CiVPflbmQujAJBks8f0f4KEkR6AAbOMAbT7NsK9YMtJ3PJhDSyzUfOCBbYYifM
         2qL7l2t08nGrRwguEorGpGlXokbjjPPhRVsncAQVfpeczFetOspeinB5PCh52SgiAtsh
         X6HbBapjoHWCTVSQvoh2WnQd9Z0iQVbJV6DbRAASCHKq7eRN6ZUw6Rm3NPxab9+FVgpx
         SZNdv60Fz24PEgRsJcqBFUcOeQV9FM7V4wmgSxVQwJ8jg1xHStBw9f4DxKY47s3d6lCa
         fUSVpw7Jyc6kmCZjXt/JSmDztATRKrkERgZ8zvgGH5vaJ9ZNeTGCqJ8JPnHgb1m6A85H
         IBUA==
X-Gm-Message-State: AOAM5307W4xfYuQBv5N5zCAt7BG2e3f+0nBKGqX+gEYd0p6r8YCCNNYP
        NQ+LOI7swR7tZU8HcM8m65cjWWEVsJ5xE4oFM4Pp1h/ABurzYGMy1wb7wlQfq7FYn8FlhsAc1Vu
        pw0tQXZuo9bCPt2V6/95rvd4HC5aMZb+GEg==
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr16064426edc.53.1635063552088;
        Sun, 24 Oct 2021 01:19:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE4FdpmmIwy5N/BH1LEF0MdMC7FKfrS8K9F2vsRDmcQRfqTjgdojQKj/h3QOGnW/S4k7O4Tw==
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr16064393edc.53.1635063551779;
        Sun, 24 Oct 2021 01:19:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p26sm6888056edu.57.2021.10.24.01.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 01:19:11 -0700 (PDT)
Message-ID: <a72e4eda-c893-9de8-f0d4-59c15baf7e5e@redhat.com>
Date:   Sun, 24 Oct 2021 10:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: use KEY_VENDOR for button
 insted of KEY_RESTART
Content-Language: en-US
To:     Peter Korsgaard <peter@korsgaard.com>,
        platform-driver-x86@vger.kernel.org, santoshkumar.yadav@barco.com
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>
References: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
 <20211022124612.19780-1-peter@korsgaard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211022124612.19780-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/22/21 14:46, Peter Korsgaard wrote:
> From: Peter Korsgaard <peter.korsgaard@barco.com>
> 
> It turns out that systemd-logind by default listens for KEY_RESTART input
> events and reboots the machine, which isn't great - So use KEY_VENDOR for
> the vendor specific identify button instead to not conflict.
> 
> Signed-off-by: Peter Korsgaard <peter.korsgaard@barco.com>

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
>  drivers/platform/x86/barco-p50-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> index ca0b2564c407..f5c72e33f9ae 100644
> --- a/drivers/platform/x86/barco-p50-gpio.c
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -101,7 +101,7 @@ static struct gpio_led_platform_data leds_pdata = {
>  /* GPIO keyboard */
>  static struct gpio_keys_button buttons[] = {
>  	{
> -		.code = KEY_RESTART,
> +		.code = KEY_VENDOR,
>  		.gpio = P50_GPIO_LINE_BTN,
>  		.active_low = 1,
>  		.type = EV_KEY,
> 

