Return-Path: <SRS0=yw7w=DJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CF8C4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 15:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCEE920708
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 15:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3GxLBlb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388116AbgJBPHu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388091AbgJBPHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Oct 2020 11:07:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40091C0613D0
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2020 08:07:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so1000138pjd.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2020 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kEZYt5nz2N+kg/vJ6BVK3YBNmPgFi44cdlln9ovBgAs=;
        b=a3GxLBlbiiVqATiSrOyXE5jMltyaqzPzHErhmmqnNrl2UTMy1u5yRB2LJh09Th5uL8
         AcQKgMEK+fhuRYIfOBz1OuZ3QRoPohAp896KkJPoWwRLorVyMiZXfwPgDeq//9gVQNHz
         TxPo/jHwqp6cNtkGrL967lxe0xW5SE837rWv6ZbXyghYSV3JrbBR1/1oPS58fAQ6C/HY
         sGCyNgodWS1z1YOs/f2eWlW/R11r7u+f7rUec6lzCQ8ANXpCmBol5glonn5s9W/dHv6M
         aEJ2xWW0K13PM6aXbOBjBMDYSHNk2NmQqqqhWwLd0QU040P+i6Aa1qbzSWsrkLFEv/t3
         mu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kEZYt5nz2N+kg/vJ6BVK3YBNmPgFi44cdlln9ovBgAs=;
        b=V8clXjOBSxoexi3Neu5nFY1PoD87ZqkD04552z+QqjJnhRdpG3X0UD+aACLMwY6C7E
         wCNM0RoU4XPY6zcpYemuMWvngLLDvtCLpTS4PEWW24kLoGTd8sbhD6ksb5h9OQwojoty
         Ou/nF4ODYpugL8rO4W0TV9WotyDZZ8wwj+1gzVd6Ob/Quu6sO4AIwSjP9WpFPPtDD6XO
         UylNtJt9FkfwJyH9RFwCPiIlSHRo3+hQBPnjAOZD37/DIXqGvMmUWKjMGapMAxYKLW8b
         QEpz0qKeUGH98dRyx8mDobG/m4z+zJTmT8lUYsp6asKTvds1+ianzYN8O1KahBtQg5ql
         Jm6Q==
X-Gm-Message-State: AOAM531cltkN2xDkd8+AXiNWXnoaPtI4mWoFkukm8hv8OgUN0JdjmuGs
        cUYa//wrZUUZJsPAlzImTHxv6bRW4Hbw1NpclqE=
X-Google-Smtp-Source: ABdhPJxQoHO7FIhLjN26H1D2Wqlyfg57Y32SCbUwDGRKD+c4AfPJWw+/nE4220emOAsYdIX727vEXKbyyTCX+air8+c=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr3306155pjb.129.1601651269755;
 Fri, 02 Oct 2020 08:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200930131905.48924-1-hdegoede@redhat.com> <CAHp75VcoyvpvfpfpcNa_j4oTRQV2Cyue+RJ33AdYz+q8uyCFag@mail.gmail.com>
 <_GDJXv2BrCsSZ77bLZXvXW2bz0MslNNwgXGiPib5cvCYWleijYXNMnTikDp3Lj1IP6bcQES3tC243dn_h6teAe0_3OVVeOotRtS60MB4WD8=@protonmail.com>
In-Reply-To: <_GDJXv2BrCsSZ77bLZXvXW2bz0MslNNwgXGiPib5cvCYWleijYXNMnTikDp3Lj1IP6bcQES3tC243dn_h6teAe0_3OVVeOotRtS60MB4WD8=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Oct 2020 18:07:31 +0300
Message-ID: <CAHp75VdghsmeqtjvA6LqHxXQqvHcwm1ECjTvjDKe+3B8NrQKKQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Switch to an allow-list for
 SW_TABLET_MODE reporting
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 2, 2020 at 6:01 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.c=
om> wrote:
> > I have reverted previous attempts and applied this one, but...
> >
> > > Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TAB=
LET_MODE on the 9 / "Laptop" chasis-type")
> > > BugLink: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-=
on-kernel-5-6/22668
> > > BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=3D1175599
> >
> > > Cc: Barnab1s PY1cze pobrn@protonmail.com
> >
> > ...seems like a broken name to me. I'll try to fix this.

> Yes, it is. :-(
> Maybe I shouldn't have used accented characters, sorry. I thought UTF-8
> was reasonably well-supported in 2020.

Sorry for that. I agree that UTF-8 must be supported well. I think
Hans can check what happened and act accordingly.

--=20
With Best Regards,
Andy Shevchenko
