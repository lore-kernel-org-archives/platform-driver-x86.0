Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF08C76196
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 17:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjCVRk5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjCVRk4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6211ABB
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679506808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q1IxHW5Bl/aeX6GiY6onFCTzhilEByIwhwFJS8HzHEk=;
        b=PyE0QWivnbgWB/m/9jwwownsgambNImXkmS0GcaD0XZNyAYhE59QU8AmxeWbx4CT7nqwX5
        cqd2Or+zBivSPBq9PU90dU7xCTLs2/B7iQfkTahcRy3iFNa+OQ89tzQ9oplLSPMWFXs7aJ
        Lm+GvomxyhByBB3U6FVn068IiR26Uqo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-US1SyXx8Pz6iudoqxoH1vQ-1; Wed, 22 Mar 2023 13:40:07 -0400
X-MC-Unique: US1SyXx8Pz6iudoqxoH1vQ-1
Received: by mail-ed1-f72.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so28575244edb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1IxHW5Bl/aeX6GiY6onFCTzhilEByIwhwFJS8HzHEk=;
        b=3P+idRnNjol2s6PQRlnwMl1Ni4mneqZXaIoafwKL7qdzWPeo1Jrvfgk0S8ESvisi2p
         zbyqfU99UvCyekdQGGQNvxwIujlht2YoIq1KDhVM+lXDYVIrhkNi9pujcmGj+gcAZU2K
         upiPL+BiWtNtJSOAsaawFxjr0Su3xlgTmZ70rboqWsi8p0dQt6jqTA6FgZBSTyhfBS5R
         ILcSY3zKr2mlBbXP/ajyC2grx9ecyI74MUw+vAWSk3bQlhRzEZIl1ROSvEb0P+B/FDMj
         aTR83gmeZ/Een4XWoBDFiQdcq0WbX3WPBOIL5jPobxe3UPKyYBXFiHzGxz5OIvg+Ij2d
         8s7w==
X-Gm-Message-State: AO0yUKUBDzb+yIvSUcjbpLYxO8MBSQSczpItSddTNT30bbAydHI6tMS/
        9LVrS9icjlS38Wj8VmYvhx0PR4FkgOPyi/6phBX25BHnaRL6EHSa3M1RSFlDRjt65RBWeh2wWQG
        gcz/+vZ6eAZBunOrDcgAGR50MR1GtT1iXnw==
X-Received: by 2002:a17:906:e95:b0:937:4001:6eda with SMTP id p21-20020a1709060e9500b0093740016edamr7974787ejf.38.1679506806074;
        Wed, 22 Mar 2023 10:40:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set/KRWGcMV00Lnp5HTo5pZKXaIDPobcH3haI4pEKStCH8MczPNvKCsZnFoDchwrVxewemwpFLA==
X-Received: by 2002:a17:906:e95:b0:937:4001:6eda with SMTP id p21-20020a1709060e9500b0093740016edamr7974772ejf.38.1679506805771;
        Wed, 22 Mar 2023 10:40:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ch19-20020a170906c2d300b00933d64cd447sm4850136ejb.121.2023.03.22.10.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:40:04 -0700 (PDT)
Message-ID: <c8c81a00-fb89-8c35-ac3f-951dc999e8e4@redhat.com>
Date:   Wed, 22 Mar 2023 18:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] Add WLED support to TPS68470 LED driver
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

On 3/22/23 17:09, Daniel Scally wrote:
> This series relies on the recent "leds: tps68470: LED driver for TPS68470" set
> from Kate Hsuan [1]
> 
> The TPS68470 provides two additional LED outputs on top of the indicator LEDs.
> Add support for those to the driver. The configuration of the chip is drawn from
> platform data which is expected to be passed to the driver. Additionally update
> the int3472-tps68470 driver to register led lookups from platform data so that
> the right LED is driven for each sensor, and finally define those lookups for
> the Microsoft Surface Go line.
> 
> Kate, Hans, this is the changes I made on top of the tps68470-led series to
> enable the IR LED on my Go2 (plus one additional patch to media). #5 could
> probably just be squashed into the other series though.

Ack for squashing 5 into Kate's patch.

> The last two patches
> cover how I think the LED lookup should work - I unfortunately can't see an
> automatic way to guarantee the right LED goes to the right sensor.

I did not get around to replying to your review of my lookup patch. I believe
adding this to the board-data as you have done here is fine.

I had a few small comments on your patches and I believe that Kate's patches
are ready for merging now.

So I believe that for the next version it would be best to merge the 2 series
into 1 big series. Putting all "leds: tps68470: ..." patches first. Then once
they are all reviewed Lee can merge the entire drivers/leds/ part of
the series and send me an IB branch to pull from before I merge
the drivers/platform/x86/intel/int3472/ parts.

Kate, is it ok with you if Daniel includes your patches (keeping you as
author of course) in the next version of this series ?

Regards,

Hans





> [1] https://lore.kernel.org/platform-driver-x86/20230321153718.1355511-1-hpa@redhat.com/T/
> 
> Daniel Scally (8):
>   platform/x86: int3472: Add platform data for LEDs
>   platform/x86: int3472: Init LED registers using platform data
>   platform/x86: int3472: Add TPS68470 LED Board Data
>   platform/x86: int3472: Add tps68470-led as clock consumer
>   leds: tps68470: Refactor tps68470_brightness_get()
>   leds: tps68470: Support the WLED driver
>   platform/x86: int3472: Support LED lookups in board data
>   platform/x86: int3472: Define LED lookup data for MS Surface Go
> 
>  drivers/leds/leds-tps68470.c                  | 170 +++++++++++++++++-
>  drivers/platform/x86/intel/int3472/tps68470.c |  31 +++-
>  drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
>  .../x86/intel/int3472/tps68470_board_data.c   |  31 ++++
>  include/linux/mfd/tps68470.h                  |  12 ++
>  include/linux/platform_data/tps68470.h        |  11 ++
>  6 files changed, 248 insertions(+), 17 deletions(-)
> 

