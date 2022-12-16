Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CD0C46467
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Dec 2022 12:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbiLPMDV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Dec 2022 07:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiLPMDO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Dec 2022 07:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF49646C
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 04:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671192145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n0onGUwho42Lk/2Xvrk5LwW7Uvmn5kP1MKjLYRvtQAc=;
        b=VyAIUvzMjcRT0q7b7QYjIaGusKc7Xp8XS2d6ISEvh1RMGPHLzLQcAsgdRbJrf59ULAhoTa
        ITCEdgpdI4U/U/P1fRzFmXu9bVeB2QM+JCmNHiMJj4/XOtZ30dZCA0EGnp96ZUgf6Re4Ii
        DY92LBM4heTi0ZN3oqPwUtrjj4tJhcA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-diNSmMo2ODOdxcZL4olL2w-1; Fri, 16 Dec 2022 07:02:22 -0500
X-MC-Unique: diNSmMo2ODOdxcZL4olL2w-1
Received: by mail-ej1-f69.google.com with SMTP id ne1-20020a1709077b8100b007c198bb8c0eso1672669ejc.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 04:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0onGUwho42Lk/2Xvrk5LwW7Uvmn5kP1MKjLYRvtQAc=;
        b=5552HUGh4HkOUnf3fyRbaI563Z8qpX+gNjNAOMBjw87oO44bWn4YIZ2EiufqUwaa3C
         AwmF7Oq+vBt1miteppRs4ZpRDrVpBNaYeO8BR/BuMQgKjKwlvJwWBSfM50kjq8atpsKA
         D11olStHUa6+udjlh3P3908WtV1EQBkn4iNRwVWLk11bONoIXkaEr9sqSxkoHuifRT5R
         mFinnhXVB7cLQIpU77j01lQ34OklnE8Fk8ECHZvLQhWwLHTa0k2jvqhmQ5uN/z0W0M78
         Dstvtp6aJxmQ5k2PephnCwO76fDSQ+OS2TbAFaILXgZnWcgj+VqlcF/uLIdoQ75Tcxjm
         z48g==
X-Gm-Message-State: ANoB5pkQ0Cn996uIqRBcmPQNcFV7sSoaBPXNHXpBijmR3EqjGzJqAEjS
        J98/Oq2yDJDZAlnyumCcjUGdVzMbbbreSdpKQXScRiR5ZYV173Wn+yCOkkxEzD0939B2mSTn0Sa
        Q0qd5eQapiixS9ES1OJnOlw6peoCWjVdsYg==
X-Received: by 2002:a05:6402:3987:b0:467:e9a5:77c4 with SMTP id fk7-20020a056402398700b00467e9a577c4mr27286759edb.14.1671192141124;
        Fri, 16 Dec 2022 04:02:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4xS5GY2N7ApHCruZzxYhR/KCijYVIin7KMr5Sjan0LxTro5Ol3BiPdKrXUHFjiH/21a3awSg==
X-Received: by 2002:a05:6402:3987:b0:467:e9a5:77c4 with SMTP id fk7-20020a056402398700b00467e9a577c4mr27286737edb.14.1671192140853;
        Fri, 16 Dec 2022 04:02:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cy28-20020a0564021c9c00b00463597d2c25sm784672edb.74.2022.12.16.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:02:20 -0800 (PST)
Message-ID: <6c5867ed-a78e-8919-b34f-560c0773727e@redhat.com>
Date:   Fri, 16 Dec 2022 13:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 00/11] leds: lookup-table support + int3472/media
 privacy LED support
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/22 12:30, Hans de Goede wrote:
> Hi All,
> 
> Here is my 3th attempt at adjusting the INT3472 code's handling of
> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
> (so that we cannot just tie the LED state to the clk-enable state).
> 
> Due to popular request by multiple people this new version now models
> the privacy LED as a LED class device. This requires being able to
> "tie" the LED class device to a specific camera sensor (some devices
> have multiple sensors + privacy-LEDs).
> 
> Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4
> is a bit of refactoring in preparation for patch 5 which adds
> generic (non devicetree specific) led_get() and devm_led_get() function
> (which will also work with devicetree) and lookup table support to
> allow platform code to add LED class-device <-> consumer-dev,function
> lookups for non devicetree platforms.
> 
> Patch 6 adds generic privacy-LED support to the v4l2-core/v4l2-subdev.c
> code automatically enabling the privacy-LED when s_stream(subdev, 1)
> is called. So that we don't need to privacy-LED code to all the
> camera sensor drivers separately (as requested by Sakari).
> 
> These are all new patches in version 3. Patches 7-11 are patches
> to the platform specific INT3472 code to register privacy-LED class
> devices + lookup table entries for privacy-LEDs described in
> the special INT3472 ACPI nodes found on x86 devices with MIPI
> cameras (+ prep work + some other INT3472 fixes).
> 
> Assuming the LED and media maintainers are happy with the approach
> suggested here (if you are please give your Ack / Reviewed-by) we
> need to talk about how to merge this since patches 6 and 7-11
> depend on the LED subsystem changes. I think it would be best if
> the LED subsystem can provide an immutable branch with patches 1-5
> (on top of 6.2-rc1 once it is out) and then the media folks and I
> can merge that branch and then apply the other patches on top.
> 
> This series has been tested on:
> 
> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
> - Dell Latitude 9420, IPU 6, front: ov01a1s with privacy LED
> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED
>                               back: ov8865 with privacy LED (pled not yet supported)
> 
> Regards,
> 
> Hans

p.s.

I have matching out of tree IPU6 driver changes here:

https://github.com/jwrdegoede/ipu6-drivers/commits/master

once this series has landed these changes will allow using
the out of tree IPU6 driver with an unmodified upstream kernel.

Regards,

Hans



