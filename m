Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BFCC4708F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 11:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 680B46141C
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 11:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhFDLl6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 07:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31061 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230008AbhFDLl6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 07:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622806812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YNkqwoHmjCetvDz6q0O22+jHsUtoiak49yhC0uQMzAQ=;
        b=Ofw2vHZ0JRkRqnMu8BYtwQcGLmhVsN6SJoHy2eTvtOBxk7MDyHFL0fVWzo1nQc7Qjosc+B
        4Pe8iRgjIpJGK+jwql8QM5bNxgvG7uBCyvZjzXFtbvcOYHEDsMOUX2RsrZz+xP1ius9L3p
        RhMiGW0GAP45MtPLKwYeNN2LATXA+NQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-SPCi4M80ODikfbmhlh5YpQ-1; Fri, 04 Jun 2021 07:40:08 -0400
X-MC-Unique: SPCi4M80ODikfbmhlh5YpQ-1
Received: by mail-ed1-f71.google.com with SMTP id a16-20020aa7cf100000b0290391819a774aso2811760edy.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Jun 2021 04:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YNkqwoHmjCetvDz6q0O22+jHsUtoiak49yhC0uQMzAQ=;
        b=iOUoTxRmt2xSrlAo1rloBInM/rqPvfgXEbBKMwhJamGkep+MiD289/gUjF8onEXmkl
         XUNQB7U9dwOx03+TODKesnvGIb6S3u3NnHKOYxD0gPS6ov2vJNu6eXkiiCQ0coUVIzGH
         cxV7bKyPcEGC7i8AZTeydlrmnxtNMPim/LQYzFpsAORHL9zWsjxUk88rnX0kncDs5b4L
         cxGxxYi70jomQWK3M8ZnNCmLaO2+d5TBNHotFpguHruXE324HaoFoDea4OFVjBbsp6T2
         JwuIbXj4PRTl7o6XLWfLh1qDyznwV4jcuN0TtfskH6fsG/1mVVFJoaFe0jpcXjmaju+5
         8jJQ==
X-Gm-Message-State: AOAM533GpxlaTQ2fx3sfjOP3yiM29iSAvfE7APdw7Wwzm810CYGww4pI
        13SVRnM4D8eQh18bH2FvBGRl+wUVefxGreFxG2w5aPIFrIQumHSoNwELeUuu86Y2SOAI1/huYRg
        /2geNjPF7MPUtNyJzkrgOWyStbk46q2HblA==
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr3668864ejd.124.1622806807704;
        Fri, 04 Jun 2021 04:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEz9sb6DS0Q6mlqeeAcYXa4WfwbrCCbzzk0TTRJqfgzB90gXvxTCGq4flqZ7kMMHhlezFk6A==
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr3668856ejd.124.1622806807529;
        Fri, 04 Jun 2021 04:40:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id oz25sm2664178ejb.48.2021.06.04.04.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:40:07 -0700 (PDT)
Subject: Re: [PATCH 0/7] platform/surface: aggregator: Extend user-space
 interface for events
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210603234526.2503590-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c86a976e-64cb-ea10-486e-fa5d4482ad5b@redhat.com>
Date:   Fri, 4 Jun 2021 13:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603234526.2503590-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Maxime,

On 6/4/21 1:45 AM, Maximilian Luz wrote:
> Extend the user-space debug interface so that it can be used to receive
> SSAM events in user-space.
> 
> Currently, inspecting SSAM events requires writing a custom client
> device and corresponding driver. This is not particularly user-friendly
> for quick testing and comes with higher iteration times. Since we
> already have a user-space interface, we can extend this to forward
> events from SSAM via the controller device file to user-space. With this
> we can then essentially write user-space SSAM clients for testing and
> reverse-engineering, providing us with all the essential functionality
> that previously only a kernel driver would have access to. Note that
> this is still only intended to be an interface for debugging and
> reverse-engineering purposes.
> 
> To achieve this, we need to extend the core to decouple events from
> notifiers. Right now, enabling an event group requires registering a
> notifier for that group. This notifier provides a callback that is
> called when the event occurs. For user-space forwarding, we need to run
> all events through the same file. In the current implementation, this
> presents a problem as, when we don't know the exact events or can't
> filter for them, multiple notifiers for the same target category will
> lead to duplicate events to be sent through the file, one per notifier.
> 
> Decoupling notifier registration from event enable-/disablement (and the
> corresponding reference counting) allows us to avoid this issue. We can
> then register one notifier for a whole target category and enable or
> disable events independently of this notifier. Since events are strictly
> separated by their target category, this will not lead to duplicate
> events.
> 
> With this, we can then provide user-space with two new IOCTLs for
> registering notifiers for a specific target category of events they are
> interested in. This allows us to forward all events received by those
> notifiers to the internal buffer of the device file, from which they can
> be read by user-space. In other words, user-space can, via those two
> IOCTLs, select which event target categories they are interested in.
> 
> Furthermore, we add another two IOCTLs for enabling and disabling events
> via the controller. While events can already be enabled and disabled via
> generic requests, this does not respect the controller-internal
> reference counting mechanism. Due to that, this can lead to an event
> group being disabled even though a kernel-driver has requested it to be
> enabled. Or in other words: Without this, a user-space client cannot
> safely reset the state as it has only two options, keeping the event
> group enabled and not attempt cleanup at all, or disable the event group
> for all clients and potentially stop them from working properly.
> 
> Also update the copyright lines since we're already doing some work on
> the core.

Overall this series looks good to me. I've found one small issue with
PATCH 4/7 (see my reply to that patch) and as the kernel test robot
pointed out there is an used "struct ssam_nf_head *nf_head;" in
PATCH 2/7.

With these 2 small issues fixed you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to v2 of the series.

Regards,

Hans



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
> 
>  .../surface_aggregator/clients/cdev.rst       | 127 ++++-
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +-
>  drivers/platform/surface/aggregator/Kconfig   |   2 +-
>  drivers/platform/surface/aggregator/Makefile  |   2 +-
>  drivers/platform/surface/aggregator/bus.c     |   2 +-
>  drivers/platform/surface/aggregator/bus.h     |   2 +-
>  .../platform/surface/aggregator/controller.c  | 206 ++++++-
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
>  .../surface/surface_aggregator_cdev.c         | 531 +++++++++++++++++-
>  include/linux/surface_aggregator/controller.h |  27 +-
>  include/linux/surface_aggregator/device.h     |   2 +-
>  include/linux/surface_aggregator/serial_hub.h |   2 +-
>  include/uapi/linux/surface_aggregator/cdev.h  |  73 ++-
>  22 files changed, 921 insertions(+), 77 deletions(-)
> 

