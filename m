Return-Path: <SRS0=2mT5=DG=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1214C4741F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 09:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 614D82076B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 09:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCbtdjMk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgI2JVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Sep 2020 05:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21463 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727819AbgI2JVu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Sep 2020 05:21:50 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601371308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OxkL9edd3klOYZsE04LNk3Q3a0XrQFbdAzhYffJlb4A=;
        b=eCbtdjMk1Urr699+qULveXAurEQvB7ddVUvk4qjlrRuqayXkX3Yisi9vZqsjmeDyN1+4rQ
        PiyAsQI09NcvCPSRyQ0/9c0eu1+gDIIgoz2GVR496DpDPCCGnI20DRTcDd8ksmo+C1ICSg
        zviRzzBVSRJh83MWxNh/TihRsQU5t1s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Beg3xEpSNZKSbxzjN_pqgg-1; Tue, 29 Sep 2020 05:21:31 -0400
X-MC-Unique: Beg3xEpSNZKSbxzjN_pqgg-1
Received: by mail-ed1-f69.google.com with SMTP id 63so1872397edy.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2020 02:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OxkL9edd3klOYZsE04LNk3Q3a0XrQFbdAzhYffJlb4A=;
        b=m/LPB9+xG1CnQvFrf08LBJT0LWiBgRu9BWOMyh/abU+Xn9NbjTlckry1XU7vXSCQpC
         8lSjjQP8jLKPGhPGqn/KAbPgq7GADMArprgZxSWKC1n0nCJ7Ib5aD+7azFd/kEFznHmE
         ZXOymr3qfNpL2meagOOkeXmguDh4XFmJ9DVzwKYuIh9jTZykc1NQ0ggbTSzP1N4mU0a6
         7Pd3iKcCzHyRKpvpmPkHdwSlYAA/ODpvy0a7I6TLk2p/O1KUKQYD9XtZgzRU1iAWKgM+
         CG4kTIO+rmm7VIsULH6SxNllxvuIWmQy7TscZIkH9TLAGLcT1C4a5cWNrt9PEuZRSENF
         ZYTA==
X-Gm-Message-State: AOAM533ydsVPvGc/KsGZw1g06hnwaAZcbYf9bq2ZHKjw4Q0GJsudfa1v
        T4K4aty9pm6WH3KfGjSuwQDQvUz/Win32VYHa7yEQ5f3PaMXCAOl2sFHCO4IQYUIZNBQGWUqOGy
        yNuniLTv1EPURpjcSBh6XVBeeCPDSP6zgIw==
X-Received: by 2002:a05:6402:187:: with SMTP id r7mr2122667edv.360.1601371289580;
        Tue, 29 Sep 2020 02:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8Jn9nWCfBaNfnlJgvj0ppa6ylFOo9Iy2nfw4M0SpXHm+wTgTrkJMDzOgSKHwfXM1ua4Q1Ig==
X-Received: by 2002:a05:6402:187:: with SMTP id r7mr2122657edv.360.1601371289390;
        Tue, 29 Sep 2020 02:21:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id um10sm4826712ejb.8.2020.09.29.02.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 02:21:28 -0700 (PDT)
Subject: Re: Keyboard regression by intel-vbtn
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <s5hft71klxl.wl-tiwai@suse.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bedb9d1b-3cca-43e2-ee44-1aac0e09a605@redhat.com>
Date:   Tue, 29 Sep 2020 11:21:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hft71klxl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/20 10:48 AM, Takashi Iwai wrote:
> Hi Hans,
> 
> it seems that the recent update of intel-vtn broke the keyboard input
> on some laptops with libinput:
>    https://bugzilla.opensuse.org/show_bug.cgi?id=1175599
> 
> Blacklisting intel-vtn fixes the issue, so it's likely the falsely
> reported tablet mode switch that leads libinput misbehaving.  The
> affected machines are Acer E5-511 and ASUS X756UX laptops, and they
> shouldn't have the tablet mode at all, AFAIK.
> 
> Could you take a look?  I guess it's the commit cfae58ed681c that
> broke.  The chassis type is Notebook on those, and this type should be
> excluded as well as Laptop.
> 
> The dmidecode outputs and other info are found in the bugzilla above:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841999
>    https://bugzilla.opensuse.org/attachment.cgi?id=842039
> 
> The one for ASUS is embedded in hwinfo outpt:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841157

Ugh. What a mess, sorry about this.

So as the commit message from commit cfae58ed681c
("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
explains the reason to NOT NOT report SW_TABLET_MODE on devices
with a chassis type of 10 ("Notebook") is that at least
some HP ... 360 ... models use that chassis type and do
report a correct SW_TABLET_MODE through the intel-vbtn driver.

The SW_TABLET_MODE on these actually got regressed by
de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode switch on 2-in-1's")
which first introduced the chassis-type check.

And to complicate things further even though some
HP ... 360 ... models use that chassis type and from the DSDT
it seems that they do report a correct SW_TABLET_MODE through the
intel-vbtn driver. In practice it is also broken on some
HP ... 360 ... models, see:

https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on-kernel-5-6/22668
http://git.infradead.org/linux-platform-drivers-x86.git/commit/d823346876a970522ff9e4d2b323c9b734dcc4de
"platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360"

Since the problem of wrongly reporting SW_TABLET_MODE=1 in combination
with libinput, leads to a non-usable system. Where as OTOH many people will
not even notice when SW_TABLET_MODE is not being reported, I believe it
is best to move to a dmi based allow-list approach here, as we recently
did for SW_TABLET_MODE reporting by the asus-wmi driver. Allowing:

dmi chassis-types: 8 /* Portable */,  31 /* Convertible */, 32 /* Detachable */
and the HP Stream x360 11-p000nd which has working intel-vbtn SW_TABLET_MODE
support combined with a chassis-type of 10 /* Notebook */.

I will prepare a patch for this right away.

Note this patch will effectively replace:
"platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360"
We will no longer need this workaround with the allow list and I believe
that it would be better to drop that one.

Andy can you drop that one from your review-andy branch please?

Regards,

Hans


