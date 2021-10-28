Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA97C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 07:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5669610FD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 07:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhJ1IBI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Oct 2021 04:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26780 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229626AbhJ1IBI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Oct 2021 04:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635407920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ssfsrlUnUncXSG3OdwN60TRyrIXMk8wx4UyML93w3Ak=;
        b=OBhd/FSwGXXpU0VYHyYR75159p8igeIpFnKAKo3BChcvgFUZZGktULqp+A8RXqNqJhd74f
        nEgrNSnj7JRRvZ4tSTaC83qs0M7XHPgM6IWtvES4XD7tJU1SPi6lUnTbmsFVsBOn+oaQZx
        0qXymvnKxnR5fPmx98o6TgzWdhGROEE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-YKZ3fLwMMuylmIZ4-8FIvw-1; Thu, 28 Oct 2021 03:58:39 -0400
X-MC-Unique: YKZ3fLwMMuylmIZ4-8FIvw-1
Received: by mail-ed1-f71.google.com with SMTP id y3-20020a056402358300b003dd490c775cso4737620edc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Oct 2021 00:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ssfsrlUnUncXSG3OdwN60TRyrIXMk8wx4UyML93w3Ak=;
        b=uwxjFT/xTwgo8OU2V/Uwg1rSE3YvMEoGlL5RU321YZ49UqhCeF6BjTj2C+vKV+ZUv0
         PYGeqG6ukSrb48OioWPCn1Tfrvqp3fEpDIdX3eK7rxtMvPARzjFslguF4cdLlHY6aHnu
         tHD5xePnQr98fwMRXK0wgvBg7yMOgnFn3KrHXKWx0xOzyLSwp1l6SEUDuM8G7iON96PN
         edVd5I38XQzhkKn1Ol8mx2SAHhbB+o95x+A378QiTbZsZsXAbMvBzFJN/U5pV7Z2kU7c
         CwzOAqQ0eHwX2dojULaDA1q5Rmg/gM0+NAC6tgkWOCJ73SKnMBDP3EKI76sgMhyDTkEh
         F5AQ==
X-Gm-Message-State: AOAM532RyGA/acxrUKGsIVsmk9kBVX9iq1rMHW9om4l70ktGeNfC7yQ7
        DUnEgvv6TI5BfdQ9paTy9h40+RfWOuygFy7HYmfXkD8K4bhJT7IRL7Mh5S8gV/ZcG+nHCR4KTiL
        ewA6xr7wbG9nFZBTj8mhC9ZNPXGhsGb0KEA==
X-Received: by 2002:aa7:cb59:: with SMTP id w25mr4013810edt.309.1635407918068;
        Thu, 28 Oct 2021 00:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3FCD5EBCZHOsd4tzrmApbRmN4CGccT0ac7DTwb/YZp1flrRDuAeATtlZDfxeJkjyyC59Zfw==
X-Received: by 2002:aa7:cb59:: with SMTP id w25mr4013793edt.309.1635407917911;
        Thu, 28 Oct 2021 00:58:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s12sm1200055edj.82.2021.10.28.00.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 00:58:37 -0700 (PDT)
Message-ID: <f7ac5427-b03a-2d3a-3255-e37ba9b15dcd@redhat.com>
Date:   Thu, 28 Oct 2021 09:58:36 +0200
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

Hi Maximilian,

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

Since it is just device-id additions I can still pick this up for
5.16 if you want / if this is useful.

Do you want me to pick this up for 5.16 ? 

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

