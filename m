Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9064C10F1D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 18:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiLHS0q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 13:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiLHS0o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 13:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DD58AAC5
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670523950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+1VVUcW2d/r4TNKwvpnKWV11TO1c/pvTjCV/IvxcjRo=;
        b=WJb7TRXwnCFuj+7XPr7gVVGIYQk9GBARIM1HWWhmjDSzT7J4/qELYi4WzPvNuVQFDTggds
        aQY+SSiaGEAVh7y2242SoPZROZp5EjQhkXogimzlVjonKesPYTPtjxvziI7v8vJCiwKCXz
        lr6bdzW3c+CKN4djW2hXeQXDbfHMtnc=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-_H4AROgjMXCPPjIo_mMPzA-1; Thu, 08 Dec 2022 13:25:49 -0500
X-MC-Unique: _H4AROgjMXCPPjIo_mMPzA-1
Received: by mail-io1-f72.google.com with SMTP id o22-20020a6b5a16000000b006e2d564944aso100134iob.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 10:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1VVUcW2d/r4TNKwvpnKWV11TO1c/pvTjCV/IvxcjRo=;
        b=Kg3k9ePjI31mqw9ANYFlxpC5Cs+93Kj7rk/grYB0dIGbKPE1P6BOqGtoENTndGdODm
         Q0tvUVb2gLB8l1Kwd7tpkTYJGP3W/KP4IA9ZVzTXhVjieXEa4un2O4cj9sFVw5WzfpmT
         v8l9JGviqzt/w9qitOnPI6KoNAZST79WElhHFgi6lzyE1G9eA9K8vMp71F4xA6JacUCq
         KcU4aRRE2c3RdhLeGgY2/GUPz1k8o2QpUk8UILu1SHNLxgrHDU01M3iLHN8w7yhbyxna
         9CMBFB7S4fGfw/b5NDSmeuXq8mSjLyHx+hjh8Nn5KPWkEjjDexMzJz6KHvsaNmxVgQNZ
         owjQ==
X-Gm-Message-State: ANoB5pkj4AEQdyX96QIqOk1hyCuZ17vGC+3p8sSpR9xDEPU7rb2UjwU1
        3Jt3iFuUGwSbJMtTZCoMebwAKaWBdY5rScTc7+JbmR16TAgxavBHKSHqXYzsozRovb361178Ncg
        xbuM09hVzzU4NcdSw8FytVtdLWIX7Ca2ZjcSVBbltXkkT3TpQjQ==
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id h23-20020a02c737000000b003751c5f3127mr35668688jao.251.1670523948072;
        Thu, 08 Dec 2022 10:25:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XCBcc0cLWH0jfXhA5ZbFHiNTG82whiCD4Mw1h1hz6rEL64t1cqCthrqMh8k4p9AolzPHI251n+gp0C6VYXbE=
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id
 h23-20020a02c737000000b003751c5f3127mr35668682jao.251.1670523947849; Thu, 08
 Dec 2022 10:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
 <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com> <CAO-hwJLHzRCJF96gKJwj7zCCPxRLoEw=cQ2w8=yLBOfyZz-c8w@mail.gmail.com>
 <304bce39-2ece-863c-33b3-b432685faa2d@gmail.com>
In-Reply-To: <304bce39-2ece-863c-33b3-b432685faa2d@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 8 Dec 2022 19:25:36 +0100
Message-ID: <CAO-hwJJ3MLvSeEkqdT_aj6kHLWzk2sVNRVsaeyfk4VpTdzK5Gw@mail.gmail.com>
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Dec 8, 2022 at 5:49 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> On 12/8/22 17:24, Benjamin Tissoires wrote:
> > On Thu, Dec 8, 2022 at 5:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Maximilian,
> >>
> >> On 12/2/22 23:33, Maximilian Luz wrote:
> >>> We have some new insights into the Serial Hub protocol, obtained through
> >>> reverse engineering. In particular, regarding the command structure. The
> >>> input/output target IDs actually represent source and target IDs of
> >>> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> >>> debug connector, and SurfLink connector).
> >>>
> >>> This series aims to improve handling of messages with regards to those
> >>> new findings and, mainly, improve clarity of the documentation and usage
> >>> around those fields.
> >>>
> >>> See the discussion in
> >>>
> >>>      https://github.com/linux-surface/surface-aggregator-module/issues/64
> >>>
> >>> for more details.
> >>>
> >>> There are a couple of standouts:
> >>>
> >>> - Patch 1 ensures that we only handle commands actually intended for us.
> >>>    It's possible that we receive messages not intended for us when we
> >>>    enable debugging. I've kept it intentionally minimal to simplify
> >>>    backporting. The rest of the series patch 9 focuses more on clarity
> >>>    and documentation, which is probably too much to backport.
> >>>
> >>> - Patch 8 touches on multiple subsystems. The intention is to enforce
> >>>    proper usage and documentation of target IDs in the SSAM_SDEV() /
> >>>    SSAM_VDEV() macros. As it directly touches those macros I
> >>>    unfortunately can't split it up by subsystem.
> >>>
> >>> - Patch 9 is a loosely connected cleanup for consistency.
> >>
> >> Thank you for the patches. Unfortunately I don't have time atm to
> >> review this.
> >>
> >> And the next 2 weeks are the merge window, followed by 2 weeks
> >> of christmas vacation.
> >>
> >> So I'm afraid that I likely won't get around to reviewing
> >> this until the week of January 9th.
> >>
> >>> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> >>> aggregator: Enforce use of target-ID enum in device ID macros") touches
> >>> multiple subsystems, it should be possible to take the whole series
> >>> through the pdx86 tree. The changes in other subsystems are fairly
> >>> limited.
> >>
> >> I agree that it will be best to take all of this upstream through the
> >> pdx86 tree. Sebastian thank you for the ack for patch 8/9.
> >>
> >> Jiri or Benjamin may we have your ack for merging patch 7/9 + 8/9
> >> through the pdx86 tree ?
> >
> > I can give you an ack for taking those through your tree, but I can
> > not review the patches themselves because I was only CC-ed to those 2,
> > and so was linux-input. Given that SSAM_SSH_TID_KIP is not in my
> > current tree I assume it comes from this series.
> >
> > Anyway, enough ranting :)
>
> Apologies for that. I should have included you in the CC on at least
> patch 2 as well, which introduces this symbol.

No need to apologize. There is a tight balance between not annoying
people with too many emails and then having those people wanting to
have all of the series :)

I have enough trust in Hans to know that when he reviewed the series,
he did it correctly.

>
> FWIW, here's the patchwork link to this series:
>
>    https://patchwork.kernel.org/project/platform-driver-x86/list/?series=701392

thanks!

Cheers,
Benjamin

