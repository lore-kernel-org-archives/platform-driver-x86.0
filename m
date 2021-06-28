Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B31C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AF216197F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbhF1PpG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 11:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237254AbhF1Poc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 11:44:32 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA47C0575D1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 08:05:36 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id a2so15689709pgi.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oAT6it4MRcZdjD2VEV/ujkGH0l7k9D7vRA+pBVqTx4g=;
        b=vOfiOoWMbJpAF0pW7hF5usr7TNBkrwVZWP7MRAHd7wMX8Oujc9Y27UXjcN26UHUpiX
         TcAHMZt+/SR4DpvZU1wSGoxqKe0OGKkiT+MtvSU6ofKN0jplP/YpqKz7CtwpRJXn3Jzd
         6hWx9EO7wILfRsAkuk673RhSLVzcN7A0mLGQ64/XMSftc/63Cu9AB6ziInMKZPERdUjh
         RvC99oLtyQ69UjyMmOkJ88sGrAlGP40X3qXe2KaiVrU12ZaumuMszih1Ay+pBUGkxpy9
         15PvfasRaJRZOPlvY3ccXCpnL4hPrVV9fxcOPLqtqfaDEBNFHFNcsMMtOraywZJDlb9Y
         s/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oAT6it4MRcZdjD2VEV/ujkGH0l7k9D7vRA+pBVqTx4g=;
        b=d2vf880STdTMv0OokmZZMvn2G/PpQNvUmjIjmuT/8TaQkEh+dM2s2Ut4Nof1B9VmDx
         l/KGpXorgr2LGpSy3Ss46lPhBkGruIYGxVJ6FQoURSentf8JuHRgXmXF3PSXf7nKalow
         Nf+yspuUzk3y1yzcpJ8xTjolM42kXuSbwjdBuwLb3ORlTFNvHctm+WYDvbw0aApjEMnZ
         +3fJXDOe2AL/FNuxzpOBb/H1tvoHYEzya3vO7aQbDGeQMtO4SUNY7Fk19oozCKoGdtpr
         1DHPEyOe8xHcsw0ZRl9UidRya/zb1hmHgYEE/+9Sg7tyyuxzbjPIcFfhmTAcwHbVBZRD
         KPww==
X-Gm-Message-State: AOAM533c6OEsJA4JN/+AM5zABVylf3Ly4YX1ZcMcwejO+Ufpef+MtKQo
        j3qU0L4qFRwrLvh+Wy1zEBX/JxmDgx+KD/71cFc=
X-Google-Smtp-Source: ABdhPJxI/D7AY7Tr54p7NBY9MoKFQxGnWibP4rkF2iAKn0lXhiV4qL0oXQpfGmrHB9tZL2S7xF48BR5HhS31NgcghA4=
X-Received: by 2002:a63:df10:: with SMTP id u16mr23734789pgg.4.1624892735532;
 Mon, 28 Jun 2021 08:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210428032224.8299-1-s.shravan@intel.com> <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net> <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
 <MWHPR11MB145562EBE171DD3B40595DD0E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c76d3ae7-a7fb-e766-d71c-c929cfde969c@metux.net>
In-Reply-To: <c76d3ae7-a7fb-e766-d71c-c929cfde969c@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Jun 2021 18:04:57 +0300
Message-ID: <CAHp75Ve8vMhJ6RxOg1XJaOaDgEBSkaamr2S_34zn21=AJvOsZA@mail.gmail.com>
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Shravan, S" <s.shravan@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 28, 2021 at 5:07 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 23.06.21 16:03, Shravan, S wrote:

...

> Over the last decades I had to learn to *never* trust BIOS vendors with
> anything more than just starting the kernel, especially not trusting in
> ACPI tables. And we certainly cant expect people doing field bios
> upgrades anytime soon, in case some bios vendor actually manages to
> clean up his dirt and publish some actual fixes.

But this is not the issue of ACPI, right? Maybe you should stream the
energy to complain and file bugs against vendors who do not know how
to cook ACPI?

> Seriously, I'd rather try to keep bios out of the loop as much as
> possible. And if it is involved, let it describe the hardware precisely
> instead of doing whatever magic logic.

Isn't it applicable to all firmwares? Have you tried to avoid wireless
firmwares (rhetorical question)? My point is that we have to live with
that fortunately or unfortunately.

> (I need to hold back myself for not starting another rant against ACPI
> and bios vendors :p)

As I said, look into the root cause, while I admit that the ACPI spec
is easy to abuse / misinterpret (in some cases).

...

> >>> 3. unclear how userland this should really handle in a generic way
> >>>      --> how does it know which device to tune ?
> >
> > [Shravan] Userland will configure these parameters on the specific RF device.
>
> So the user needs to configure it anyways. Why do we have to have that
> acpi stuff in the first place ? If we're already involving a device
> specific userland, everything (including the tables) could live entirely
> in userland - and we would never ever have to touch bios or kernel
> anymore. (remember: bios upgrades are always a total mess).
>
> >>> by the way, who hat that funny idea putting such information into acpi
> >>> in such a weird way ?
> >>
> >> I believe its source is a Windows driver and Windows "culture", they simply
> >> don't give a crap about anything else and Windows is a product-oriented platform
> >> (each product is unique even if 99.9% of the hardware and firmware is the same
> >> with twenty more products).
>
> Okay, and why are you guys (Intel) following such insanity, when this is
> meant for Linux-based devices like Chrome ?

I haven't got it. How do you deduct that it's solely for Chrome? Even
I'm puzzled with this Yet Another Not So Portable Idea. And above is
my speculation about the roots of it. I can't explain it any other
way.

> Sorry, but doing something just because thousands of programming minions
> in Windoze world (which, from my personal expercience, most of them, at
> least on driver and firmware side, I have to consider totally
> incompetent) are doing it that way, really is a bad excuse and has
> nothing to do with decent engineering.
>
> So, please, let's throw away that arbitrary acpi junk and engineer a
> technically good solution.

ACPI has nothing to do with any solution to be "junk". If one doesn't
know how to cook it, it doesn't prevent them from cooking it in a
better way.

-- 
With Best Regards,
Andy Shevchenko
