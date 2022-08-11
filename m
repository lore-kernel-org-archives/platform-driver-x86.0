Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1971C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 18:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbiHKSwo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 14:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbiHKSwm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 14:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 190CE9E10D
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660243960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNyZEMFVFrFa8kgVwgLPqAYNcLyvy1ZrbXPv11GN+Lc=;
        b=fRjb3h4ZRxzD7SF24HAd+Q/IpazD8g3tsb5sanEXr/mREG6izyCQQkFNzXYmQEKiZtKEx6
        S43+yrZaWkEu4SrpSaTMZXZbbOUaTqZlFV/TuyuW8iaNB+STdP/yd8XdQTDb31HX/KZunh
        8K2hkifT8mRh7ryZbCfwHlF/EejDFP0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-RgUV-3YtPHiNVLDc1YXMDA-1; Thu, 11 Aug 2022 14:52:38 -0400
X-MC-Unique: RgUV-3YtPHiNVLDc1YXMDA-1
Received: by mail-ed1-f70.google.com with SMTP id o2-20020a056402438200b0043d552deb2aso11377841edc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 11:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JNyZEMFVFrFa8kgVwgLPqAYNcLyvy1ZrbXPv11GN+Lc=;
        b=Ctou9NbstcioIeirnR+YBrMh7+7zdMzQpH/FJVKkBBHWV+XCFplpxt8MvpXTxOUHzP
         iJrWE2j+noZGZz2wZIPXEXDKpYujjlrwWzopoWuYm+79qZbiIvkV5CYoPbQnWu8AR3gZ
         l23C8vY2EDJFu+GDzJtJ/pt0n6sM4cblz1UetkO/VFQJVh1fDDucOmHc69/lk6kWep82
         kb/jD+K4EzndB1U2NE0wnY2KsCrEb9WqI6vH02FgQrt4MpROQVzKiIlxLDlLOXkFKOty
         UIWdIvhOTVxUhGNbKtrupiBVKsC4dX0qnstUoft8gAWcYL3ENxz2hC240sjfTriBfeyy
         DmmQ==
X-Gm-Message-State: ACgBeo1FCey7F5Ej3XvKYihYfx/zQHrVIwxQrpO2XBWp6qP5p1W/dDPt
        kmOaKtUEo4/jEfKA3N3TdcXDlV1zGHIiovSiezJ4R3H0X+Ecmo5kOANX06U76FPSv/pG/52fD5H
        9skAim1pi7j3tnNQOu78qnOq+ikXQ8ufZkg==
X-Received: by 2002:a17:906:58c9:b0:730:bc01:fd5f with SMTP id e9-20020a17090658c900b00730bc01fd5fmr285315ejs.504.1660243957652;
        Thu, 11 Aug 2022 11:52:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QYwkiMxkhhAF6jyTpAT0xoUswSga2mCJmeC6MtRkrn/UJ/PwLYSmER42bg7a8X/iW83cwiA==
X-Received: by 2002:a17:906:58c9:b0:730:bc01:fd5f with SMTP id e9-20020a17090658c900b00730bc01fd5fmr285297ejs.504.1660243957406;
        Thu, 11 Aug 2022 11:52:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ck26-20020a0564021c1a00b0043d7b19abd0sm119740edb.39.2022.08.11.11.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 11:52:37 -0700 (PDT)
Message-ID: <a019bd66-e53b-0993-77a0-c31c687c5f6f@redhat.com>
Date:   Thu, 11 Aug 2022 20:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/surface: aggregator_registry: Add support for
 Surface Laptop Go 2
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220810140133.99087-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220810140133.99087-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/22 16:01, Maximilian Luz wrote:
> The Surface Laptop Go 2 seems to have the same SAM client devices as the
> Surface Laptop Go 1, so re-use its node group.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans


> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index ce2bd88feeaa..08019c6ccc9c 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -556,6 +556,9 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
>  	/* Surface Laptop Go 1 */
>  	{ "MSHW0118", (unsigned long)ssam_node_group_slg1 },
>  
> +	/* Surface Laptop Go 2 */
> +	{ "MSHW0290", (unsigned long)ssam_node_group_slg1 },
> +
>  	/* Surface Laptop Studio */
>  	{ "MSHW0123", (unsigned long)ssam_node_group_sls },
>  

