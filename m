From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Tue, 14 Feb 2017 00:26:12 +0200
Message-ID: <CAHp75VcH2cCWA2mophVC1+BP69D0FJ2-tQjcs9B-Yi8JaytN_A@mail.gmail.com>
References: <20170130105749.17338-1-rrs@debian.org> <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
 <1485863265.11199.3.camel@debian.org> <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
 <1485959219.8977.1.camel@debian.org> <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
 <1485965846.14297.1.camel@debian.org> <CAHp75VckDTD+yx4tTwpzgvgsygiWFEs1t5Uc85UsbaJD8inx_w@mail.gmail.com>
 <1486023399.14342.1.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:35695 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751143AbdBMW01 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 17:26:27 -0500
Received: by mail-qt0-f182.google.com with SMTP id x49so96345839qtc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2017 14:26:27 -0800 (PST)
In-Reply-To: <1486023399.14342.1.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

I'm sorry for top-posting, but something wrong with email quoting. I'm
using here gmail, it might not recognize message properly.

So, please fix the subject line to have a prefix, in your case
"platform/x86: ideapad-laptop: ...".
Add to the commit message what you explained me and put a link to that comment.
And resend new version with all maintainers included (there is a
script scripts/get_maintainer.pl to help with the list of
maintainers).

On Wed, 2017-02-01 at 22:53 +0200, Andy Shevchenko wrote:
> > If you have time, please see:
> > https://bugs.launchpad.net/bugs/1366421
> >
> > It has pretty much all the details on what and why we need something in
> > sysfs.
>
> It's a lo-o-ong discussion from which I, might be wrongly, assumed
> that there couple of problems: a) you don't know initial state, b)
> something preventing use of event.
>

Yes.

> Keyboard and touchpad are disabled by hw, so, only what OS needs is a
> notification.
>

Yes.

> Can you point me exactly to the message that explains _why_ it's
> impossible to use standard eventX mechanism for that?
>

Comment #43 has the summary of what we've tried.
https://bugs.launchpad.net/onboard/+bug/1366421/comments/43

Some of the drivers do SW_TABLET_MODE, but ideapad does not.
Some of the drivers do sysfs, but ideapad does not.

For ideapad, under Xorg, it generates hotkey events.
And the hotkey event are going to work under Xorg only. What about Wayland/Mir ?
We also aren't sure, if the keycodes that it sends, are uniform across all Yoga
variants.




-- 
With Best Regards,
Andy Shevchenko
