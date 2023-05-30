Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020B9C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 May 2023 09:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjE3J1Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 May 2023 05:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjE3J1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2023 05:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345AB1708
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685438685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z9RJFrYLqLgFzi67UhoXNHgdb3OmEq6SZCxp449VXFI=;
        b=PGD01nzb6BY8YV3MrnKN88f+cicLfwtoBwJhAw9D9GXKYbYBgk00PYQyDrkLC0g8F52iSE
        65ZSkUBkLiAOKhz7dXg3xwjXhTC6GUwg9VFnjp1VbSJ9pMTS2sX/9XN4WDFSvrnYq/Xa6E
        TzY8QjtWvko6U6TSWU4gqKPsZnPU41U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-xxeoqqLtM8mIqCm6eeIYQw-1; Tue, 30 May 2023 05:24:44 -0400
X-MC-Unique: xxeoqqLtM8mIqCm6eeIYQw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a341efd9aso462394266b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438683; x=1688030683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9RJFrYLqLgFzi67UhoXNHgdb3OmEq6SZCxp449VXFI=;
        b=GOWgwOHy3uaQ1VOyItCFViFLBXPRfVzHTJgVyhYrTHCi1SUYcPsA4QuhC7GDSzgAtH
         Bvb7a1V79tIHtUTd85rpGgV8X2Js61C9iD+5qG0UODqLXA0So1mf3RmMJPox9Ui6tltf
         IbWCi5SVWv+xphehYMF47CG5hREPT+Xe1YHbg4Rbla3nEsb4ikkWXKz4gimNR1HBcbjf
         OgQHe+XWbYsmbUg+2i9FRuAA9y8OumE4/+Oxa22A8VLWrijX8SOjagb81IFkn37pGJ7K
         n9y5QVOR/XCv3KRVAZ1nHqYtuMLhEMrPr2OvE7wQagC/wDQSFyT9qtjvc9W3MJDKci1c
         9dDg==
X-Gm-Message-State: AC+VfDzyp7Wi2mSmh5Eww+g1iIK2k/IE9p9UkEQK/Fba1OachB9Srmrj
        zY9ltnicqdGOFFjDmYm3pqZ4aAAmITNY0ssqxNVbC4SsQhEa3/UzJbuQ3auaUKrxL1eN+53pHNN
        ivGT+6odR0u+IiWnofKaNP2WHlUKxkkZdpKjL3khJeA==
X-Received: by 2002:a17:907:c1b:b0:96a:8c13:8dc0 with SMTP id ga27-20020a1709070c1b00b0096a8c138dc0mr2135152ejc.37.1685438683050;
        Tue, 30 May 2023 02:24:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JwgXo/7m706w67MkZ6WRLYKlfJCzlayLHMyGuv32SvH1FWBGlhwbXJxitf1D9jU6epacELg==
X-Received: by 2002:a17:907:c1b:b0:96a:8c13:8dc0 with SMTP id ga27-20020a1709070c1b00b0096a8c138dc0mr2135137ejc.37.1685438682724;
        Tue, 30 May 2023 02:24:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7cd09000000b005148e5a4c84sm3992035edw.41.2023.05.30.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:24:42 -0700 (PDT)
Message-ID: <769f85b2-7425-e3d6-2492-6ec8a5e745d1@redhat.com>
Date:   Tue, 30 May 2023 11:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/surface: aggregator: Allow completion work-items
 to be executed in parallel
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230525210110.2785470-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525210110.2785470-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/23 23:01, Maximilian Luz wrote:
> Currently, event completion work-items are restricted to be run strictly
> in non-parallel fashion by the respective workqueue. However, this has
> lead to some problems:
> 
> In some instances, the event notifier function called inside this
> completion workqueue takes a non-negligible amount of time to execute.
> One such example is the battery event handling code (surface_battery.c),
> which can result in a full battery information refresh, involving
> further synchronous communication with the EC inside the event handler.
> This is made worse if the communication fails spuriously, generally
> incurring a multi-second timeout.
> 
> Since the event completions are run strictly non-parallel, this blocks
> other events from being propagated to the respective subsystems. This
> becomes especially noticeable for keyboard and touchpad input, which
> also funnel their events through this system. Here, users have reported
> occasional multi-second "freezes".
> 
> Note, however, that the event handling system was never intended to run
> purely sequentially. Instead, we have one work struct per EC/SAM
> subsystem, processing the event queue for that subsystem. These work
> structs were intended to run in parallel, allowing sequential processing
> of work items for each subsystem but parallel processing of work items
> across subsystems.
> 
> The only restriction to this is the way the workqueue is created.
> Therefore, replace create_workqueue() with alloc_workqueue() and do not
> restrict the maximum number of parallel work items to be executed on
> that queue, resolving any cross-subsystem blockage.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Link: https://github.com/linux-surface/linux-surface/issues/1026
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
>  drivers/platform/surface/aggregator/controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 535581c0471c5..7fc602e01487d 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -825,7 +825,7 @@ static int ssam_cplt_init(struct ssam_cplt *cplt, struct device *dev)
>  
>  	cplt->dev = dev;
>  
> -	cplt->wq = create_workqueue(SSAM_CPLT_WQ_NAME);
> +	cplt->wq = alloc_workqueue(SSAM_CPLT_WQ_NAME, WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
>  	if (!cplt->wq)
>  		return -ENOMEM;
>  

