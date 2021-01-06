Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D62C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 20:49:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 848972311B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 20:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbhAFUtu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:49:50 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:16716 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbhAFUtt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 15:49:49 -0500
Date:   Wed, 06 Jan 2021 20:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609966146;
        bh=0+VgupX5ZuyBNMrDnThwZZA4txCR5DrqpVo8AXr4e88=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=gORV0nqKj9bcnz6mPbi266PJHzCGE6pcvpLqGDg+Yqg0ML2Lkj1Ph9lZvRFDiKiyh
         or3HXN5vZ2R80S9GaS+uTL0mS1BiZK/+KMP6kJkhztxn7FM/bXoD7WOznrY6Pd+07G
         I0OHTYyjO2gV5rtRRS1l1uSOpOKDv7IpCPHVCYww=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <J3-J89FbEfOIFJXsEo9jy23l2lFJ1QIe_VecEe_Z5v24gd3SgLAyAhxgJ0gq2IB0dFc1OSCuV2-O3YFMEgqkn_katLZqCJ2_YBNaegDgjOU=@protonmail.com>
In-Reply-To: <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
References: <20201216013857.360987-1-pobrn@protonmail.com> <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2021. janu=C3=A1r 6., szerda 19:23 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:

> [...]
> Thank you for this series, it is good to see all the
> cleanups, as well as to see the new functionality.
>
> Patches 1-20 and 22-24 look good to me and you may add my:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> To them for v2 of this patch-set.
>

Thanks for the review.


> I have some remarks about patch 21 I will reply to that one
> separately.
>
> One minor remark about patch 3/24, normally we put all
> the #include <linux/foo.h> includes first (sorted
> alphabetically as you already do in the patch) and then
> follow up by other / subsys specific include such as
> acpi/video.h. Again sorted alphabetically for the file-names
> after the subsys dir. I don't think there really is any
> preferred order for which subsys headers to include first,
> but typically the generic linux/foo.h headers are included
> first.
>

I will change the order as requested.


> Regards,
>
> Hans
>
> p.s.
>
> About merging this series vs other outstanding ideapad-laptop
> changes. The other outstanding changes are quite small, so easy
> to rebase. As such I would actually prefer to merge this series
> first. So if you can send out a v2 soon-ish, then that would be
> great.

That would make it harder to backport, no? As far as I remember, the patch[=
1] was
sent to stable@kernel.org as well.

[1]: https://lore.kernel.org/platform-driver-x86/20210103033651.47580-1-jia=
xun.yang@flygoat.com/#t


Regards,
Barnab=C3=A1s P=C5=91cze


p.s.
My previous reply to this thread was meant to be a reply to
https://lore.kernel.org/platform-driver-x86/770007e6-a06f-eb0a-112c-17e2eb3=
96ae5@redhat.com/
