Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626CDC4743C
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 20:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EED361153
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 20:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhFDUUU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 16:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230214AbhFDUUT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 16:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622837913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5AKmMvs/+u+KfG4w0sgMq72rTrYGw3m3QsVKTiR88GI=;
        b=ACRLpMBrW3JCuEWZhK4Jvpo8FyYbQIcQmMb0LGBXeBsLgSMuPyiQ1DiuxPxTv6k7HUn8hv
        UfDdoHbja2QWu2Ob5yOvXXNjxuWir2vKbK14t8XI8HCRAVI+YGGezBrJ62wQR4Zc0lg1UN
        MLYur93H7Ny8ajFnJovZEe8hhnC7B2c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-t0nOykKwNkiWjBip5QtbUw-1; Fri, 04 Jun 2021 16:18:31 -0400
X-MC-Unique: t0nOykKwNkiWjBip5QtbUw-1
Received: by mail-ej1-f72.google.com with SMTP id b10-20020a170906194ab02903ea7d084cd3so3956417eje.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Jun 2021 13:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5AKmMvs/+u+KfG4w0sgMq72rTrYGw3m3QsVKTiR88GI=;
        b=j6nzdDzhqKniCkI7uLYSc1FA9G47Tnb8XOv7DSSB7Tc3Cx8DGDpwXzFZo+aUxTXGou
         Vntzwxwf7g4+34T2L8X2U6A8tEqlcWeDXouv0/ACBMIKwe1W6HHJHtUn8Umsf2D7LuDK
         QsHIaZPvqkegK8XouSNvFqzLJI2ffoQZp7YxHCHplHzOmLvO0/VUPgxqTfeNtnMSr4qj
         jjpKFQe8uo5yPboWLTQmdV5y8oxNfNVfPoSPRG/iIVnfelaDG7P72UoO/YVpIqLp+oBb
         gHPi1Ax6hhhwemknPJ0ktdgLBYHtsPu8lqigwJHaVO2146UKdlbvlbAKkd1/jJXoBZAh
         Ysdg==
X-Gm-Message-State: AOAM533vYcOks/T5Gl3gCePR43Hrkg4mqBT0FSkOuxtVmWO2RKAFT29N
        U7S3JCJthP7YgHwh52P9zSlU8M82vq1nt+8zRUYPDIWYgCxZarfa1voirK791lI3YlZlDsU2gbP
        lXpPYMj71mUGzVNDl4HPVZVSK7pckH2/6SA==
X-Received: by 2002:a50:ff16:: with SMTP id a22mr6567828edu.143.1622837910259;
        Fri, 04 Jun 2021 13:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCx0UwSGeTDQBAxTrW9bb/PWjt5dWgr8p5xE9YiOELsB4eVir6D7JeJmh50FPnZNFBhqg0Gw==
X-Received: by 2002:a50:ff16:: with SMTP id a22mr6567816edu.143.1622837910074;
        Fri, 04 Jun 2021 13:18:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q26sm3182397ejc.3.2021.06.04.13.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 13:18:29 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] platform/surface: aggregator: Extend user-space
 interface for events
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210604134755.535590-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bcbd0067-2df3-998e-0a28-23e599966ec1@redhat.com>
Date:   Fri, 4 Jun 2021 22:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604134755.535590-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/21 3:47 PM, Maximilian Luz wrote:
> Extend the user-space debug interface so that it can be used to receive
> SSAM events in user-space.
> 
> Version 1 and rationale:
>   https://lore.kernel.org/platform-driver-x86/20210603234526.2503590-1-luzmaximilian@gmail.com/
> 
> Changes in version 2:
>  - PATCH 2/7: Avoid code duplication, remove unused variable
>  - PATCH 4/7: Add missing mutex_destroy() calls
> 
> Maximilian Luz (7):
>   platform/surface: aggregator: Allow registering notifiers without
>     enabling events
>   platform/surface: aggregator: Allow enabling of events without
>     notifiers
>   platform/surface: aggregator: Update copyright
>   platform/surface: aggregator_cdev: Add support for forwarding events
>     to user-space
>   platform/surface: aggregator_cdev: Allow enabling of events from
>     user-space
>   platform/surface: aggregator_cdev: Add lockdep support
>   docs: driver-api: Update Surface Aggregator user-space interface
>     documentation

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've done one small fixup to patch 2/7, see my reply to that patch.

Once the builders have had some time to test this branch the patches there
will be added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>  .../surface_aggregator/clients/cdev.rst       | 127 ++++-
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +-
>  drivers/platform/surface/aggregator/Kconfig   |   2 +-
>  drivers/platform/surface/aggregator/Makefile  |   2 +-
>  drivers/platform/surface/aggregator/bus.c     |   2 +-
>  drivers/platform/surface/aggregator/bus.h     |   2 +-
>  .../platform/surface/aggregator/controller.c  | 332 +++++++++--
>  .../platform/surface/aggregator/controller.h  |   2 +-
>  drivers/platform/surface/aggregator/core.c    |   2 +-
>  .../platform/surface/aggregator/ssh_msgb.h    |   2 +-
>  .../surface/aggregator/ssh_packet_layer.c     |   2 +-
>  .../surface/aggregator/ssh_packet_layer.h     |   2 +-
>  .../platform/surface/aggregator/ssh_parser.c  |   2 +-
>  .../platform/surface/aggregator/ssh_parser.h  |   2 +-
>  .../surface/aggregator/ssh_request_layer.c    |   2 +-
>  .../surface/aggregator/ssh_request_layer.h    |   2 +-
>  drivers/platform/surface/aggregator/trace.h   |   2 +-
>  .../surface/surface_aggregator_cdev.c         | 534 +++++++++++++++++-
>  include/linux/surface_aggregator/controller.h |  27 +-
>  include/linux/surface_aggregator/device.h     |   2 +-
>  include/linux/surface_aggregator/serial_hub.h |   2 +-
>  include/uapi/linux/surface_aggregator/cdev.h  |  73 ++-
>  22 files changed, 1018 insertions(+), 109 deletions(-)
> 

