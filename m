Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12592C001B2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Dec 2022 09:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237896AbiLNJtj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Dec 2022 04:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237925AbiLNJth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Dec 2022 04:49:37 -0500
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B609912AC1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 01:49:34 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-14455716674so15939593fac.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 01:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH6RoPx9LOXfbrkQ1OmroRT7KPGqJmsMcWvJFewb/oY=;
        b=R8wZ54jygSdwKyfPouSY1lrSyST5hHHJxi+A5CY3IpmCWwl38dgawm0IJrnKHs11G7
         Rz2rAzlSXAc0g4h/20gxevF1L35H8F9KeT8SbvoJXpDh9ZU8CkrNEJfpGAdYyuEDqQa6
         jw3ajiM3m2o5HwS/l6/q78duA+29Y/8/LcSlMSZL5jbePV1NEBhf1KikFphMKg9UfM3a
         sHcT8c42Yvo8cHT743oOqwkPqeG5nSuzKJwFONZ+VDx5bbc3HiC5R1KhmbFCfy/+DRUi
         TEgCh/8Y9rE609h21WgU2/1T1sG0x0W9pr96M8FhPhySi1tdVyQQDTNXTia+8pHEZSyx
         o86g==
X-Gm-Message-State: AFqh2ko1JxgqnbdYJHN/jPoA6y5TpH9hRWTvnaNpbQGzvdHQUu31b5NS
        ObdNjHoXl1J5gIrfWmjuS69zOJEP7BwQqWYSW2E=
X-Google-Smtp-Source: AMrXdXuGcaxEdLpxMmt0g+NoRG7kQwUbOJ9e7JcFm6L+cesR3/+vGh+/CAruZBBYNSGtnI1IaRTVC6GrqDp4Z4r7dcA=
X-Received: by 2002:a05:6870:d68a:b0:148:119:3a77 with SMTP id
 z10-20020a056870d68a00b0014801193a77mr184612oap.217.1671011373883; Wed, 14
 Dec 2022 01:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20221213122943.11123-1-hdegoede@redhat.com> <CANER=bYHYNSi3fTwqAt89n-6uS5dSV+o+6H4oD6doeSzgtoZoQ@mail.gmail.com>
 <f2cc7aaf-3a2d-f3f0-9a65-1a67ac780131@redhat.com>
In-Reply-To: <f2cc7aaf-3a2d-f3f0-9a65-1a67ac780131@redhat.com>
From:   Mattia Dongili <malattia@linux.it>
Date:   Wed, 14 Dec 2022 18:49:22 +0900
Message-ID: <CANER=bb5wxxvUJfGDZHquExeC1Q=k8HdUmPmb2HxmUwrsNMbRg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard
 backlight during probe
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 14 Dec 2022 at 18:13, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Mattia,
>
> On 12/14/22 09:55, Mattia Dongili wrote:
> > On Tue, 13 Dec 2022 at 21:29, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> >
> >     The 0x153 version of the kbd backlight control SNC handle has no separate
> >     address to probe if the backlight is there.
> >
> >     This turns the probe call into a set keyboard backlight call with a value
> >     of 0 turning off the keyboard backlight.
> >
> >     Skip probing when there is no separate probe address to avoid this.
> >
> >     Link: https://bugzilla.redhat.com/show_bug.cgi?id=1583752 <https://bugzilla.redhat.com/show_bug.cgi?id=1583752>
> >     Fixes: 800f20170dcf ("Keyboard backlight control for some Vaio Fit models")
> >     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
> >
> >
> > Signed-off-by: Mattia Dongili <malattia@linux.it <mailto:malattia@linux.it>>
> >
> >
> >     ---
> >      drivers/platform/x86/sony-laptop.c | 21 ++++++++++++++-------
> >      1 file changed, 14 insertions(+), 7 deletions(-)
> >
> >     diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> >     index 765fcaba4d12..5ff5aaf92b56 100644
> >     --- a/drivers/platform/x86/sony-laptop.c
> >     +++ b/drivers/platform/x86/sony-laptop.c
> >     @@ -1888,14 +1888,21 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
> >                     break;
> >             }
> >
> >     -       ret = sony_call_snc_handle(handle, probe_base, &result);
> >     -       if (ret)
> >     -               return ret;
> >     +       /*
> >     +        * Only probe if there is a separate probe_base, otherwise the probe call
> >     +        * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
> >     +        * the keyboard backlight being turned off.
> >     +        */
> >     +       if (probe_base) {
> >     +               ret = sony_call_snc_handle(handle, probe_base, &result);
> >     +               if (ret)
> >     +                       return ret;
> >
> >     -       if ((handle == 0x0137 && !(result & 0x02)) ||
> >     -                       !(result & 0x01)) {
> >     -               dprintk("no backlight keyboard found\n");
> >     -               return 0;
> >     +               if ((handle == 0x0137 && !(result & 0x02)) ||
> >     +                               !(result & 0x01)) {
> >     +                       dprintk("no backlight keyboard found\n");
> >     +                       return 0;
> >     +               }
> >             }
> >
> >             kbdbl_ctl = kzalloc(sizeof(*kbdbl_ctl), GFP_KERNEL);
> >     --
> >     2.38.1
> >
> > ---
> >
> > Aha, looking at the bug report and the commit that caused it I think this fix makes sense.
> > You can add my sign-off too.
>
> I think you mean Reviewed-by? Singed-off-by: is only for patches passing
> through you. E.g. it was send to you personally and you then submit it
> to the list.

Sigh yeah... It's been too long.

Reviewed-by: Mattia Dongili <malattia@linux.it>

Thanks for pointing this out and most importantly for the fix!
-- 
mattia
:wq!
