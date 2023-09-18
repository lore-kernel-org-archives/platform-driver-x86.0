Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BDCCD37B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 16:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjIRQu1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 12:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjIRQu0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 12:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B948AC
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695055779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/kD8Hdgkg/23KhJ0is3uFFvBHnrlVOJ9Vc1+AFiUAug=;
        b=LSWTkrleR61kRA7eXsvpFIgKtITX2xrRB6cjeLhWKsPtvkrTajyP3BEyfC//+eQdTYsuIX
        2w7hkMM85U+f+BQvc5hvqCe+oJCHVYUOe/+dgoHXxVru0aZ6iEysRJ5/uPUrpMiGbnsGpJ
        7WYN00a7hVQKkrkHhJ8nDlbufWmrzp4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-Ol2heGJ8PeSXwe_lj_lthw-1; Mon, 18 Sep 2023 09:47:12 -0400
X-MC-Unique: Ol2heGJ8PeSXwe_lj_lthw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a681c3470fso315593566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 06:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695044830; x=1695649630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kD8Hdgkg/23KhJ0is3uFFvBHnrlVOJ9Vc1+AFiUAug=;
        b=oYbNAZC4hfJoMz2HvrijNWlW545yACimoS0aTt/Adur8zfi2DLZkld+2YefWfKjTaf
         mA2E+k8UcVw+n8wTvZHzRbZ6tkwXNO5rMZaKVaV9P/hHkzF6GwiGzCndzNUaAXfdIrVn
         aRW5Kz6vRGFE2B+jOk7WiciK4N+qZ/WqLtoviBB74KWWYjlP2dmZG/MKS/RvadFGjCW3
         11ASnSiQBtEhKHovoF/9qXBuCJlLzCvmyLZyNMGchQKiJpGyrBby+nR1CnJTZlnEiIkN
         L/htTCBby8tE6O3La14xFpHYd7fv2teMsMkQBCUCJMkEzQHN47HZYt1tF4jYZ3a25uLH
         xxpQ==
X-Gm-Message-State: AOJu0YyQhG1vWiiVHxLwiOfM4bzf9TKeGHr38eRDU5pq1qkr5F0iQ8e3
        NZJkRKiWcRiacmD8fq/Tsoq6IVHEok8pTnl2oDhfJUhKzJTP2uF8QLl4xaUypJNwycuvf53cUCG
        JMaxqIEnnMymMzCtgaJMjY6DW7RSioCOqyQ==
X-Received: by 2002:a17:906:32c4:b0:9a1:ad87:1354 with SMTP id k4-20020a17090632c400b009a1ad871354mr8539116ejk.34.1695044830654;
        Mon, 18 Sep 2023 06:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6odOs1WnfgIZ68dHHp+WJeVMpINoYjFDNoY+y8RiXvC8b6WXCL2L9xn4yDZfuwZInteg3A==
X-Received: by 2002:a17:906:32c4:b0:9a1:ad87:1354 with SMTP id k4-20020a17090632c400b009a1ad871354mr8539099ejk.34.1695044830362;
        Mon, 18 Sep 2023 06:47:10 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m18-20020a1709066d1200b00993a37aebc5sm6474186ejr.50.2023.09.18.06.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:47:09 -0700 (PDT)
Message-ID: <2c671ff0-86e7-20e7-18ad-fc2c7f20508f@redhat.com>
Date:   Mon, 18 Sep 2023 15:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/7] platform/surface: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/23 22:37, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/platform/surface
> to use .remove_new. The motivation is to get rid of an integer return
> code that is (mostly) ignored by the platform driver core. 
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> Best regards
> Uwe

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> Uwe Kleine-König (7):
>   platform/surface: surface3-wmi: Convert to platform remove callback
>     returning void
>   platform/surface: acpi-notify: Convert to platform remove callback
>     returning void
>   platform/surface: aggregator-cdev: Convert to platform remove callback
>     returning void
>   platform/surface: aggregator-registry: Convert to platform remove
>     callback returning void
>   platform/surface: dtx: Convert to platform remove callback returning
>     void
>   platform/surface: gpe: Convert to platform remove callback returning
>     void
>   platform/surface: hotplug: Convert to platform remove callback
>     returning void
> 
>  drivers/platform/surface/surface3-wmi.c                | 5 ++---
>  drivers/platform/surface/surface_acpi_notify.c         | 6 ++----
>  drivers/platform/surface/surface_aggregator_cdev.c     | 5 ++---
>  drivers/platform/surface/surface_aggregator_registry.c | 5 ++---
>  drivers/platform/surface/surface_dtx.c                 | 5 ++---
>  drivers/platform/surface/surface_gpe.c                 | 6 ++----
>  drivers/platform/surface/surface_hotplug.c             | 6 ++----
>  7 files changed, 14 insertions(+), 24 deletions(-)
> 
> 
> base-commit: dfa449a58323de195773cf928d99db4130702bf7

