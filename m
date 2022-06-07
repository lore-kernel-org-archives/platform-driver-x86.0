Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB30CCA488
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 00:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380035AbiFHAdB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 20:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444765AbiFHAE7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 20:04:59 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC461BF09B
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 13:01:41 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-30ce6492a60so187737827b3.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eHfMtzLcD0xkgKeiurjv4Pqpl3HiyoNr2WPd5c5Lj/o=;
        b=XszGSiSMOxadJje768Xaicc+/8PjcKpeIb5HjCZlcXiAz9r/UKD8hNHBBMvoUL8VTP
         0eh4FuDIIra9spQapZLPwHW2iyGLBy/LzHqTS6e19jgoKDKuoU+5Fg427vwc3EN6rlWb
         i3J+ezBGSBlJhaejuWocP+oI4YZSUI7JzjaCAdXJLFSDiMxEn7iYBHl+SDXgKx4u5EHa
         llDEDxeQqvIrrujHMKA2+CTs8814caydca5oYL/QXfCV92Z6zWJoBOKwzwr97u6HOP02
         GGUfWJ/w/eLb4vr/G9/vBCQwSunGxfv1XwtcGw/gX16EHGzpIKUluFEkIK5icJq+yMiA
         fcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eHfMtzLcD0xkgKeiurjv4Pqpl3HiyoNr2WPd5c5Lj/o=;
        b=SrfUxuFNwVwKN6rSPn39BqnaoyVOWHkJ2PmdWjFvRFtHTwSPDvGNWiPlvv6o2S1jD4
         3mazJQNMzVlPDxZiq8OcQEQw657zn03vfJ/ReDgmy+7ansDGRDUA1NpW3b7mRE8dO7WY
         B7XkzgAESpSxeHj2uWYdsB/UI9vDuyop64XheucCbIY9ooRTRpUJHOpw0BA9RxfGFjOt
         GZKTyendDShsTfmMi7X4Egzh04HAa9C5grj8cZ7QM6fhb5gvR7TiVZyEk2j1YDE2SHJY
         1hXvtwdqPfF+g2F1Lq16rHqvc8C4fZrGwDpKlQS0HOyoUVrfFJlZ9SUr8EkwPJbmJiF2
         br2Q==
X-Gm-Message-State: AOAM530XtR7VO3FBo60UeHSgf70kcB15QkM/CZYrMy0PLbF6L+6G+VU0
        yZ7sS69km7Rx+g2g6x/8/a9TT8kqzsQjVZfdC8HO0S9HkaQ=
X-Google-Smtp-Source: ABdhPJxaE5JCoE1/JOT/+kTIIpXP5JzRMkxXt9ec3WV3P+ljqdiM1z10stJIMNj9DDL+Awo54IO1Avk8dWGGiSrQh08=
X-Received: by 2002:a0d:d90e:0:b0:30c:bcae:ac17 with SMTP id
 b14-20020a0dd90e000000b0030cbcaeac17mr32903065ywe.446.1654632100622; Tue, 07
 Jun 2022 13:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220606205451.21067-1-jorge.lopez2@hp.com> <CAHp75Vck8=TUeq6gQQyjS00i9Zn4G+vXK0Lev+AFMWdVpe1GGw@mail.gmail.com>
In-Reply-To: <CAHp75Vck8=TUeq6gQQyjS00i9Zn4G+vXK0Lev+AFMWdVpe1GGw@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 7 Jun 2022 15:01:29 -0500
Message-ID: <CAOOmCE-0RNEkbAZ2W0CQjsZ_=ft0PNA8LvSwBCZfv36jwYbP6g@mail.gmail.com>
Subject: Re: [PATCH] Revert "platform/x86: hp-wmi: Changing bios_args.data to
 be dynamically allocated"
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

I will ask to remove review request title is  "[PATCH] Revert "platform/x86:
hp-wmi: Changing bios_args.data to be dynamically allocated"

I am testing a cleaner solution to submit instead of  reverting the
changes to hp_wmi_perform_query method.  The changes were made and
tested on business notebooks without any issues.  I will submit a new
patch as soon as I get the test results from a  community member who
owns an Omen 15 system.

The proposed patch which I am pending test results, it is as follows

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..7bcfa07cc6ab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum
hp_wmi_command command,
  struct bios_args *args = NULL;
  int mid, actual_outsize, ret;
  size_t bios_args_size;
+ int actual_insize;

  mid = encode_outsize_for_pvsz(outsize);
  if (WARN_ON(mid < 0))
  return mid;

- bios_args_size = struct_size(args, data, insize);
+ actual_insize = max(insize, 128);
+ bios_args_size = struct_size(args, data, actual_insize);
  args = kmalloc(bios_args_size, GFP_KERNEL);
  if (!args)
  return -ENOMEM;
-----

I received confirmation from another community member and confirmed
the patch resolves HPWMI_FAN GET/SET calls in an OMEN Laptop
15-ek0xxx.   No problems were reported when testing on several Elite
and Zbooks.

Regards,

Jorge

On Tue, Jun 7, 2022 at 4:55 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jun 7, 2022 at 7:59 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> >
> > This reverts commit 4b4967cbd2685f313411e6facf915fb2ae01d796.
> >
> > Changes to bios_args.data to be allocated dynamically causes
> > several WMI calls for OMEN laptops to fail.  The problem
> > is resolved by reverting commit 4b4967cbd26.
>
> As a quick fix it's good, but have you had a chance to understand why
> this failure happened in the first place?
>
> Can you check my theory that is expressed in the code below?
>
> ...
>
> > -       bios_args_size = struct_size(args, data, insize);
>
> Try to replace insize here with
>
> max(insize, 128)
>
> > -       args = kmalloc(bios_args_size, GFP_KERNEL);
> > -       if (!args)
> > -               return -ENOMEM;
> > -
> > -       input.length = bios_args_size;
> > -       input.pointer = args;
>
> --
> With Best Regards,
> Andy Shevchenko
