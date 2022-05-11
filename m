Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AD3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 15:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344189AbiEKP5a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 11:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242624AbiEKP52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 11:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78BA02D1EC
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652284645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rqqc34Z12XbJJIz/Zvc0IwP6r5N7BbjbaqgG4HSdh7k=;
        b=FAk695XQGTX/Q1TClng8RYVXu4axwHgyEUes5jHf4GlypVUJ3kRQ4h5vKfeCIgCIeceS72
        417Q/O7TtkYdYr6BQFnzrwIHm9OeYk+m/TF0VR5yE7ihkGE5Cqf7OwgZJsW9fmyx3zhLRT
        XhdtYN4a1FnfKCLYCFnC4veWZqiaaXs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Culxr2VROfGRIARB8TXT0w-1; Wed, 11 May 2022 11:57:24 -0400
X-MC-Unique: Culxr2VROfGRIARB8TXT0w-1
Received: by mail-ed1-f70.google.com with SMTP id cz24-20020a0564021cb800b00425dfdd7768so1601952edb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rqqc34Z12XbJJIz/Zvc0IwP6r5N7BbjbaqgG4HSdh7k=;
        b=7R4y9P76v3zpvO//0ogsXf+dYwnjlPuf0Bet6RpT4UL2TMQooIT+2sGBZoLkeJdPQo
         hKVgKWR3vbb4a9mGkhP9KV7C0yfkBlhUH1LTi5CeSwI9qJTqM8vj+DQK3fnR0785dAvu
         v+MwSgwnCZINunS4iNmkXKkRGxGrcwvU2i7q7mDFxf9FrXjr54akdcS3ZQWI+rlp+QNA
         oT3tNkHgid6jesSaTGnmucvLdqggID/8Cxq/UiY9qUJz0EEKMBEoj/OO10s7Ic7A48DG
         n/0pUAchnNPSWXX0/Eh4PO4xT4o0Xyw9EroMzUVWowDV5cws4B6jD2M9yhAcez+M7MTl
         lmbA==
X-Gm-Message-State: AOAM530nDQMxyWuimdmTX7q28QJc99ESpUrioNVtR1BuG7PQrLm30tO+
        K1tyLIcbWMiOldusCW0aOb6rB0quYi593jcmBucY44nvS8ppIx1mw1ltWMMYHuRnIDwSFVXcG7H
        q//bcyJrDWJ15pzQOAaOzo+LcZKlnPRKz6g==
X-Received: by 2002:a05:6402:b2e:b0:425:d3f7:4c1a with SMTP id bo14-20020a0564020b2e00b00425d3f74c1amr28935631edb.366.1652284642977;
        Wed, 11 May 2022 08:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRbpFCIoEbs6lAXwSQ0w4+SiuTEAcPtKT2FDBsVCmZHWf8UMOCBEHw0GMuMnik5nhGmW2PNw==
X-Received: by 2002:a05:6402:b2e:b0:425:d3f7:4c1a with SMTP id bo14-20020a0564020b2e00b00425d3f74c1amr28935613edb.366.1652284642795;
        Wed, 11 May 2022 08:57:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e15-20020a056402104f00b0042a2d27619fsm284362edu.26.2022.05.11.08.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 08:57:22 -0700 (PDT)
Message-ID: <61120220-6b59-7000-f59d-d4750d5e4405@redhat.com>
Date:   Wed, 11 May 2022 17:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Add support for Z490 AORUS ELITE AC and X570 AORUS ELITE
 WIFI
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        platform-driver-x86@vger.kernel.org
References: <20220510120012.2167591-1-frank@crawford.emu.id.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220510120012.2167591-1-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/10/22 14:00, Frank Crawford wrote:
> Tested on my systems with module force_load option.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

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
>  drivers/platform/x86/gigabyte-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 658bab4b7964..730b3f6f942f 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -149,7 +149,9 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z490 AORUS ELITE AC"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE WIFI"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),

