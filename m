Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C668EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 15:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94B9D64E8B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 15:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhBKPyN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 10:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40795 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230204AbhBKPvu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 10:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613058623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PFie4b8IIggJBAyOAfk90BEtab+sed/Odrk1Xr+jPYU=;
        b=VQle+APcuYjBZlv1GnWJa4NITJlQ+wyp3HnmPeJS/+p8O/46S3f5oFEW84uF+D6xXRYAq9
        7nceZx49TuNAA8ITWt1V7EWruvxnbqyaREow/LTErAhDyFn2xm6HZBnn1nXrxNfe8PCYzC
        9LZsjssGCAYIvJvJ4HeBrqCNtpfLnV8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-8XikERA_Nui9cPxOoMZt9g-1; Thu, 11 Feb 2021 10:50:19 -0500
X-MC-Unique: 8XikERA_Nui9cPxOoMZt9g-1
Received: by mail-ed1-f69.google.com with SMTP id w23so4731127edr.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 07:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PFie4b8IIggJBAyOAfk90BEtab+sed/Odrk1Xr+jPYU=;
        b=pvmEBuJjSY88KP/U2u4EeAjcaDaypkwDHy8YH9arEuIu9TbdmpSw7rc2cG+tGaZMhh
         M9Cv2tnOHB23wz+jW2EWbdBKAF5TIn52dfV2qQMz8Q5ije9xfl1v1/tIX6WIRWbnmtne
         xAO8efEiAA8BDHWvrkztgLs9H2eNDU2tGsC3zPUcOzJ5XufysAzD+O5OUF1vyICM/BCF
         F/D6A2xhVPl1WLmMpl2xfmw8IQP7C2ZvpAFgACgSOsw+sjGmyyKF8Nmqv31cWTn70GMX
         4KbFnN5jG3oRzBZ2z0TGsDqGpiWikNkE9Ib/68Ay+we7x4tms5axjn0RUItMj9IvQG9H
         U6vQ==
X-Gm-Message-State: AOAM533WjDS+wFfkbFXnilMo9ykdWSwoR/buPCjZlZWnmF24QzCAoW8E
        JArfWIjchBCn+B2J8rWyLBRhD8jiUvWyJ+5w+oj5z7p7cA/D2aht7Z+Xp/0zCDQv7ccoyjOsJE1
        WaH79Cn6j1SK1sqiw2txV5CTmEqhFbzYDSA==
X-Received: by 2002:a17:906:2993:: with SMTP id x19mr8719280eje.409.1613058618554;
        Thu, 11 Feb 2021 07:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrvTuvWfiuzdxsmc2sdY/DkovUffsQYFa4iEEUwrewwyy70yZLSYdjQjhLcGIuO5NwnNns3Q==
X-Received: by 2002:a17:906:2993:: with SMTP id x19mr8719270eje.409.1613058618394;
        Thu, 11 Feb 2021 07:50:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i6sm4567051ejd.110.2021.02.11.07.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 07:50:17 -0800 (PST)
Subject: Re: [PATCH v2] platform/surface: aggregator: Fix access of unaligned
 value
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linx.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-test-robot <lkp@intel.com>
References: <20210211124149.2439007-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <824cb5dc-4594-fb00-a777-88189c41d62e@redhat.com>
Date:   Thu, 11 Feb 2021 16:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211124149.2439007-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/21 1:41 PM, Maximilian Luz wrote:
> The raw message frame length is unaligned and explicitly marked as
> little endian. It should not be accessed without the appropriate
> accessor functions. Fix this.
> 
> Note that payload.len already contains the correct length after parsing
> via sshp_parse_frame(), so we can simply use that instead.
> 
> Reported-by: kernel-test-robot <lkp@intel.com>
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
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
> 
> Changes in v2:
>  - Use payload.len instead of getting the frame length directly. Note
>    that payload.len equals the frame length and is already correctly set
>    in sshp_parse_frame(), so they are exactly the same thing. Makes it
>    look a bit nicer though.
> 
>    I did drop the ACKs/Reveiewd-by in case you want to check that
>    yourselves and since that's essentially the whole change.
> 
> ---
>  drivers/platform/surface/aggregator/ssh_packet_layer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> index 583315db8b02..15d96eac6811 100644
> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> @@ -1774,7 +1774,7 @@ static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
>  		break;
>  	}
>  
> -	return aligned.ptr - source->ptr + SSH_MESSAGE_LENGTH(frame->len);
> +	return aligned.ptr - source->ptr + SSH_MESSAGE_LENGTH(payload.len);
>  }
>  
>  static int ssh_ptl_rx_threadfn(void *data)
> 

