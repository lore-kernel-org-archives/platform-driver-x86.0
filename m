Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22871C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 12:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0420360EBC
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 12:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343540AbhHFMEw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 08:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243577AbhHFMEw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 08:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628251476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yXt4znrWYqFIZMvMoOAVUBIqLa2im4npYTn46U6yfJI=;
        b=iN+abO3PfEHIkAw+LqJoPB3oKzyc8pv4+mKEsUme4nTuMqNnfjKPDSPZLF64u10oStTlW7
        QD0Xruej8a0zl1NexqMzWqSi2pOH47U/zmQU21FqHILJIm7+DfSD2gaqYTwHQGYoEdAN9H
        beCgSBDcIQmW+DRa83/5MFiPmj1j464=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-GJu-TIaGP9GMQyhTBWHUnw-1; Fri, 06 Aug 2021 08:04:35 -0400
X-MC-Unique: GJu-TIaGP9GMQyhTBWHUnw-1
Received: by mail-ed1-f72.google.com with SMTP id g3-20020a0564024243b02903be33db5ae6so642097edb.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Aug 2021 05:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yXt4znrWYqFIZMvMoOAVUBIqLa2im4npYTn46U6yfJI=;
        b=D8v8lkguyNpJxmO+Xmt5jlXP7YMw2ucCPF+OLK8YZ2yMflz36UCUHJm7gVrd824FxN
         SAyJ6Ii3cUPsmWIxBM82hmRFdzNd/JZLtxwAr0dQlwUezwD7OCS6ZG52EgN3/ve1c0q4
         W/iui+64CFWNCuGBF9TtVVRt/c5uYxfwQ/i/PtslsNoB6AeKE979gWYY92zxk31QPFOV
         XlKxv8jvcvTBT6cfnltuvli6ekBIJkcvTURCiZbgpuDjzsomusBhvCQ+8znvNHTiv4NX
         vepobMqPYRRfP/WXU0MS7lU+kA2GmGsrx5lCcPpBJFe449fIK+0crXR9z5OejXzxIud5
         /UIg==
X-Gm-Message-State: AOAM530+5EsBeIX4D76egaFvht9frEeop4s4bjXqA/QLejsvnPb+pJrf
        spgME6xVZ3bRXV1n+1ni8sU0IDYAuNVQkbBNgmK1WJQlx3RefgG5Hx+QLBZ1Uw06ZsDIb/3OEPD
        L7XNM3HB7P13b+Io/8+U7hXNg/bwQjMVKUysBWtysjBCscdg3pdZBdL4KZRB15B+oGZvio4NZ8D
        fuWOcoYzc5Ig==
X-Received: by 2002:a05:6402:2789:: with SMTP id b9mr12371294ede.44.1628251474107;
        Fri, 06 Aug 2021 05:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQS073mlUd1kmlMLhC9nzHXdCCoVk6f/6BkiT/qLg9JGPlXUq6j3V0YFPP3m2JqP+OZ8c3+w==
X-Received: by 2002:a05:6402:2789:: with SMTP id b9mr12371270ede.44.1628251473963;
        Fri, 06 Aug 2021 05:04:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q11sm2832448ejb.10.2021.08.06.05.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 05:04:33 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: Add missing terminating
 entries to gpio-lookup tables
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210806115515.12184-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <51266462-e693-dd19-1790-7248813ca99d@redhat.com>
Date:   Fri, 6 Aug 2021 14:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806115515.12184-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/6/21 1:55 PM, Hans de Goede wrote:
> The gpiod_lookup_table.table passed to gpiod_add_lookup_table() must
> be terminated with an empty entry, add this.
> 
> Note we have likely been getting away with this not being present because
> the GPIO lookup code first matches on the dev_id, causing most lookups to
> skip checking the table and the lookups which do check the table will
> find a matching entry before reaching the end. With that said, terminating
> these tables properly still is obviously the correct thing to do.
> 
> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans and the pdx86/fixes branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/pcengines-apuv2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index c37349f97bb8..d063d91db9bc 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -94,6 +94,7 @@ static struct gpiod_lookup_table gpios_led_table = {
>  				NULL, 1, GPIO_ACTIVE_LOW),
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED3,
>  				NULL, 2, GPIO_ACTIVE_LOW),
> +		{} /* Terminating entry */
>  	}
>  };
>  
> @@ -123,6 +124,7 @@ static struct gpiod_lookup_table gpios_key_table = {
>  	.table = {
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
>  				NULL, 0, GPIO_ACTIVE_LOW),
> +		{} /* Terminating entry */
>  	}
>  };
>  
> 

