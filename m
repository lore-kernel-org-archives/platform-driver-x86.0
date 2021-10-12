Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9B8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 11:38:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B12661074
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 11:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhJLLkx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Oct 2021 07:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57753 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232704AbhJLLkx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Oct 2021 07:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634038731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Nl/+A4Eub4jx5GfBfHcePWbpY3pULNv6/kjI9O2GIw=;
        b=BKGeY46e05iPkxBANaTiH4frE/x9YDrjEirHHG68wJVTQUcMnjvJtMBSC1T1+vIU7kxWWs
        JnoM6mhKZ/lH8MPy9VavWPBROM0PgD+E3dcpFJiYQ7i8CG09tgkUZ8PDwRJ9NevLwmueIV
        fuM+s7Aui3ov6VL550Uo/Dh75D94n6k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-eOL8tO6gNJ-SdR30V2orrA-1; Tue, 12 Oct 2021 07:38:50 -0400
X-MC-Unique: eOL8tO6gNJ-SdR30V2orrA-1
Received: by mail-ed1-f70.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so18636319edl.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Oct 2021 04:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Nl/+A4Eub4jx5GfBfHcePWbpY3pULNv6/kjI9O2GIw=;
        b=bKiJPM4erYS4jF4Gcjb4gScC6lykeNBAOAHO6oeC4eobl6PFRT+xzAUQYSaWifNzvB
         hDcA3TfbH0gATLMrxT2ZmgnX33bC0pNNpdh8zTze0ydPXt9wqBzIqwJCv5RcM4xlH758
         A7l16WWtbEhk1+Gtpa2GEJwRDV3WfZ/z9tT1agWIcQwVvTlKZxoPsHhg9p4dvA5Ore1Q
         ucZB8bNnQNIGdGZeeBUWNnf10T2uxrG2d3i8HQIQ3PwfdVrInwKrk+6Alt2UzN/Aj7VM
         wq1OTGnGBmxJjGPL1F4/zZHQwUmfyt4q0I3BNLve07NO6zZa7R0HK6pI+d+bqI7xhLsL
         nOaw==
X-Gm-Message-State: AOAM533HeNkXZQQe2IV1zVVAAF7Vc/zpbR7S6C5msujFlPhp382URQsR
        R9AUmdPrwjJrb6aDmtqNpHjkgmpnve2R3HyTxxxYrLKUkhPgmUoDHCj6M3Lj9Vj2ok+3pXM5BVP
        o6z8p6wKT3zB6RHdz5cmAfqs8Sx3Ih+TQDQ==
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr32494502ejc.77.1634038729303;
        Tue, 12 Oct 2021 04:38:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm5JCGjMzSAQGRkUCOkFFa9vprxqd0iwZduBHPlKCOGfd4svnNnbnIox74SMXhbdztUkAO3g==
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr32494477ejc.77.1634038729102;
        Tue, 12 Oct 2021 04:38:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b22sm5749161edj.83.2021.10.12.04.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 04:38:48 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Correct null check
To:     Daniel Scally <djrscally@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211008224608.415949-1-djrscally@gmail.com>
 <e78eec7e-301e-8686-7768-7e62c713afdd@redhat.com>
 <CAHp75VeRe7-CDC9PNxfa+j0JYM8OQVKUsZ=1bBDymH0ruB3szQ@mail.gmail.com>
 <7e2e9bf7-5944-f948-4847-ec93d740c357@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8f18f019-8c19-ec88-211d-f2c99b911118@redhat.com>
Date:   Tue, 12 Oct 2021 13:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e2e9bf7-5944-f948-4847-ec93d740c357@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/12/21 12:24 AM, Daniel Scally wrote:
> Hi Hans, Andy
> 
> On 11/10/2021 20:29, Andy Shevchenko wrote:
>>
>>
>> On Monday, October 11, 2021, Hans de Goede <hdegoede@redhat.com
>> <mailto:hdegoede@redhat.com>> wrote:
>>
>>     Hi,
>>
>>     On 10/9/21 12:46 AM, Daniel Scally wrote:
>>     > The int3472-discrete driver can enter an error path after
>>     initialising
>>     > int3472->clock.ena_gpio, but before it has registered the clock.
>>     This will
>>     > cause a NULL pointer dereference, because clkdev_drop() is not
>>     null aware.
>>     > Instead of guarding the call to skl_int3472_unregister_clock()
>>     by checking
>>     > for .ena_gpio, check specifically for the presence of the
>>     clk_lookup, which
>>     > will guarantee clkdev_create() has already been called.
>>     >
>>     > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=214453
>>     <https://bugzilla.kernel.org/show_bug.cgi?id=214453>
>>
>>
>>
>> Is it possible to fix this to be BugLink?
> 
> 
> I also forgot to CC stable: my bad. I think there's a bot that picks up
> things with a Fixes: tag if you do that right?

Right, with a Fixes tag there is no strict need for a Cc: stable
(adding Cc: stable is still a good idea for pure fixes though).

Regards,

Hans


> 
>>
>>  
>>
>>     > Fixes: 7540599a5ef1 ("platform/x86: intel_skl_int3472: Provide
>>     skl_int3472_unregister_clock()")
>>     > Signed-off-by: Daniel Scally <djrscally@gmail.com
>>     <mailto:djrscally@gmail.com>>
>>
>>     Thank you for your patch, I've applied this patch to my review-hans
>>     branch:
>>     https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>     <https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans>
>>
>>     Note it will show up in my review-hans branch once I've pushed my
>>     local branch there, which might take a while.
>>
>>     Once I've run some tests on this branch the patches there will be
>>     added to the platform-drivers-x86/for-next branch and eventually
>>     will be included in the pdx86 pull-request to Linus for the next
>>     merge-window.
>>
>>     I will also include this in my upcoming pdx86-fixes pull-req for
>>     5.15 .
>>
>>     Regards,
>>
>>     Hans
>>
>>
>>     > ---
>>     >  drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>>     | 2 +-
>>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>>     >
>>     > diff --git
>>     a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>>     b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>>     > index 9fe0a2527e1c..e59d79c7e82f 100644
>>     > ---
>>     a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>>     > +++
>>     b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>>     > @@ -401,7 +401,7 @@ int skl_int3472_discrete_remove(struct
>>     platform_device *pdev)
>>     > 
>>     >       gpiod_remove_lookup_table(&int3472->gpios);
>>     > 
>>     > -     if (int3472->clock.ena_gpio)
>>     > +     if (int3472->clock.cl <http://clock.cl>)
>>     >               skl_int3472_unregister_clock(int3472);
>>     > 
>>     >       gpiod_put(int3472->clock.ena_gpio);
>>     >
>>
>>
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> 

