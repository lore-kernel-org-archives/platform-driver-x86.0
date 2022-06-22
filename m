Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57967C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 09:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbiFVJy5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238121AbiFVJyx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 05:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 355C73A1A3
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655891691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jofTkgsnDKNrdl+quQ8vd9teh2p/+pfuwaKR/nt++vc=;
        b=GJKaRlkTHzMHOzQG84eF6s7Nm+x2f6z0hgOYv1vcfuHkJ1OfeTjNx6lDNKu/49LIwmLq/l
        pROElOXV//rNBL2N8X72D/rGt6JuRWAcadWI/tjo4ZeO6EMtx26/VDyhvPOUo4ht0s0ukA
        pE2ORmVPusEnSBiaChwe6keSF4j6hW0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-vpGOPTHXPPiJ04N9FUMwww-1; Wed, 22 Jun 2022 05:54:49 -0400
X-MC-Unique: vpGOPTHXPPiJ04N9FUMwww-1
Received: by mail-ed1-f70.google.com with SMTP id x8-20020a056402414800b0042d8498f50aso12962382eda.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jofTkgsnDKNrdl+quQ8vd9teh2p/+pfuwaKR/nt++vc=;
        b=1yhUPlMtcNL0C5FuxlNKfsvOdhiuzE5VcfxO0AartfeCr7TgrQKSZMpk6WXcVGoWf+
         y4CHLAn8gbK92Ve+KaiF/7DBL4CtPO6dyi+Y++wUTm1NrZSZ9m6fGpoEETyxmV91AyI0
         IegpeKFb2QUNfSbGW475EpDUNHhvQLEY//+qyIzJg9MbMw+7esf8v94xqRl9RDXqaa/y
         q9GJA0YwWlw/qisloWIEvvmM/eD71sXwb7v454enkoHd52rjjOcOwF6zm0B8R3wsQSun
         51SNYkH6A/1bcoOE1BTmZZhB7ylWiIToLvHzfO/AUHKUKT1XIV+wCb5dyyuAEPc+RDz0
         5pWA==
X-Gm-Message-State: AJIora+DdmpAhZXxwMWFr1jWudQtaYmMQLe78M1Q/ooqhj0+A/18dXfu
        o02gzabzJNEkGaFDXb8/XuMrvJFTPQzOe4U/9isBWj2XjZc+KGfmLRGHjVqm0nY7Md0czxqhqqx
        iq1w8bhxQitIv9sqoS/KsD7VOOmK7wdM7SQ==
X-Received: by 2002:a17:907:da0:b0:722:c42e:25b9 with SMTP id go32-20020a1709070da000b00722c42e25b9mr2321408ejc.260.1655891688014;
        Wed, 22 Jun 2022 02:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqUcAdFloVOxwEZT3h6eNGJ+n/ggRPrXVY/n1VnJSSfARWPvCeaXSDNBsmHzLluCEPyIY4WQ==
X-Received: by 2002:a17:907:da0:b0:722:c42e:25b9 with SMTP id go32-20020a1709070da000b00722c42e25b9mr2321390ejc.260.1655891687793;
        Wed, 22 Jun 2022 02:54:47 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906315b00b0071d3b6ed4eesm7797779eje.160.2022.06.22.02.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:54:47 -0700 (PDT)
Message-ID: <63a191ba-4949-04ad-4c73-03e577933745@redhat.com>
Date:   Wed, 22 Jun 2022 11:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/4] platform/x86: Use backlight helpers
Content-Language: en-US
To:     Stephen Kitt <steve@sk2.org>, "Lee, Chun-Yi" <jlee@suse.com>,
        Mark Gross <markgross@kernel.org>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220607184635.1127913-1-steve@sk2.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220607184635.1127913-1-steve@sk2.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/7/22 20:46, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> This will ultimately allow fb_blank to be removed.
> 
> Stephen Kitt (4):
>   platform/x86: acer-wmi: Use backlight helper
>   platform/x86: apple-gmux: Use backlight helper
>   platform/x86: compal-laptop: Use backlight helper
>   platform/x86: thinkpad_acpi: Use backlight helper
> 
>  drivers/platform/x86/acer-wmi.c      | 7 +------
>  drivers/platform/x86/apple-gmux.c    | 5 +----
>  drivers/platform/x86/compal-laptop.c | 4 +---
>  drivers/platform/x86/thinkpad_acpi.c | 5 +----
>  4 files changed, 4 insertions(+), 17 deletions(-)

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


