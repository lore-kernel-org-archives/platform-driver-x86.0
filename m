Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1155F60D07
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhJUSfq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41390 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231502AbhJUSfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Oct 2021 14:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634841209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fJv7bUttzHzeUKPod/KfL06tCpY98UdeXt9wFfAbFRI=;
        b=AiIJgey66ZKFTeC7rA+VnkYkEEYYKecIpPKS5L2h5JHyvkC2wxtmh46j9nGyDkWjDX7v58
        TRqbtU7N2Klcchz6CjamZz9sp8q8RUWhPK9hzFvepLO8gJOIS6oNF5X83JKl1iGYgcLfJn
        t1O1ELd4eIlxQLOvcXriHLe9H1ZAuc0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-JGMy13JJNqO-0jwHxdeCTA-1; Thu, 21 Oct 2021 14:33:28 -0400
X-MC-Unique: JGMy13JJNqO-0jwHxdeCTA-1
Received: by mail-ed1-f70.google.com with SMTP id u10-20020a50d94a000000b003dc51565894so1215561edj.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 11:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fJv7bUttzHzeUKPod/KfL06tCpY98UdeXt9wFfAbFRI=;
        b=F4hagSlr9gFmDMoQs/lcRovMv/FM+g4AytkK49lwpvrIjPSD0C/pJ6xCtD82x+NUgE
         m8ttcuL7TczJB12g5xZ/j5LhNRpzs47aGj4E2lpXwam70S5/+Kv9NHsBaXm+wBwgF3mt
         etSNJiBJj5mnMM4AWXlSq6hacuQdBx8jkOwPM/JriGV2Hl1a6Lj+RuAGMo7I770xjzH0
         m2jpsr7311RNlNl7nfZNvp6KVe86R0oaAcRUtXZZjHqBesNVOIzfceGk3dAWa+FxCnDK
         9PyyhW3Oh3VKqqY968UBasq4QaIpjXdt5VAu0sSUvCsZ5bZaOjQQuYOl8bQBj4AH1lNS
         FzZQ==
X-Gm-Message-State: AOAM533Gb+88KbclgN3wm0kMrNUQkSAUJtyUVQT48T9NQCkAg+EpmxeF
        Smkt/NJsWp8dsRqUAE19WLfuB44hGi4S7F2TyeQIv/762jFVzGeqCKAv91vPU6gSs7hjpeEfiTf
        O4/1h0pCxoO50I9p6TlxGw/JrG9iEJi4r7Q==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr10029318edi.284.1634841207331;
        Thu, 21 Oct 2021 11:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpP27IAl5diPSXUSRyhAfup3C5V1r5HFXZJeAuZaSNfUHqMNSsodhp5yV84qCICK121UKCwQ==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr10029296edi.284.1634841207182;
        Thu, 21 Oct 2021 11:33:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n6sm3137103eds.10.2021.10.21.11.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:33:26 -0700 (PDT)
Message-ID: <db6b4b82-01e6-d211-e8e9-5e3db6943bd7@redhat.com>
Date:   Thu, 21 Oct 2021 20:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/surface: gpe: Add support for Surface Laptop
 Studio
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211021111053.564133-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211021111053.564133-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/21/21 13:10, Maximilian Luz wrote:
> The new Surface Laptop Studio uses GPEs for lid events as well. Add an
> entry for that so that the lid can be used to wake the device.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/surface_gpe.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
> index 86f6991b1215..c1775db29efb 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -26,6 +26,11 @@ static const struct property_entry lid_device_props_l17[] = {
>  	{},
>  };
>  
> +static const struct property_entry lid_device_props_l4B[] = {
> +	PROPERTY_ENTRY_U32("gpe", 0x4B),
> +	{},
> +};
> +
>  static const struct property_entry lid_device_props_l4D[] = {
>  	PROPERTY_ENTRY_U32("gpe", 0x4D),
>  	{},
> @@ -158,6 +163,14 @@ static const struct dmi_system_id dmi_lid_device_table[] = {
>  		},
>  		.driver_data = (void *)lid_device_props_l4D,
>  	},
> +	{
> +		.ident = "Surface Laptop Studio",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Laptop Studio"),
> +		},
> +		.driver_data = (void *)lid_device_props_l4B,
> +	},
>  	{ }
>  };
>  
> 

