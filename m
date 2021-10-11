Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C139C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 22:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F231960F3A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 22:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhJKW0T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 18:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbhJKW0T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 18:26:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCA1C061570
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 15:24:18 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id g25so14128985wrb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 15:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KEPs5t4cEQ3kJ7/1BLjOOuDnODN+Jp8dvfhyf3W29+g=;
        b=iFRlVzxyRHUV1VNtxXcyqUD9rZwZWs0EMYOMhmwWJvNiMI6jK1BRdYFIrl38jGEaTd
         w9jvsv8UpCosdnnMYNP9dnrEjmbn0Hsy8Bb5F0QXApAT2S/T6vlFniyR6ROkUsg7+wNf
         E6Y92kkETcbbICmIeSof8ou/A4WhFyrhPPMQ7L2TE53n5SWdz+XEeb3DGPC1LwJdyV95
         L669fZEwUzGsS79Plrbff3kxSD7Ff3SDcaVMumW907nQsFj4gdqnU6/24FcFJBS5G5S2
         i6h2G9F3Hs5RWraj1yfTlkxPw1dS03bsjIWMqjXHcxlnU4ne8qbKvwXS1mGGkaYzJGby
         79sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KEPs5t4cEQ3kJ7/1BLjOOuDnODN+Jp8dvfhyf3W29+g=;
        b=pMBuw15IVU1vFvfnVqviUPToWXFyXdLZzYg1GC9klNsfqF4AR7J5PeNiZCtU2lO1es
         0k9/x8N6IssJUk6wVsEYEaZSwWHSaduOrSH1Eh2dukmeRElvKQLCxz4+P4hDCxcgnlTx
         Ae+bovQXtMwb1o8QZk0ssF7kFdrfXIOli5X2H44GpOG5FQ1FlwfYOEX55mCisObEEH4v
         7Vbpj4o3tuwcMAGxrNzluu4C9hkubuRrzKdri9ItDwjwXiBWbXyG/NqqKYe2z+KOPdzr
         w66qKJ8CFAjGIWeDLiIJhR9dgUVHbsn+snAjIhzqbTbKWZ7jT4wV7Bvt8nogokfQ8DA7
         jF6Q==
X-Gm-Message-State: AOAM530kWWrWOIjnZS6SUzuFNzaPA4QCkmQtgZfHOaMRNaeTMQeNmKrc
        F1BKtAdVD3kKGbrpKNoGab0=
X-Google-Smtp-Source: ABdhPJzNPYoRE1Gn1sPEPuYvD26f/jIqleMrDgFeKoJYiwHHDemezFr1EKuj0CbLqwHxFH5p+kRsBQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr1797828wmp.52.1633991057276;
        Mon, 11 Oct 2021 15:24:17 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w26sm734831wmk.34.2021.10.11.15.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 15:24:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Correct null check
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211008224608.415949-1-djrscally@gmail.com>
 <e78eec7e-301e-8686-7768-7e62c713afdd@redhat.com>
 <CAHp75VeRe7-CDC9PNxfa+j0JYM8OQVKUsZ=1bBDymH0ruB3szQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <7e2e9bf7-5944-f948-4847-ec93d740c357@gmail.com>
Date:   Mon, 11 Oct 2021 23:24:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeRe7-CDC9PNxfa+j0JYM8OQVKUsZ=1bBDymH0ruB3szQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans, Andy

On 11/10/2021 20:29, Andy Shevchenko wrote:
>
>
> On Monday, October 11, 2021, Hans de Goede <hdegoede@redhat.com
> <mailto:hdegoede@redhat.com>> wrote:
>
>     Hi,
>
>     On 10/9/21 12:46 AM, Daniel Scally wrote:
>     > The int3472-discrete driver can enter an error path after
>     initialising
>     > int3472->clock.ena_gpio, but before it has registered the clock.
>     This will
>     > cause a NULL pointer dereference, because clkdev_drop() is not
>     null aware.
>     > Instead of guarding the call to skl_int3472_unregister_clock()
>     by checking
>     > for .ena_gpio, check specifically for the presence of the
>     clk_lookup, which
>     > will guarantee clkdev_create() has already been called.
>     >
>     > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=214453
>     <https://bugzilla.kernel.org/show_bug.cgi?id=214453>
>
>
>
> Is it possible to fix this to be BugLink?


I also forgot to CC stable: my bad. I think there's a bot that picks up
things with a Fixes: tag if you do that right?

>
>  
>
>     > Fixes: 7540599a5ef1 ("platform/x86: intel_skl_int3472: Provide
>     skl_int3472_unregister_clock()")
>     > Signed-off-by: Daniel Scally <djrscally@gmail.com
>     <mailto:djrscally@gmail.com>>
>
>     Thank you for your patch, I've applied this patch to my review-hans
>     branch:
>     https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>     <https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans>
>
>     Note it will show up in my review-hans branch once I've pushed my
>     local branch there, which might take a while.
>
>     Once I've run some tests on this branch the patches there will be
>     added to the platform-drivers-x86/for-next branch and eventually
>     will be included in the pdx86 pull-request to Linus for the next
>     merge-window.
>
>     I will also include this in my upcoming pdx86-fixes pull-req for
>     5.15 .
>
>     Regards,
>
>     Hans
>
>
>     > ---
>     >  drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git
>     a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > index 9fe0a2527e1c..e59d79c7e82f 100644
>     > ---
>     a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > +++
>     b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
>     > @@ -401,7 +401,7 @@ int skl_int3472_discrete_remove(struct
>     platform_device *pdev)
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
