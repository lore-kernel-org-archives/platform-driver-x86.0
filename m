Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE9C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C15D6100C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhESN6d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231627AbhESN6d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621432633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GvEWuOcyoAacGUWYk7uQIvaCKJVp3PpQ0HETIDVeeaw=;
        b=g7UF35mQ7Fm8CRxbzaY1/O6LCbPCYyghZWJjv2L7qZ/XCloMTnWqINdWpuWtuk4jxv/Tyq
        9ADbsD8HESCRMy2Vna1+GN0SCpQ8IIUefzOz3rl1oSC4spuHTNWGDAk2poMM4t2ehga3lT
        U8gMieDyuVvnCz3kJPiVZoRJlL0DkDQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-HUatqg-8OoCks1TF5HmT-g-1; Wed, 19 May 2021 09:57:10 -0400
X-MC-Unique: HUatqg-8OoCks1TF5HmT-g-1
Received: by mail-ed1-f69.google.com with SMTP id c21-20020a0564021015b029038c3f08ce5aso7790002edu.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GvEWuOcyoAacGUWYk7uQIvaCKJVp3PpQ0HETIDVeeaw=;
        b=JtFLNFAB6eIA1F7+IPfMnsAP9cURlxv9pFIUpFlr5gW+GeI7Plcn3evAlyMQX4DXF2
         IHoX8mfEzD3bAorVxC3h1ywfsK0LYeMWMPAdihHnME1b26SZDCOKPOS5GMMyDq/M6g4V
         LN2+JarM6RfehDQNfzbE4PVHof/keJDYaHKLS15Zh7/BuOe8LuxzQstuQaLBET42/WFM
         JUhhsD91xzGy4m563QIP0/ur2axM9DWYPnlPuCGv6Pz2F6oDCTlxQernIod8x9F3/H2Z
         SlbSGEVvipQtr6xqvnyOm9R8xvSs67xmgpUycPH4TdJuvbiLB2IYP068xXquewJQYSAe
         BjMg==
X-Gm-Message-State: AOAM531Fofv7aRnYo9oemeanEFwbh4fRPeFS8iQA7okWLUFRBkiEraGf
        27R1Xe5ZjeF/ONoF8ueKzghmrL/W2gGyHtLfmoGJO4VCEI9xAdNCKDqeBxqF6ZY18Qp2Au5B1yM
        nblnxpp45FpA7ZntbQbhylcPS0JVPxIrAyw==
X-Received: by 2002:a17:906:68e:: with SMTP id u14mr12361978ejb.434.1621432629374;
        Wed, 19 May 2021 06:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVOkTdLHyLQK9YiARcCcyHK1daydpGjZamkoOZeuyHQ+kvMQcH2F10+Bh1OcNbu/gs4AQxtA==
X-Received: by 2002:a17:906:68e:: with SMTP id u14mr12361969ejb.434.1621432629242;
        Wed, 19 May 2021 06:57:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id zb2sm5023654ejb.52.2021.05.19.06.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:57:08 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: toshiba_haps: Fix missing newline in
 pr_debug call in toshiba_haps_notify
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Salvatore Bonaccorso <carnil@debian.org>
References: <20210519135618.139701-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b9e6ee42-83a9-8a8d-1f55-ba0f0d872008@redhat.com>
Date:   Wed, 19 May 2021 15:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519135618.139701-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/21 3:56 PM, Hans de Goede wrote:
> The pr_debug() call in toshiba_haps_notify() is missing a newline at the
> end of the string, add this.
> 
> BugLink: https://bugs.debian.org/799193
> Reported-by: Salvatore Bonaccorso <carnil@debian.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Since this is trivial I've added it to my review-hans branch right away.

Regards,

Hans


> ---
>  drivers/platform/x86/toshiba_haps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
> index b237bd6b1ee5..49e84095bb01 100644
> --- a/drivers/platform/x86/toshiba_haps.c
> +++ b/drivers/platform/x86/toshiba_haps.c
> @@ -131,7 +131,7 @@ static const struct attribute_group haps_attr_group = {
>   */
>  static void toshiba_haps_notify(struct acpi_device *device, u32 event)
>  {
> -	pr_debug("Received event: 0x%x", event);
> +	pr_debug("Received event: 0x%x\n", event);
>  
>  	acpi_bus_generate_netlink_event(device->pnp.device_class,
>  					dev_name(&device->dev),
> 

