Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34809C2B9F7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 28 May 2021 18:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04D62611AE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 28 May 2021 18:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhE1SVT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 28 May 2021 14:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhE1SVT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 May 2021 14:21:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F5EC061574
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 May 2021 11:19:44 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id b7so2043754plg.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 May 2021 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tzj/OiDb/s0xUelE74+3sGx3hVj5Iyu0ne83M0rGfmw=;
        b=Ultb9u5DnFPziGjRGKMpBbR89cy4m76g8a/3cZ58B9DazcZDiL3lXm/JU6Su1INOx8
         pZZZn5W17ME4shHMCk3dQZx25kZ/Qs7qNB2ZHsBgLR0BD3D1G8CmONQgL33fngy+tz25
         9knk78Egn0toem1FwdHXXWjxBaay0LLD50LQUe56VlZMNy3Qk5+rq68CfD4CObmHLJNM
         3HTQqs7kJMcR/IrHcC1zOawXTGwz4/C34O2oQOcsmG6OKsvB4Qg/TCvPZ6iiDF9FcDPo
         8HFurpmY/OMdMRfUWYUIJJiLh2cRYj8k5T9MPwuC0Mc3SxbdfuM+IWOZ4FSqTDQT3K0l
         q4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tzj/OiDb/s0xUelE74+3sGx3hVj5Iyu0ne83M0rGfmw=;
        b=r4V3KUWWiSJQ4FmV0vYNeA+IZoDBEtOUHFHxOqHTqxvnK02QM5a7+LXNXwomJOFCiY
         2jD86wHnesiDpDWsr8JYw1t6ihCL0lNmpEBoLp+wV4dFqzWSDOtoKre1CFX5SUi2u3lK
         kOHv8viPIWwzYN+p2yY5EW35nLhfMgb4BO0yboaXnutcQYajcGms2Vy4PY24Q+7u6eGw
         hPAB5FUUYD6iYw3erejNig6gK4WH75EyJzwR3NqiZEtSJtXpkyy18a97BXjvPR+/Gi2z
         WGbNdAeliZHgmCWEhXmc7cVlF8fxXRS+jOQ/5/g4/kJ8vIXUF1SmXuGLvJIymM7WBWwV
         aD9g==
X-Gm-Message-State: AOAM532R+KE1Atkt4PMtwqeFIVBT+gAhweB2r4w2vd+t0s1qy0d2oAHx
        mkha8lwPUw4R8Ztv3tmWfFr7NFZVoVd0lErJ55Q=
X-Google-Smtp-Source: ABdhPJwELS2AAdswTO5YuN5gTHuCsmk26C/JR9zEEWYW1Tc985kxmGtT43gawmLwhKM6ZNM5SI3EEhsrd6B+kS49Gh8=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr5919072pja.181.1622225983648;
 Fri, 28 May 2021 11:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com> <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
 <ae3e876f-5532-5fae-6879-7d7bf150241a@lenovo.com>
In-Reply-To: <ae3e876f-5532-5fae-6879-7d7bf150241a@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 May 2021 21:19:27 +0300
Message-ID: <CAHp75VdMX=RkXi08p_YGnRbWUKBE=3_J6O0CpPfgz0AWgrUZpA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, May 28, 2021 at 8:36 PM Mark Pearson <markpearson@lenovo.com> wrote:
> On 2021-05-27 10:16 a.m., Andy Shevchenko wrote:
> > On Wed, May 26, 2021 at 11:15 PM Mark Pearson <markpearson@lenovo.com> wrote:

...

> >> +#include <linux/acpi.h>
> >
> > linux/errno.h ?
> >
> >> +#include <linux/fs.h>
> >
> > linux/string.h ?
> > linux/types.h ?
> >
> >> +#include <linux/wmi.h>
> >> +#include "firmware_attributes_class.h"
> >> +#include "think-lmi.h"
>
> I hadn't included those as they call get pulled in by linux/acpi.h - so
> aren't needed here. I take it best practice is to add them. I'd
> deliberately stripped down the list to the bare minimu previously but
> happy to reverse that if it's preferred.

Basic headers like that are kinda what almost any file uses, but
acpi.h is not the one which guarantees their inclusion (you see, it's
a layering violation: acpi is not low level generic library).

...

> >> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
> >
> > Hmm... We have already define_one_global_ro(). The problems with that
> > are the name and location. But perhaps you can copy that macro here
> > with the same name and at least we can see the common grounds to clean
> > up in the future. Another possibility is to comment that it can be
> > replaced with the above mentioned macro. Ideally would be to refactor
> > right now, but it's not anyhow crucial or required for this series, so
> > may be postponed.
> OK - I'll have a look. I'm not 100% sure I understand the issues, but
> hopefully it will become clearer once I play with it a bit

Including cpufreq.h in your code will seem weird. That's why I marked
it as an issue.

...

> >> +       pwdlen = strlen(buf);
> >> +       if (buf[pwdlen-1] == '\n')
> >> +               pwdlen--;
> >
> > But the question is what will happen with the string like
> > 'pa55\nw0rd\n' (note all \n:s)?
> > See also below.
> I know there is discussion on this in future mails, so I'll leave this
> one for those

OK.

...

> >> +               /* Remove the value part */
> >> +               strreplace(item, ',', '\0');
> >
> > This is kinda non-standard pattern.
> >
> > I would see rather something like
> >
> > char *p;
> >
> > p = strchrnul(item, ',');
> > *p = '\0';
> >
> > Yes, it's longer, but better to understand what's going on here.
> Fair enough. I'll change. I quite liked the fact I had a one-liner do
> the same thing - oh well :)

Me too, but the problem with strreplace(..., '\0') is that it sounds
like a half-baked strsep() solution. First of all, it will go and
replace all \n to \0 while you stop anyway on the first one in the
following code.

-- 
With Best Regards,
Andy Shevchenko
