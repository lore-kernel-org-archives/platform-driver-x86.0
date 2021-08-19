Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1068C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 12:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F31D610A7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 12:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbhHSMP6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 08:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239281AbhHSMP5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 08:15:57 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F71C061575;
        Thu, 19 Aug 2021 05:15:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mq3so4765841pjb.5;
        Thu, 19 Aug 2021 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fztjrUxdZEGqbexbhasq+sSk3wApfe0OIx2v0wDlJzY=;
        b=bKdMjI8NAJFzuSl1FIMfWW2ST9E3Xw5D7ATeV+JVCvgbRsL2WXuRLbgaB/BLs09gtq
         UAV18MFqviWSmL7/GZKyOddobts6Vtu9GcpDEyE8IzF4ZrA0CCtC6c6yg2FB6xjK3lgY
         cw+wLmnyYX+KCYnu00fyGTIdGyn78N0WuYXCmTlWatxyA2wFWi/69mXZBJiVID/1GZMZ
         dmWvMf78Om/63av6tbWRANCJEZDAhagryZVaiIX8jT//F0fqARkGn8uH3RzUj69veUL2
         8TL8axQRarsmSrmi6taY9JZojQvEHtFhGCTncWak+XLx+4S4kYQAf7yfHI6glp3Xne9G
         HbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fztjrUxdZEGqbexbhasq+sSk3wApfe0OIx2v0wDlJzY=;
        b=nKC/yzdQEiHnqK9w0OHq0NMDY1JGorNaVoE7FRsn//K2hURAcI/3XvQYQhhsF7+tQt
         VsX+oCLQE3EY32DQf3dCLlun1spkzFswHD4kYO89wduvrd26gbhFZdu3hC3rqRlEg8qy
         jPzer1NqgMI6b/Y5eoqTni1d8b8sHAy/ybpGMx7AKYn+zLFRK3b+OOyvmSGn1C9Dgpg7
         wUYJTDhH09IoKk6z3VR7pFVw3jSRDI+9x0xgJkNb6BJ84um1S+GjY9RxpF0tiERFl6kT
         GNmwq9F82XXCr3I/IvkO2SDkX8wNddQxgT2qmA8eD/joKM2aP4XHoWOwNVeHLPFX5DRG
         y5fg==
X-Gm-Message-State: AOAM531nqBe1Fufsk4EEBWSIS7qBjG3s/cJv6VKt7hJHB6Gz5DAeDsV6
        RDX+g+8GnlRoVmmqM0AYfYKWZoYcMNHDdoULLz8=
X-Google-Smtp-Source: ABdhPJyYHDss0jUoLyH5uB5xnms0tcgzX/qqtvZOOoF7OoDKpZTSP9tmz9R2WVpYgLYuRLdqUFN0xcyYMbjjwqhBZZc=
X-Received: by 2002:a17:90a:604e:: with SMTP id h14mr14846390pjm.181.1629375321054;
 Thu, 19 Aug 2021 05:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210819033001.20136-1-hpa@redhat.com> <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
 <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
In-Reply-To: <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Aug 2021 15:14:41 +0300
Message-ID: <CAHp75VfvjVeq716d=aGvZXvmzbpW4+XG66ryVYrBxk5G5Wd6cg@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 19, 2021 at 3:03 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Aug 19, 2021 at 1:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
>
> > Thank you for your patch-series, I've applied the series to my
> > review-hans branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> >
> > With the changes mentioned in replies to individual patches.
>
> Can we postpone this a bit, please?
>
> I have a few comments here and there. I'll send asap.

Hmm... It seems it will take less time if I simply take what you have
in your repo and produce a v4.
Would it work?

-- 
With Best Regards,
Andy Shevchenko
