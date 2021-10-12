Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1746C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 11:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DE4961076
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 11:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhJLLkE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Oct 2021 07:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236268AbhJLLkD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Oct 2021 07:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634038681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cStgcmC9lagGnjkSE7k8BXOvNLIELC5bIXkkyOvaUUk=;
        b=LfwK55VPZa+x3ValDVjFFHTq2UQjAXUdUjPGQGRw7j9sD3fQXPUDXWlr1x3tMAORczb4ZC
        A2W0iSPyKJTGOIzgTdOfl8PO2SVzwB2X6PR5WtcghJ5QU/wCCDf+7OFIm9/yTp4rC3fYL4
        zQHKxMwJV7YTcILq79X6mh295dosQrM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-V8fnPW5IPSSlqtCC69pbLg-1; Tue, 12 Oct 2021 07:38:00 -0400
X-MC-Unique: V8fnPW5IPSSlqtCC69pbLg-1
Received: by mail-ed1-f69.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso18585271edj.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Oct 2021 04:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cStgcmC9lagGnjkSE7k8BXOvNLIELC5bIXkkyOvaUUk=;
        b=jyr4zlLBnuVwMM9mTS3oS7lRoCbhQIgSZoQApCSmlcgthXVruJ6MwWtRLwnpcLrgb3
         vTqg876yD6v950gFKliRyttPOpzbOfZJlwgv4AmbIgwwgv2oKg9JKmOR1mFWCiqeCZi/
         c6wf6l/PrUtgVxdFlgt0+Vnpnc5XCWUcyC0bZ57vkAKPggaFsekWe47GMmsCINwM0R8q
         MdI22yoEH3CVsVBrNaBNNgVhJ6fVeZGxhMzYeWn+a9XtEhmSj+h3II6GeEMp7KadXty5
         Gz1Nqvbbza9/h2qio8MfveTrgdwFifKX6my+G2Sg2aq5OHnuukcijazGQvWzPMmqPPp1
         uDpw==
X-Gm-Message-State: AOAM532t9bYhbr1UaynbV+ffcTnRjGly3VXCsilJ6BRVNKYCvg9bK4nt
        Qsk8HAc0ewybbf60uqpMJFLtyqbbsvScCNaOVnY0clVZzzmEKsMoH1JHNSLpNYUXep8R6dyRARn
        wSuwrNU/DKuTRjPz2hnFvVyNgemOScPcVkA==
X-Received: by 2002:a05:6402:34d1:: with SMTP id w17mr24547902edc.383.1634038679230;
        Tue, 12 Oct 2021 04:37:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxJSlaxW0xXIUCWTZGUNsH/tnr3AcakBMV9K0k/EhsneT9wh+7hZfs55k5nq6TKuPqfiEWzA==
X-Received: by 2002:a05:6402:34d1:: with SMTP id w17mr24547872edc.383.1634038679025;
        Tue, 12 Oct 2021 04:37:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nb29sm1037040ejc.54.2021.10.12.04.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 04:37:58 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Correct null check
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211008224608.415949-1-djrscally@gmail.com>
 <e78eec7e-301e-8686-7768-7e62c713afdd@redhat.com>
 <CAHp75VeRe7-CDC9PNxfa+j0JYM8OQVKUsZ=1bBDymH0ruB3szQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <44b413ba-7f9e-be99-5f5e-d923f1459849@redhat.com>
Date:   Tue, 12 Oct 2021 13:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeRe7-CDC9PNxfa+j0JYM8OQVKUsZ=1bBDymH0ruB3szQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/11/21 9:29 PM, Andy Shevchenko wrote:
> 
> 
> On Monday, October 11, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi,
> 
>     On 10/9/21 12:46 AM, Daniel Scally wrote:
>     > The int3472-discrete driver can enter an error path after initialising
>     > int3472->clock.ena_gpio, but before it has registered the clock. This will
>     > cause a NULL pointer dereference, because clkdev_drop() is not null aware.
>     > Instead of guarding the call to skl_int3472_unregister_clock() by checking
>     > for .ena_gpio, check specifically for the presence of the clk_lookup, which
>     > will guarantee clkdev_create() has already been called.
>     >
>     > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=214453 <https://bugzilla.kernel.org/show_bug.cgi?id=214453>
> 
> 
> 
> Is it possible to fix this to be BugLink?

IMHO changing Bug: to BugLink: is not worth doing a forced push to pdx86/for-next
(and pdx86/fixes) for.

Regards,

Hans



>     > Fixes: 7540599a5ef1 ("platform/x86: intel_skl_int3472: Provide skl_int3472_unregister_clock()")
>     > Signed-off-by: Daniel Scally <djrscally@gmail.com <mailto:djrscally@gmail.com>>
> 
>     Thank you for your patch, I've applied this patch to my review-hans
>     branch:
>     https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans <https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans>
> 
>     Note it will show up in my review-hans branch once I've pushed my
>     local branch there, which might take a while.
> 
>     Once I've run some tests on this branch the patches there will be
>     added to the platform-drivers-x86/for-next branch and eventually
>     will be included in the pdx86 pull-request to Linus for the next
>     merge-window.
> 
>     I will also include this in my upcoming pdx86-fixes pull-req for 5.15 .
> 
>     Regards,
> 
>     Hans
> 
> 
>     > ---
>     >  drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > index 9fe0a2527e1c..e59d79c7e82f 100644
>     > --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > @@ -401,7 +401,7 @@ int skl_int3472_discrete_remove(struct platform_device *pdev)
>     > 
>     >       gpiod_remove_lookup_table(&int3472->gpios);
>     > 
>     > -     if (int3472->clock.ena_gpio)
>     > +     if (int3472->clock.cl <http://clock.cl>)
>     >               skl_int3472_unregister_clock(int3472);
>     > 
>     >       gpiod_put(int3472->clock.ena_gpio);
>     >
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

