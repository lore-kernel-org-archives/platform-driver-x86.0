Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDEC77B7D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 14 May 2023 20:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbjENUW1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 14 May 2023 16:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbjENUWZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 14 May 2023 16:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC161B6
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684095703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c1tAC8MrLbkSD9UVPWiYzK6fj9aylD3GhGT6+jdvsKI=;
        b=bLNZgyOWhWQ4bzsVFd4KT7fO7xNvsZbUJOsN0PuDnS+gCmuLOa5K8G2+vDtByv6i4qIfVc
        VPdDoFClsHk3AhnRpLzeZ92QNIIES7S8JAzIixZZIeM2PdB5ufZUedgvRemG63i2BELQn+
        xBlzV/xHDH57PvQ7lXdGGefWGBVc30w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-4rUu5J78OEqaxbQVTrGjdw-1; Sun, 14 May 2023 16:21:41 -0400
X-MC-Unique: 4rUu5J78OEqaxbQVTrGjdw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a341efd9aso1486166266b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 13:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684095700; x=1686687700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1tAC8MrLbkSD9UVPWiYzK6fj9aylD3GhGT6+jdvsKI=;
        b=fzWHgY67Ghkh01dqFl1guzbMsf8/fh6MGXeg+V8c2hgqmlglNbKUBGjf5qFMrZPH9a
         fx5/3ONn9CeWSR1kfFmAQR6y0nnrTEnDntCtRSbUY7EosKMxvUqXuWR2WNEOGix4nOm+
         UkdSn/n61f+YpJyNM5uCwo4PwAM0NHCpoBa4RYFxBcbt7gxv3jxtvXIBSDD2MbWg07ro
         J4YcvJG9zEKudkFmUQXRujzz8V59I9BxvbCZn9tuZbm7lU5Ros5CzJnFKnR77jnxaNGf
         D2pm4ywphjtL4MkeC6Qw86DbhO9Cj6LyuaX+FQlVwKaIATpKAk4YBPGFJdFotupqhOM5
         nhMg==
X-Gm-Message-State: AC+VfDzi+tKVDySlN3qJVHouuKBkgzcZkJCXJLPcPH0EH4ngXSZbLKWK
        PEX8wz0imEvno/xv72C7WmSDLj9LR0n1CpKd2Zji7V6BtTXwtPhs/4mtAjYYnVdAii+9KXW1Mbj
        8y4+xL/w5S8k9F0ct6faygxkG0F4HlquQbByvFta71A==
X-Received: by 2002:a17:907:9444:b0:969:e304:7a22 with SMTP id dl4-20020a170907944400b00969e3047a22mr18377130ejc.18.1684095700408;
        Sun, 14 May 2023 13:21:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZObfspH4sKNLtf9/QPLqcX34mz9nMa9vg+VBtS3wSkEN7xRGjSLO74RXlp3y46c6bNe2RSg==
X-Received: by 2002:a17:907:9444:b0:969:e304:7a22 with SMTP id dl4-20020a170907944400b00969e3047a22mr18377118ejc.18.1684095700154;
        Sun, 14 May 2023 13:21:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm8534633ejc.159.2023.05.14.13.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 13:21:39 -0700 (PDT)
Message-ID: <eca4b75a-3a1d-1039-1f5d-b974a920745d@redhat.com>
Date:   Sun, 14 May 2023 22:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] x86-android-tablets: convert to using GPIO references
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230512001815.591817-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230512001815.591817-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dmitry,

On 5/12/23 02:18, Dmitry Torokhov wrote:
> Hi Hans,
> 
> This series came about because now software nodes can be used to
> describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
> eventually get rid of gpio_keys_platform_data structure.
> 
> So while I was doing the conversions from GPIO_LOOKUP() tables for
> gpio_keys devices I decided to convert the rest of them as well. Maybe
> some time in the future we can drop support for GPIO_LOOKUP() and rely
> on device properties exclusively.
> 
> This is completely untested.

Thank you for your work on this. I have hw to test this.

But it seems that you have based this on an older tree,
in 6.4-rc1 the x86-android-tablets code has been split
over multiple files in their own subdir because it was
becoming unyielding.

Can you please rebase this on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

?

Regards,

Hans





> Dmitry Torokhov (4):
>   platform/x86: x86-android-tablets: convert Goodix devices to GPIO references
>   platform/x86: x86-android-tablets: convert int3496 devices to GPIO references
>   platform/x86: x86-android-tablets: convert wm1502 devices to GPIO references
>   platform/x86: x86-android-tablets: convert gpio_keys devices to GPIO references
> 
>  drivers/platform/x86/x86-android-tablets.c | 355 ++++++++++++---------
>  1 file changed, 201 insertions(+), 154 deletions(-)
> 

