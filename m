Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5421CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 07:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiKPHpK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 02:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbiKPHpJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 02:45:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D904A65FA
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 23:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668584655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=px67Q9G9Ko7skpsPW+A59m2Q23W6Z7m+9mGvjMTfUZc=;
        b=guFTIhWz1MERVUrPQtBdrbypZ+Hcs4jxHokx4GgWW8V4lner4aFHCaUdmyAbQY3G+g0djT
        dAcB1uaID3lKddB2UWMn9nDk8Y0jfLprr4bcxgXZJeY1zUWvIC1KOvpK1V0I+NwAUqUUR3
        AiFZeYBJE0y0l1NpiQmiKuZdXyPCV3E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-CR01bgCFOYKRaeSz4zqoUA-1; Wed, 16 Nov 2022 02:44:13 -0500
X-MC-Unique: CR01bgCFOYKRaeSz4zqoUA-1
Received: by mail-ed1-f71.google.com with SMTP id c9-20020a05640227c900b00463de74bc15so11753511ede.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 23:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px67Q9G9Ko7skpsPW+A59m2Q23W6Z7m+9mGvjMTfUZc=;
        b=MTLOyLf8zAt++0DaZnpLPNXHa8cAy3uLAfUfR+hezF1d8k/n+R4wf6Y9gddbeBFRVR
         X25sEAs5LVk4n4cRxK4T75q4t0uiIX6coozHf3EWB1gUL/ABimuWklKEat0HhExTNuVF
         M/sizsQo3cZaE1OOKQSk1rtpZDjTVEjt6At+QshG/GhR9PABnrx5UXtii+k/roMZmsh3
         MYp3Z1seGnw02Gf7cdeaP7oYPX/vMpJIxdTVfcp9qh4sE2z9hjkS0aXkXY5CvNcgfpyy
         tkiPsx6BAuvbbqIb5dcHaw9u3DQe2Zp2eGiYeR4d+3ltuj9tfyspdhWEa/QoafKQ9ZZq
         MfGw==
X-Gm-Message-State: ANoB5pkxndmVYb4Sr7p9jwen9OVt7aOhVHkpLqV0MgxbagnDWYRsMvho
        DZXZr9aCB9a4v9Y8NcTRKcVaKlnMAYfSPy+Uy2ZB0PA5wTwUrPcpdlN38CdyDNwcuTxwyYA2Q1k
        l002UKyLJegDnCx9ZHQPs8gAusyLTUIT7lg==
X-Received: by 2002:a05:6402:2407:b0:467:5e4f:591 with SMTP id t7-20020a056402240700b004675e4f0591mr17853816eda.414.1668584652050;
        Tue, 15 Nov 2022 23:44:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf712prrYUCC64TH9pHr3rG4LYjbhI9B+bizTPhSQkwyIMLJRFVZEIX3EOyEGrzMoJ4mm9q05w==
X-Received: by 2002:a05:6402:2407:b0:467:5e4f:591 with SMTP id t7-20020a056402240700b004675e4f0591mr17853802eda.414.1668584651871;
        Tue, 15 Nov 2022 23:44:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402320700b00463c475684csm7183124eda.73.2022.11.15.23.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 23:44:11 -0800 (PST)
Message-ID: <ac5c3f8f-8d3a-be5e-a12f-6b164f0b235a@redhat.com>
Date:   Wed, 16 Nov 2022 08:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] platform/surface: aggregator_registry: Add support for
 Surface Laptop 5
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115231440.1338142-1-luzmaximilian@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221115231440.1338142-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/16/22 00:14, Maximilian Luz wrote:
> Add device nodes to enable support for battery and charger status, the
> ACPI platform profile, as well as internal HID devices (including
> touchpad and keyboard) on the Surface Laptop 5.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  .../surface/surface_aggregator_registry.c        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index db82c2a7c567..023f126121d7 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -234,6 +234,19 @@ static const struct software_node *ssam_node_group_sl3[] = {
>  	NULL,
>  };
>  
> +/* Devices for Surface Laptop 5. */
> +static const struct software_node *ssam_node_group_sl5[] = {
> +	&ssam_node_root,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_pprof,
> +	&ssam_node_hid_main_keyboard,
> +	&ssam_node_hid_main_touchpad,
> +	&ssam_node_hid_main_iid5,
> +	&ssam_node_hid_sam_ucm_ucsi,
> +	NULL,
> +};
> +
>  /* Devices for Surface Laptop Studio. */
>  static const struct software_node *ssam_node_group_sls[] = {
>  	&ssam_node_root,
> @@ -345,6 +358,9 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
>  	/* Surface Laptop 4 (13", Intel) */
>  	{ "MSHW0250", (unsigned long)ssam_node_group_sl3 },
>  
> +	/* Surface Laptop 5 */
> +	{ "MSHW0350", (unsigned long)ssam_node_group_sl5 },
> +
>  	/* Surface Laptop Go 1 */
>  	{ "MSHW0118", (unsigned long)ssam_node_group_slg1 },
>  

