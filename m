Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56089C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 17:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32B0E61208
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 17:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhKJRoZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 12:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhKJRoY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 12:44:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DDDC061766
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 09:41:36 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id n29so5354897wra.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 09:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m3+k//Nw67MSP2v/Is5OlRANaMhMhhGq5VfcqBVvIeI=;
        b=h0TnXrD4xWQ+vuoN/VoZapw9MGYZH6Bzdw4vSjINkEqJJtqiL7jRWbZKk2Q0vmMAI8
         1mZ0ixZmDX4yMo9d87EaJpB4wU1QLhxjix19LfJb0TSlKXcn8oNf9zdKMHrTKBowDLAS
         qKmBrK/d/igVl4OisJ6xoOAJOuUtqjyIPJu6InPmaHc5feX514lsYg2vaJRujmDbx51b
         FnkTz4b6pg7wcI8GwA20p8x20faTwAY9TPNtjMAh7NxAREkrXjKhOsCv3cqolysvOrTm
         teo6l3u3sgTRf+9wZtzznWdOf7Dnt1T6PEgY8v+CSCo0krQQHk8VOm94AWcsqtxZm0vL
         8C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3+k//Nw67MSP2v/Is5OlRANaMhMhhGq5VfcqBVvIeI=;
        b=sdKLwZJJHtWoeLYDosEWDy3yipzte+1xBBcHJ1qAUPDjSslSdE1XgJub56+/JSug/x
         m1L22ZvPL6HUanepsx1ydLodl49M/EfFd7ahQsnqobegOiPIMhWgr0j8Qg/XkyYs3yl9
         Ph2H3IGTlc+KHH2ujk96aSttkNdhls5dphOOuktuWoP6hEaBAdedtjLgXfEoYuRPoR/f
         KEzyyZ5ygraPSbAfOkBYvrjSSBeO2JT4EIiUl7lIgQ2G8IP2PZxhr+3Pu4fKpJwkuXMU
         meYo9dX74xBqadkV0+6NiD+TsLKfLC7DQsgtJjPFli3OrzAZscBPNtMGOODNEOQyFhPh
         NgkA==
X-Gm-Message-State: AOAM533xX2fDcFX0P1uI91OTRrdv+/iY5BMq++R6+du4ImmZJUmVGlZd
        0RRbBJ0swHhfJZ+YYGSgp7smr+DuUG32YXGA+ifdCw==
X-Google-Smtp-Source: ABdhPJyji08Osmbo8jcHLe3P6SPGfKGQxGSCchRvUfkB1TcfZeMkaHCGFi4DFTbQb1Gf/AUBJBAIvEb7YplPbDdi46A=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr847349wrm.259.1636566094916;
 Wed, 10 Nov 2021 09:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20211109000130.42361-1-hans-gert.dahmen@immu.ne>
 <YYoSPjF3M05dR0PX@kroah.com> <42cea157-55a2-bd12-335b-6348f0ff6525@immu.ne>
 <YYpNOMtp7Kwf0fho@kroah.com> <CAHifhD4f676jiQ52siiKQTjUFXFm6Sto8pQjF07w5y+gqrUvFQ@mail.gmail.com>
 <YYpsq/umygfTb8mM@kroah.com> <CAHifhD6K5hbpHS-X+2L=pfUe+7OpyTbB7uyh8WGbdaeBMwoYPg@mail.gmail.com>
 <CAHp75VfbYsyC=7Ncnex1f_jiwrZhExDF7iy4oSGZgS1cHmsN0Q@mail.gmail.com>
 <CAHifhD5V9vwJenRLcPRH5ZMeLa_JnjZKfdcFZw1CjceBtC6=Ew@mail.gmail.com>
 <CAHp75VeyQEaABFOnEUh2pdFx9ROJvRcud-BuEbKWmaEWpL9_Uw@mail.gmail.com>
 <CAHifhD7Qf7+dc7K-MjNguqmiCWUxOJZmQoCTRUZOR-RWMm_JPw@mail.gmail.com>
 <CAHp75Ve9BMNy3gP=-Dajm+Lgu+E4FCqc4phLgV1_cr2qUnTX_w@mail.gmail.com>
 <CAHifhD4n7O5eWFPOjRAmHYL52tW0K=uXXzVj7L5+enTFwFXW2A@mail.gmail.com>
 <CAArk9MP5cKJ+VhAZUseW4LnQNRvux=MZe2eSy3rQkbHKnUsGig@mail.gmail.com> <CAHp75VdRwvU5WjFP5E4gg8U+_e34A0Lwze+nz_wVHoB49jLeLg@mail.gmail.com>
In-Reply-To: <CAHp75VdRwvU5WjFP5E4gg8U+_e34A0Lwze+nz_wVHoB49jLeLg@mail.gmail.com>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Wed, 10 Nov 2021 18:41:23 +0100
Message-ID: <CAHifhD7baCPKnRsM3Vfc_EDJoa=Lzqgq=K68_+WS59n9bvCOvw@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Lima <mauro.lima@eclypsium.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        Richard Hughes <hughsient@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Mi., 10. Nov. 2021 um 17:32 Uhr schrieb Andy Shevchenko
<andy.shevchenko@gmail.com>:
> Why do we see this instead?

I personally do not need this patch to be in the kernel. This is my
first ever submission to the LKML and all I was trying to do is do
other open source tools a favor in my spare time during my HOLIDAY. At
least for me that is it. After this horrible experience you can be
sure to never ever see anything again from me in the Linux community.

Hans-Gert
