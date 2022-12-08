Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A49C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiLHQFF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 11:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiLHQFB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 11:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55189D2EB
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670515445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXsbEpWWvRn6V4K4AQAglneXzBPO0+xjG/LZYZe3/qc=;
        b=crH632wXj9oLGRX1dPl/alcrnYgIx0lqufzAa+d0tjULq+6pcHvxd8LsHe0iiEI3U0NFw1
        +S/Du4698lfepMFOSAWQHB1cmgi82HGbjT3h4S35mnQprkC90NUV+JLBiDAB/iwawsWzdL
        wdLoYa5uAyRKmeWrpx30p6mGNUJoKb0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-5PxMmgt5PROguYVsq-PzCg-1; Thu, 08 Dec 2022 11:03:42 -0500
X-MC-Unique: 5PxMmgt5PROguYVsq-PzCg-1
Received: by mail-ej1-f71.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso1446084ejb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 08:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXsbEpWWvRn6V4K4AQAglneXzBPO0+xjG/LZYZe3/qc=;
        b=kGaO+BKQ8VnZd3aoBQFArYkpvk1/EiZ8MfXwpP4HPq5wliDL/LzdWRQE9sEgUzyl5K
         FZnvQSMBV47BOzowueANx/Sy70XlswjgHzbsW9UOB8Gu7nm0nPxJm4lrxdhZ0wLfF89n
         1DQt5RL3NnQe10sNokCmwcyg6k8aF0PlnP2XBfmygiiITziLy32zLbLC87j+7/PKO4Td
         aa8+nOJtL1UG1gMxh9zoa0bORl4O072uwYDzhsrG6ujPiXbz2B/2wxp7P7Iz/Sy5rhzS
         OJLYXQt6iF/cqqtY5d+fxdXEEaOetNKcmNXGZWO33fMynZrvvgBzRwit4OVoqsSVugSi
         Jc/A==
X-Gm-Message-State: ANoB5pmwhXleOjONf0kk9dGt4z9PPuQzSAJAMx2U2+BDu3yFCDWhT1rE
        HC7c9aqP8G+VA2Rxrfyeou8T8ifmDDdPdh+m7t87EMuFlHkPXxKZgSg/TLDy/d226APwWdrxCW7
        qt9IlKSjZebyCLmvsjX1AOhIq26RWrRdZDA==
X-Received: by 2002:a17:906:c51:b0:7b2:91e8:1553 with SMTP id t17-20020a1709060c5100b007b291e81553mr2320262ejf.20.1670515420127;
        Thu, 08 Dec 2022 08:03:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6uLmr2ps/eoyIFTKExf/xJaLtd19e4nt+MMsCSb4MkIRG9XBk/nHAPLf9ph+m7OFZKDow9IA==
X-Received: by 2002:a17:906:c51:b0:7b2:91e8:1553 with SMTP id t17-20020a1709060c5100b007b291e81553mr2320247ejf.20.1670515419917;
        Thu, 08 Dec 2022 08:03:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fe17-20020a1709072a5100b0077a8fa8ba55sm9850087ejc.210.2022.12.08.08.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 08:03:39 -0800 (PST)
Message-ID: <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com>
Date:   Thu, 8 Dec 2022 17:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202223327.690880-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Maximilian,

On 12/2/22 23:33, Maximilian Luz wrote:
> We have some new insights into the Serial Hub protocol, obtained through
> reverse engineering. In particular, regarding the command structure. The
> input/output target IDs actually represent source and target IDs of
> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> debug connector, and SurfLink connector).
> 
> This series aims to improve handling of messages with regards to those
> new findings and, mainly, improve clarity of the documentation and usage
> around those fields.
> 
> See the discussion in
> 
>     https://github.com/linux-surface/surface-aggregator-module/issues/64
> 
> for more details.
> 
> There are a couple of standouts:
> 
> - Patch 1 ensures that we only handle commands actually intended for us.
>   It's possible that we receive messages not intended for us when we
>   enable debugging. I've kept it intentionally minimal to simplify
>   backporting. The rest of the series patch 9 focuses more on clarity
>   and documentation, which is probably too much to backport.
> 
> - Patch 8 touches on multiple subsystems. The intention is to enforce
>   proper usage and documentation of target IDs in the SSAM_SDEV() /
>   SSAM_VDEV() macros. As it directly touches those macros I
>   unfortunately can't split it up by subsystem.
> 
> - Patch 9 is a loosely connected cleanup for consistency.

Thank you for the patches. Unfortunately I don't have time atm to
review this.

And the next 2 weeks are the merge window, followed by 2 weeks
of christmas vacation.

So I'm afraid that I likely won't get around to reviewing
this until the week of January 9th.

> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> aggregator: Enforce use of target-ID enum in device ID macros") touches
> multiple subsystems, it should be possible to take the whole series
> through the pdx86 tree. The changes in other subsystems are fairly
> limited.

I agree that it will be best to take all of this upstream through the
pdx86 tree. Sebastian thank you for the ack for patch 8/9.

Jiri or Benjamin may we have your ack for merging patch 7/9 + 8/9
through the pdx86 tree ?

Regards,

Hans




> Maximilian Luz (9):
>   platform/surface: aggregator: Ignore command messages not intended for
>     us
>   platform/surface: aggregator: Improve documentation and handling of
>     message target and source IDs
>   platform/surface: aggregator: Add target and source IDs to command
>     trace events
>   platform/surface: aggregator_hub: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: aggregator_tabletsw: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: dtx: Use target-ID enum instead of hard-coding
>     values
>   HID: surface-hid: Use target-ID enum instead of hard-coding values
>   platform/surface: aggregator: Enforce use of target-ID enum in device
>     ID macros
>   platform/surface: aggregator_registry: Fix target-ID of base-hub
> 
>  .../driver-api/surface_aggregator/client.rst  |  4 +-
>  .../driver-api/surface_aggregator/ssh.rst     | 36 ++++-----
>  drivers/hid/surface-hid/surface_hid.c         |  2 +-
>  drivers/hid/surface-hid/surface_kbd.c         |  2 +-
>  .../platform/surface/aggregator/controller.c  | 12 +--
>  .../platform/surface/aggregator/ssh_msgb.h    |  4 +-
>  .../surface/aggregator/ssh_request_layer.c    | 15 ++++
>  drivers/platform/surface/aggregator/trace.h   | 73 +++++++++++++++++--
>  .../platform/surface/surface_aggregator_hub.c |  8 +-
>  .../surface/surface_aggregator_registry.c     |  2 +-
>  .../surface/surface_aggregator_tabletsw.c     | 10 +--
>  drivers/platform/surface/surface_dtx.c        | 20 ++---
>  .../surface/surface_platform_profile.c        |  2 +-
>  drivers/power/supply/surface_battery.c        |  4 +-
>  drivers/power/supply/surface_charger.c        |  2 +-
>  include/linux/surface_aggregator/controller.h |  4 +-
>  include/linux/surface_aggregator/device.h     | 50 ++++++-------
>  include/linux/surface_aggregator/serial_hub.h | 40 ++++++----
>  18 files changed, 191 insertions(+), 99 deletions(-)
> 

