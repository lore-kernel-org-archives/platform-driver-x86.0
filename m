Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91CDC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F02C22CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436833AbhARSbV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jan 2021 13:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393684AbhARSbP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 13:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610994589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5NjRX5B5MOb4wxtZQReem/ly9YfdPWUYmQv2ycL3Vvg=;
        b=UUqbJlZUL4ioahlFaPJezzSSDWdJ8tJYhqWbrDvg6HqxuxQ0i/QWdZQBTYlZeaRTOH95dc
        ZXN8Iw7A1vdHi2xezo1+Mx3Bps72azZhYEhtvhooeDYfxTXHQKRuUEAea1thYtSROcp9vM
        RBO9R15YIEyfI7Xgea0ek0SINspquUU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-anMg4KWbPHCynA5vLhieIA-1; Mon, 18 Jan 2021 13:29:47 -0500
X-MC-Unique: anMg4KWbPHCynA5vLhieIA-1
Received: by mail-ed1-f72.google.com with SMTP id n8so6228567edo.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 10:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5NjRX5B5MOb4wxtZQReem/ly9YfdPWUYmQv2ycL3Vvg=;
        b=Y/bDbrs622S7JGxsAQfy8jtohQDpkbDtTyBC5rAqqo+/+zo9HHQmIssv0R030hO1/s
         334TZUDPgHrcMthBnDDvSBMVgPuklrAEtGrK7gatnwjfyPmtiCSmilcHMxGFWF7USaBX
         YUeLN66K/W+EwJgzIrXZP/KHG8z40tnMuWZQuSqS60fDYhcKNZ7CciqhiVq45ZRmb5ak
         IkGBUwtW+AhNxBHenoFavF8Yyqsrl85px+xNuIQ6uV2NC+/iJM+n3dIutBhH0TQ0rfjw
         c6/9xPqNwuBY6r8lgx5qOZd34DSA+JFLwsZzfGARX94Zkc8aSaQqaQ5UVcIzqQ7Uatoe
         qb0A==
X-Gm-Message-State: AOAM533EoHQVnCF5DVjy9ySU7EpQXmwhrbc8Pl8MazGUqJuaXk17pMQ0
        vnxhH+9Uk+ZSPrY4DDIYYCQFixefKcmDDZFRz8JjFYXzwEBR5q/uSJFtMt9cQUOqf/7fX1Z0hj5
        TVyFqe2BslAb7aBEtpXnoqhS98KP9B3RPKoZLGwlCKvVtSSwLrjD9drj3pI75IUuxUR0a+BDmkf
        LcSrp9YzEwiw==
X-Received: by 2002:a17:906:1302:: with SMTP id w2mr646739ejb.413.1610994585118;
        Mon, 18 Jan 2021 10:29:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIE+zQ4YirqnJgaFzT3TC2D9JdDAoCLGVNvIAUPgRkLnWmTKycpnh2uxR6RmL61mUjDWBJ2Q==
X-Received: by 2002:a17:906:1302:: with SMTP id w2mr646731ejb.413.1610994584947;
        Mon, 18 Jan 2021 10:29:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id j25sm10622110edy.13.2021.01.18.10.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:29:44 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: update email address for Henrique de Moraes
 Holschuh
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210115184721.32546-1-hmh@hmh.eng.br>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <55b3b76c-94b5-79d5-2d91-648e59c6770d@redhat.com>
Date:   Mon, 18 Jan 2021 19:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210115184721.32546-1-hmh@hmh.eng.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/15/21 7:47 PM, Henrique de Moraes Holschuh wrote:
> Update my email address in MAINTAINERS to the one I have been using for
> commits, Signed-off-by and Acked-by tags.  Only two ancient commits had
> the old ibm-acpi@hmh.eng.br, so it is unlikely to justify a .mailmap
> entry.
> 
> Note that ibm-acpi@hmh.eng.br does work as a way to contact me, but
> apparently it is best when MAINTAINERS entries match commit email
> addresses ;-)
> 
> Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

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
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79b400c97059..b7980a752c28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17637,7 +17637,7 @@ F:	drivers/thermal/gov_power_allocator.c
>  F:	include/trace/events/thermal_power_allocator.h
>  
>  THINKPAD ACPI EXTRAS DRIVER
> -M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> +M:	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>  L:	ibm-acpi-devel@lists.sourceforge.net
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> 

