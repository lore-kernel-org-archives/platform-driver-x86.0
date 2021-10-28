Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4454C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC44C610E7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhJ1Jhb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Oct 2021 05:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25148 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230088AbhJ1Jhb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Oct 2021 05:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635413704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IGr0evJpq0ehfSf5Z/rdSKDkY1U6PFL75WswHuxKJMY=;
        b=WCiG/5Oq2bZ6FtcRgAQ4fw/09K7p4JeSL4QvWTk/LRsb4TYHw9bkmBVNSC7xwv5ViOSqNw
        m8mv7glpXKPeqJKDJ+qT9Kf3oohZWk/aPFObZSFC72DrlnsjG9YkHTTOaCDTCSorW2rGrQ
        wgp3TBzW4VzbKxqwMuNQtIHrlEGULgw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-RHp5YhtaNfyS6B4w6mCRsg-1; Thu, 28 Oct 2021 05:35:02 -0400
X-MC-Unique: RHp5YhtaNfyS6B4w6mCRsg-1
Received: by mail-ed1-f72.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so5071767edx.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Oct 2021 02:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IGr0evJpq0ehfSf5Z/rdSKDkY1U6PFL75WswHuxKJMY=;
        b=Q8aaMMM0S4imR6+LcMda3arBZBEO/yjbyrjmZbqy9l0HpwWZ6z2ksaqjUGyFW4cxG4
         /2nvlWhzhgBI0pQb96nIrqsuVgJJ0U/VlsmnAHUjQ8zVznApZiMfRX7m/QhlcYYwYL+o
         m92WvfX952CZPO/82ZJa3kFx43eJ3mgNgVlAIDjZUc86Z+1+FMqUh1xgGRMJHlZZS12O
         NOMZdoHnykYPVggY7nbh1dC1MN3JVccG9Xl5A7igPkKre8oBpdVCrkvn4NPK9U6bQaTm
         tuTcp50xAodDodWKUtUtIV93u2fI7/WY6iDXmQaC3qjuTm1ikUuMARQYkShs4lem7ENV
         NH0w==
X-Gm-Message-State: AOAM5326g2inZF3v6MClcrxOMPWlC1s3KqCI6cXZiTjJQ3oXs4oFpcm/
        vcfjAgbqXEdvb5ngc8IG13mMCTMgJ2V7rfAI9blnF/HenN5Pr4QpNBpkAuZ5KVhdThA5J37y9Sm
        mojPE+YobY3OCseI0rfvMSpUy2CPj2w8CrA==
X-Received: by 2002:a17:906:4fc8:: with SMTP id i8mr3868523ejw.342.1635413701692;
        Thu, 28 Oct 2021 02:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoOKZ3qNBcwlMLgnZG7JpL8bh/RkFvn0OZnTYlgEXKNmaw3Bv3HQvhehzCBwh8H8U1o3dx5w==
X-Received: by 2002:a17:906:4fc8:: with SMTP id i8mr3868506ejw.342.1635413701541;
        Thu, 28 Oct 2021 02:35:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bn20sm1095335ejb.5.2021.10.28.02.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 02:35:01 -0700 (PDT)
Message-ID: <15aeb61a-8dae-deb4-8e7a-f31ce5531cf6@redhat.com>
Date:   Thu, 28 Oct 2021 11:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/surface: aggregator_registry: Add initial
 support for Surface Pro 8
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org
References: <20211028012845.1887219-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211028012845.1887219-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/28/21 03:28, Maximilian Luz wrote:
> Add preliminary support for the Surface Pro 8 to the Surface Aggregator
> registry. This includes battery/charger status and platform profile
> support.
> 
> In contrast to earlier Surface Pro generations, the keyboard cover is
> now also connected via the Surface Aggregator Module (whereas it was
> previously connected via USB or HID-over-I2C). To properly support the
> HID devices of that cover, however, more changes regarding hot-removal
> of Surface Aggregator client devices as well as a new device hub driver
> are required. We will address those things in a follow-up series, so do
> not add any HID device IDs just yet.
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
>  .../platform/surface/surface_aggregator_registry.c   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 2e0d3a808d47..ce2bd88feeaa 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -228,6 +228,15 @@ static const struct software_node *ssam_node_group_sp7[] = {
>  	NULL,
>  };
>  
> +static const struct software_node *ssam_node_group_sp8[] = {
> +	&ssam_node_root,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_pprof,
> +	/* TODO: Add support for keyboard cover. */
> +	NULL,
> +};
> +
>  
>  /* -- Device registry helper functions. ------------------------------------- */
>  
> @@ -520,6 +529,9 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
>  	/* Surface Pro 7+ */
>  	{ "MSHW0119", (unsigned long)ssam_node_group_sp7 },
>  
> +	/* Surface Pro 8 */
> +	{ "MSHW0263", (unsigned long)ssam_node_group_sp8 },
> +
>  	/* Surface Book 2 */
>  	{ "MSHW0107", (unsigned long)ssam_node_group_gen5 },
>  
> 

