Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBBBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF08764F74
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhBCMRX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 07:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbhBCMRW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 07:17:22 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10376C0613D6
        for <platform-driver-x86@vger.kernel.org>; Wed,  3 Feb 2021 04:16:42 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so17232175pgl.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 04:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FyCv+nfuvBL7MxqAvEt+DH19hujvlSjyi8ixMp4s8f8=;
        b=DyA0suZC4XiczEaNmQLJOkKlDIKrqjIquZZxjjP/hIesUY5M4zz2WMkFKuZ6bVPT3G
         2IPjzRRiRWmWpH9pvAW/t4Oc/8vwKG18dD2i6fmJgwRMsN6mASVPPzP330xYaQV5/P/5
         2xnkAaL2Wv0K967u30eWLe2aOx0B4gtqL+eKRi/wCHxlrRWmssOLuC3BtQFLq+hIhrVR
         8mytukmsVePawZaMNDn579PKvF8cZBLCqnSMol9m/fOdqhxul2+GmxCC22S1ur6LlVLS
         snZyy+yY8ev859zy2BvUCnmMJbXH66pd7uW+joGdbKiSImhTVyFHWkgdVD6Ggf+qw74X
         P54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FyCv+nfuvBL7MxqAvEt+DH19hujvlSjyi8ixMp4s8f8=;
        b=lBbcWJWyLYFxC88L+9p3voxnAOiyUaC+7o3BEqJ8Y6e+AYJseO7/fQsKkukc1B+Uzu
         hjIrxBqTow8+ySB3CEWcxY3suRQknISptLku6at/a21QB6GH5LPpbe3LkGBLbgZ5tKh1
         RCkGUNUMRYclZWK0Af+tNHPNlcdJiXpPJz2ldhuV6+0wo00VoHv24pHHwHhFEQucBnCS
         C2U89L1vJLjkgFwwKhtZo1uSE7PLzSuTOUp6g3VDlBBoqpPH4Im1vieWyUNLGWCvR/8/
         6+3meCntdBH0Zpax3gUTBekZFqPtvbcyIrK02xEJ1+1c2mUYgims5h5o4UH3vPlVdkyu
         TAfA==
X-Gm-Message-State: AOAM532DIX9nyHIftdjM2E56kw/xFMhhW3X0qiXzgl6iPysoMHi1dELM
        dUBp+t+jIrG5PTBJXobwYKHAyhspfDBijfor2aM=
X-Google-Smtp-Source: ABdhPJxvnsrTed7DrkmXlD2ma/Efr0Xb7pk8nzg7J45/uKE3KM1ea4OsKAb6CiWuhBUXjhykJvsRa4EexhBv2zIb+4U=
X-Received: by 2002:a63:e50:: with SMTP id 16mr3349412pgo.74.1612354601484;
 Wed, 03 Feb 2021 04:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com> <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
 <YBqJ7VmchoG6Kt8t@smile.fi.intel.com> <c3fc4dfd-13b5-73c0-7d97-cdab0b61f170@redhat.com>
In-Reply-To: <c3fc4dfd-13b5-73c0-7d97-cdab0b61f170@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 14:16:23 +0200
Message-ID: <CAHp75Vc1EMUKLoBAaUSqD-TeBuSQbe1gHPGjisp_-W7uWyc1ug@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if ACPI_WMI'
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 3, 2021 at 2:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 2/3/21 12:33 PM, Andy Shevchenko wrote:
> > On Wed, Feb 03, 2021 at 11:55:40AM +0100, Hans de Goede wrote:
> >> On 2/3/21 11:48 AM, Hans de Goede wrote:

...

> >> So I still think just sorting the entire bups alphabetically
> >> is better. We can then also add a comment at the top to please
> >> keep things sorted alphabetically.
> >
> > In long term I prefer split the entire folder to subfolders where you create
> > a new Kconfig with a rules like alphabetical order or so.
> >
> > Shuffling now Kconfig and Makefile w/o above doesn't bring a value in my
> > opinion.
>
> Ok, lets keep things as is for now then and hopefully in the future
> someone will have some time to clean this up a bit.

Or ask contributors from corresponding companies (Dell, Lenovo, etc)
to sort this out at least for their devices. Good we have no surface
issue with this, since it's in a separate (sibling) folder.

-- 
With Best Regards,
Andy Shevchenko
