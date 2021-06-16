Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4D1C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 425F061159
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhFPQIa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 12:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhFPQIa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 12:08:30 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E09C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:06:22 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c18so3142604qkc.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=rYrKf5UxPvtC0Wy30TzccK1PJkLxHtCK05XdQWSnDOI=;
        b=CE15aTl97LuUSmkx9yU+dYWNcyuD+qnLmFHHcbA5+V/0htxeW1oRRyz8v4YPwhRJ3U
         lk/wT2r1amNWuxQS1iWC6zgfCdPt84HEDj+tbzAAeZod/nTKueIRpMO3zlg6FFZEo5fz
         z20T0LFKIHegxKfYPbWLDgBRuSe1wvUKnWBCCZtQCH/WZhndGMrOH07Lp6uQr/e2DmGX
         8XzwntJFgP0xo0po90u5GG+2wxJ2SmgZ6m1sxdBtsHVXMdeMAZ5hiwYI1jRpmZtUbbtr
         8YyHGXJTp01RmffJ+XBXLerSzrtCcxjSnZg+cnBYyAaXIwvTLEe7L7ArvIseDBVm1Fmi
         MJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rYrKf5UxPvtC0Wy30TzccK1PJkLxHtCK05XdQWSnDOI=;
        b=opn32skpmnfTjCFB8U2//yYo1qTQS630HVuv/GMXFg6kU6WNXKpMrWlmHndqYvheCl
         12RmjsmITkNkjmHWr6fYw/4vzsHjcs2hSsLCEdIJcG6yo8CYB7JTgRtJtWfZf2fCsd0s
         FHGi0lAXNgEzzobPeCGQzj1eoW5dc02yKGEpU0eIg4tqMhwMMqJlJ8pSAYZv/6MHfePo
         wMNfLdC8nLRNfKfjLA6OJZia0AKR9P5fYzUKnB5muqQbefmn1c9/RhR7PpWGs2BEISnm
         rSF3SNkwBCuHjAvtllG7JrS3/Vyami0BF2BywJZaFlTRlTUeWVoLRizKXK5NBKK4hB0v
         /HdA==
X-Gm-Message-State: AOAM533EY/l0xvPUhtWnbPFE5RNTP9yxRIqBrdK0z3WqTojBvMTKFYyJ
        Ne+MkfKUWXLhScFHnFP5sAAiu/5xuUgeQiLfXY4Mww==
X-Google-Smtp-Source: ABdhPJwmRkgvhlZtgvDz3u6GsBQbv/HIRJytyJbe6BF3tGiwfLtUafasLCtU68K+e/kMz3SCWYCLFA==
X-Received: by 2002:a37:9f56:: with SMTP id i83mr754967qke.467.1623859582015;
        Wed, 16 Jun 2021 09:06:22 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id q2sm1846162qkc.77.2021.06.16.09.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:06:21 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <1eb70fdd-03d8-153e-e218-6f3de47c7610@metux.net>
From:   leo60228 <leo@60228.dev>
Message-ID: <9f70238c-baa8-9335-5003-66b9e745e749@60228.dev>
Date:   Wed, 16 Jun 2021 12:06:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1eb70fdd-03d8-153e-e218-6f3de47c7610@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> have you checked whether these LEDs are behind a GPIO controller 
> (possibly in the SoC itself), that's potentially used for other things,
> too ?

They seem to be connected to the embedded controller 
(\_SB.PCI0.LPC0.EC0.GGSI). I'm having trouble finding documentation on 
that, though.

> I've haven't got a data sheet for the i9-11900 yet, but I'm quite sure
> it does have gpios and suspect they're used for those things, as well
> as extra keys, etc. This is a usual approach for such mainboards.

There's several models of this laptop. Mine has a Ryzen 2700.

> Oh, and have you checked whether there're also some gpio definitions
> in the acpi tables ? It's relatively new but some vendors already using
> it.

There's one, but that's it. I'd expect more than one pin to be necessary 
here.
