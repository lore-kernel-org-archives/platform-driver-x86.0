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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408B6C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 015A9601FC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhFPODK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233545AbhFPODJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 10:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623852063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=99mp808GTvoHtUOVOhzwcf4Ti8HJLQlZI3YGbg3T2Vk=;
        b=GS4o4ZxjXLXnFYpsFFpPESwNLlVWKYrY19SSRZMzQ2NsynMyLN19CT4E2CQz4Pi3ctJkCn
        uegGFnV+rAq27yNJEE+gCF9JqiZiRFbhInVgqqRWkzW6HAhxN3e5du/36G7ShGEZGcChsa
        DwZf37F8413z0b5+vv+CQpHQvvLfuX0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-5r2pWNjJMqCZSgnNcVQV6Q-1; Wed, 16 Jun 2021 10:01:02 -0400
X-MC-Unique: 5r2pWNjJMqCZSgnNcVQV6Q-1
Received: by mail-ed1-f71.google.com with SMTP id ch5-20020a0564021bc5b029039389929f28so1075466edb.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=99mp808GTvoHtUOVOhzwcf4Ti8HJLQlZI3YGbg3T2Vk=;
        b=Sr0p1jUWX6+6H4DVjWOnB8I4+2f4PZccqm9sIj1QgAKrBjWSe7YYY/uh4HO900znf6
         /Iqk/nVQyFhVx96W+rKYbNlVBO/x+8+Cc12JAWN1VyCWwHy4mm6q/wIn/+y6+8WS4mOB
         4OD+zrnKnwUfMbr8JgrsXORENgBhTpHnm2d6itzyQ9B67JdAs9v9intxLO40TVZLpAoD
         SQEPWt6B0bhdRfEUD4ofLUwKZmGa6hyEQPRj+wVJ9smlN9ZlIJQtzMZjIsUFcucTY798
         t/7Rca5VmqPs0CundYIJ/pdDuOr9bAu0SLh4iw9NaUQdk5yijuavX/4oFYILnbe7gTM9
         VrgQ==
X-Gm-Message-State: AOAM532m5pCjyRh75TIv3F1QRlVju32+rN7NxN/CDlpeFoCPzxaBjZTz
        iA158kNLFKC7KktGXGesKcw1+RXvuvnKhDIewC3ZgRVrwTcNxcJjEzgTs1B7+h5Er7WA7eYXERy
        AVqMxcL5drnWiSf/2MZ70UEVfJR1rNvQTSg==
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr3219674ejb.194.1623852060608;
        Wed, 16 Jun 2021 07:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyiHJnn+VnmvzClXr9YrSuDj59DDjAwycqmkFlcAAOI9OhNogx9ksmilxCyBJvXTPSihgkRQ==
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr3219642ejb.194.1623852060406;
        Wed, 16 Jun 2021 07:01:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n2sm1867491edi.32.2021.06.16.07.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 07:01:00 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Update IRC link for Surface System
 Aggregator subsystem
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210614194635.1681519-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4ef00d02-98a5-af51-8ba2-5f322f802004@redhat.com>
Date:   Wed, 16 Jun 2021 16:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614194635.1681519-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/14/21 9:46 PM, Maximilian Luz wrote:
> We have moved to libera.chat. Update the link accordingly.
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
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 142d4baa4f0f..7e38764f778c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12190,7 +12190,7 @@ M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  W:	https://github.com/linux-surface/surface-aggregator-module
> -C:	irc://chat.freenode.net/##linux-surface
> +C:	irc://irc.libera.chat/linux-surface
>  F:	Documentation/driver-api/surface_aggregator/
>  F:	drivers/platform/surface/aggregator/
>  F:	drivers/platform/surface/surface_acpi_notify.c
> 

