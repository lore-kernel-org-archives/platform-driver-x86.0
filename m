Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3055C43214
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88CF661104
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344157AbhHFNit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 09:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22230 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344155AbhHFNis (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 09:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628257112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N/1ERJ3ikPtd7jbQkJKjNQFBl4bQ6myErCA7cprevbw=;
        b=c2Ik9UFZXxL3CFq6Teb+Dbf9Qqxje2wndeHj+LFCDvQ2OqUaCXB/J3mmruZXqvstCAoP7X
        1WvtyLY6OdtdwSpttqJsIzmfLcMH3xvHFeEPCmL7pOSVDcsYe2BmGf0VA6Maqy4lwGkmtz
        UTmhKTo7NldWy+y/rEWmAfL2pgFBTtw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-YwWfEe9zOQaz9ANzt4WkGQ-1; Fri, 06 Aug 2021 09:38:28 -0400
X-MC-Unique: YwWfEe9zOQaz9ANzt4WkGQ-1
Received: by mail-ed1-f70.google.com with SMTP id u4-20020a50eac40000b02903bddc52675eso4770829edp.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Aug 2021 06:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/1ERJ3ikPtd7jbQkJKjNQFBl4bQ6myErCA7cprevbw=;
        b=AcxQJbyJIOduM8QKTfOqUNVTHZG+wKJ3m2KoZfiURdU+B6jlFyQLlZWGz2h7J4oZbF
         hD0F2BYPhPp3ASAayE1RxqosopuhmVTVa8n9GuMJANSc6bP0ru99v7TZ3SAL+BG+aJQK
         Iiw8yHj1sERMB51+Q+a4hwvsZu9I8Gt7cVqh4P15vAtqIC4FlSGZnntlyaYO8gYc1sd1
         BuXwns/M3CCmJIOST/MF7uOf01bwCK8RrGi6t4bpzf9kuZgGbXn380OuOSY1yTavgc6G
         Bs0pjxUC4RTkh9Xb49lvNcO2ypZ1fSrFuyxYxJKUarpXYlRBoxOUZzQ2cFlhpqnC8ZuA
         0wwA==
X-Gm-Message-State: AOAM532Fg78oj+C9Qrl80IlEJExOQf/EmvRPTcKphB+BgmhVi/5LejQL
        6wbreUp0yO6qAizsCIF115pmfxquhpz+WgYM5lkbiAXZZj0Qz9W2O6VYV3JkbOpvAQuPI3+LNAf
        nVguTW5RkImmQ8Np6I+9V0nqiBHjP5KOlUA==
X-Received: by 2002:a17:906:2990:: with SMTP id x16mr9623667eje.554.1628257107259;
        Fri, 06 Aug 2021 06:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg72QNJtYoafjptIvMkFJ8PPCCK3QiR4nn8AN/qCiJQJKvy6Dqc7q61DLbV1Sm9cC9EUZa9A==
X-Received: by 2002:a17:906:2990:: with SMTP id x16mr9623650eje.554.1628257107119;
        Fri, 06 Aug 2021 06:38:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u9sm747033edt.60.2021.08.06.06.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:38:26 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] platform/surface: aggregator: Use y instead of
 objs in Makefile
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
References: <20210803192524.67031-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <342c0563-ebe8-2981-c5d6-22463175a88c@redhat.com>
Date:   Fri, 6 Aug 2021 15:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803192524.67031-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/3/21 9:25 PM, Andy Shevchenko wrote:
> The 'objs' is for user space tools, for the kernel modules
> we should use 'y'.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

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
> v2: fixed typo, annihilated ifeq, added Rb tag (Maximilian)
>  drivers/platform/surface/aggregator/Makefile | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/Makefile b/drivers/platform/surface/aggregator/Makefile
> index c8498c41e758..c0d550eda5cd 100644
> --- a/drivers/platform/surface/aggregator/Makefile
> +++ b/drivers/platform/surface/aggregator/Makefile
> @@ -6,12 +6,9 @@ CFLAGS_core.o = -I$(src)
>  
>  obj-$(CONFIG_SURFACE_AGGREGATOR) += surface_aggregator.o
>  
> -surface_aggregator-objs := core.o
> -surface_aggregator-objs += ssh_parser.o
> -surface_aggregator-objs += ssh_packet_layer.o
> -surface_aggregator-objs += ssh_request_layer.o
> -surface_aggregator-objs += controller.o
> -
> -ifeq ($(CONFIG_SURFACE_AGGREGATOR_BUS),y)
> -surface_aggregator-objs += bus.o
> -endif
> +surface_aggregator-y := core.o
> +surface_aggregator-y += ssh_parser.o
> +surface_aggregator-y += ssh_packet_layer.o
> +surface_aggregator-y += ssh_request_layer.o
> +surface_aggregator-$(CONFIG_SURFACE_AGGREGATOR_BUS) += bus.o
> +surface_aggregator-y += controller.o
> 

