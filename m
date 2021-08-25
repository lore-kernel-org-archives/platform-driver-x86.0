Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0B9C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 20:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 616F2610A3
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 20:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242629AbhHYU0b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 16:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56258 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242612AbhHYU0S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 16:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629923128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6zNUiQGn5/77p6LvmL6DAhiuUVse8hl9fSBgfRaJVaw=;
        b=BXwHhJ8TaK9OGZkLfA7UulnmBzhEZF+FPakaTp65fxVl5KuXKelItU33spcBUsCovNndNB
        tSandaS7Pw+pPz034ZWV6QF9qVxR3GC+Jl//eNo3yFrXH8GmvUsu1ZNkVUb4zVoM1gbL/k
        0OW4+qBEw8I7tIHw2s3bInZyhR1G92g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-JG4psbBGPeiIpMkhMGAybQ-1; Wed, 25 Aug 2021 16:25:26 -0400
X-MC-Unique: JG4psbBGPeiIpMkhMGAybQ-1
Received: by mail-ed1-f72.google.com with SMTP id b16-20020a0564022790b02903be6352006cso300930ede.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 13:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6zNUiQGn5/77p6LvmL6DAhiuUVse8hl9fSBgfRaJVaw=;
        b=AVGPXsKfng3C4pKwNmlHqfJ/wIrN61HLACIf5B2B/9jhBRKtg+9rtZ9ZF6y/SGgSuQ
         J4GX1NXhxIxifQqAkFX/0GTT5IqnkrrJDASDCoGBwdIFwoKEoMdRhsraPOWeEdQHVTOi
         81LjoXPdkrOP7JvRr4NcG7C92rywjI5F81HtVkfOoLymXEb99wqacvXoghL+qf2U+Nqu
         YmNdjf1ELh7X/d/rh26Gild2R6ZUnGeYFh5Fuzs26m1Jji474fwjTZk2hzFQtjXhlCY3
         McSWor5Bl7TQOByj6OCFuM/NV8cHaLWzxxq6te0LKrW3zr02rdJI//tAuoibRwJuEZqq
         UZkQ==
X-Gm-Message-State: AOAM532yc0vpExu978la0iqzxi+niYaqefzMbGdA4FwScOVhjmxTGC4Z
        gLnQwmEPvgHG9kk3jdo/GjA1gCMKHSKf6NtivX2CKlA1RgsDd5X2aTNzo3bl1hopasK6//3VUKJ
        O0vtMh3s6fZInkO/H7E21EQ7IvfGdh1dkQQ==
X-Received: by 2002:a17:906:f8c4:: with SMTP id lh4mr461064ejb.542.1629923125010;
        Wed, 25 Aug 2021 13:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrNx+MbPexwZAKriAYyfKlonK8x3dvBhuMJwQxYY8+HBLEmluuC24hh98UUEmWC1FYEXm7tQ==
X-Received: by 2002:a17:906:f8c4:: with SMTP id lh4mr461038ejb.542.1629923124777;
        Wed, 25 Aug 2021 13:25:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n18sm297027ejg.36.2021.08.25.13.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 13:25:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/3] regulator: core: Add regulator_lookup_list
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20210824230620.1003828-1-djrscally@gmail.com>
 <20210824230620.1003828-2-djrscally@gmail.com>
 <20210825103301.GC5186@sirena.org.uk>
 <cc65098e-b459-b20a-f6e2-ee521fc20ca7@redhat.com>
 <20210825152735.GJ5186@sirena.org.uk>
 <YSZk5tyAxZoosXS3@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5421695-803a-52fd-ea2e-edd9ef548892@redhat.com>
Date:   Wed, 25 Aug 2021 22:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSZk5tyAxZoosXS3@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/21 5:42 PM, Laurent Pinchart wrote:
> On Wed, Aug 25, 2021 at 04:27:35PM +0100, Mark Brown wrote:
>> On Wed, Aug 25, 2021 at 04:48:15PM +0200, Hans de Goede wrote:
>>
>>> Daniel, I believe that what Mark wants here is something similar to what
>>> we already do for the 5v boost converter regulator in the TI bq24190 charger
>>> chip used on some Cherry Trail devices.
>>
>> Yeah, that or something like a generalized version of it which lets a
>> separate quirk file like they seem to have register the data to insert -
>> I'd be happy enough with the simple thing too given that it's not
>> visible to anything, or with DMI quirks in the regulator driver too for
>> that matter if it's just one or two platforms but there do seem to be
>> rather a lot of these platforms which need quirks.
> 
> Let's also remember that we have to handle not just regulators, but also
> GPIOs and clocks. And I'm pretty sure there will be more. We could have
> a mechanism specific to the tps68470 driver to pass platform data from
> the board file to the driver, and replicate that mechanism in different
> drivers (for other regulators, clocks and GPIOs), but I really would
> like to avoid splitting the DMI-conditioned platform data in those
> drivers directly. I'd like to store all the init data for a given
> platform in a single "board" file.

I agree, but so far all the handling for clks/gpios for IPU3 (+ IPU4 (*))
laptops is done in the drivers/platform/x86/intel/int3472 code and the
passing of platform_data with regulator init-data would also happen in
the mfd-cell instantiation code living there. IOW if we just go with
that then we will already have everything in one place. At least
for the IPU3 case.

Regards,

Hans



*) IPU4 also used the INT3472 ACPI devices and what we have for discrete
IO devices seems to match.

