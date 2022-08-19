Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1170DC25B0E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 09:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348140AbiHSJVE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 05:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348120AbiHSJVD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 05:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8CBE588D
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660900860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1IbbuZ/sOEyv7Ff85tiaeE6QSXFpWukZ2njJ70+6dh0=;
        b=KBFQ6TF7bosHmWjdEfZL+Advxk190j+7fJokdvcEKAYqZp7sD0C4aMJErRWo9fnW9rFqmM
        34kX+7DLLM7NePvkDA85TYCvNoEGQcj2MOZDa5I8YBDnmbs0kZ5vt5kyc6Myrg3VxN+2MU
        /sL96OKoNQ7L00EFWez6Ed+XslmNYG8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-xrk8um7HP7qfpGGVBZ45Cg-1; Fri, 19 Aug 2022 05:20:51 -0400
X-MC-Unique: xrk8um7HP7qfpGGVBZ45Cg-1
Received: by mail-ej1-f71.google.com with SMTP id qb27-20020a1709077e9b00b0073160a55fd7so1306625ejc.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 02:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1IbbuZ/sOEyv7Ff85tiaeE6QSXFpWukZ2njJ70+6dh0=;
        b=36S9gJkiqjfb46cFlVPmTGFoYvb9LauBvTxNRlnAPoxFnkKJiUONE30Xq8wfIg2/zN
         Sm842P8+i/pyf/jJTXmCUjiOV8Qhmb5SpXjWsPLSW2fFL9s7dTaI+pXHOCQKRZp5/afU
         6dJ1HppLwQDlIX3OAJMVbFilgzgBA843M+dIXmf5sNNt92SZtQoKY6yNL54TVTFHoSOt
         M3R90v9InDeiDogAZtqQ0WL7U/r8GPAZ0SuzzY/BQurEmM8EzT/6EZ4TZfuQTeSveXhc
         DmpTWoEmVFKgXsewLycNnui2z67YM5IdgCSAFP4UIHKudv0PGSpYjpSmDj+C9KgiuWVp
         8kew==
X-Gm-Message-State: ACgBeo2dnZuwp6l5p7iAk42BNfBLMIHXEDpBAddUcIESP1XFNPiMn+0Q
        lAGGxMQmtj0YT8xLLGoNqKMS629tcPxRhC1fa3bnmWEnvWRSTnGVaHfgV8v+WtcJmxGV3eZHo2Y
        AMeUFUalEAWiaW++MH6kFb2QpsGYScI+G7g==
X-Received: by 2002:a17:907:168d:b0:731:67eb:b608 with SMTP id hc13-20020a170907168d00b0073167ebb608mr4173252ejc.518.1660900850406;
        Fri, 19 Aug 2022 02:20:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5W4/lZxNZ8ZjUFgSfxvralXr9HHWlIfklNUN8lChAnSN0KD0mbBjxMaqIPfftrDrw7U1CAVg==
X-Received: by 2002:a17:907:168d:b0:731:67eb:b608 with SMTP id hc13-20020a170907168d00b0073167ebb608mr4173245ejc.518.1660900850273;
        Fri, 19 Aug 2022 02:20:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7c0cf000000b0043bbc9503ddsm2736545edp.76.2022.08.19.02.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:20:49 -0700 (PDT)
Message-ID: <9c6f4ac0-1e71-6b91-ae03-0795cd551c46@redhat.com>
Date:   Fri, 19 Aug 2022 11:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform: move from strlcpy with unused retval to strscpy
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>
References: <20220818210058.7229-1-wsa+renesas@sang-engineering.com>
 <CAHp75VeM2q7wdnREoenyYpJ-tso2G6M-uyGFJGjPGL8hfUmzhQ@mail.gmail.com>
 <Yv9VhdVXqXhONj41@shikoro>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yv9VhdVXqXhONj41@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/22 11:19, Wolfram Sang wrote:
> 
>> I assume you are experimenting with coccinelle, so I have no objection
>> to the change, but in PDx86 we usually want to have one patch per
>> driver. Can you split?
> 
> I can split if you want.
> 
> I intentionally did group per subsystem, otherwise I would have sent out
> 1200+ patches. So, I chose to do it on subsystem level first and adapt
> later where this scheme does not fit.

See my reply to Andy, there is no need to split this further IMHO,
as you sat 1200 patches would be a bit much.

I will merge this as is during my next round of merges.

Regards,

Hans

