Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55DDC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BEAE207BC
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbhADOLP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:11:15 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:35753 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhADOLP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:11:15 -0500
Date:   Mon, 04 Jan 2021 14:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609769432;
        bh=whXRbK2A+bStQ4OaPK2MGD7P0DGU3PQk2/0lPI/Jwdw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MvbAMmLR5hNw1av9tMPbiaS6R2TS7j1opFXGcG3INQJxQINvuGnY5WNiZxV/r4kJ5
         8ldYDhPaLfrX72p667byRN6YdUq/7jf759z4+CIWjXzRsIMZ13uXEwJEJytDYyv8ab
         kq4hpTldcFg5okmyfPj9Sll9wT3whWvpz1ZSiLE8=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <6pY9uysbdjcsHSZ0pDkhQ6gasikcDwymJy4OIP2y7ydX_s1BCMQZH4W1b5XYLVuJYJiDKyycNP8gSYyFmW9H1mBT_kQvdKx8vGm64kSi_eA=@protonmail.com>
In-Reply-To: <fa684b4c-4f0e-ec0e-4522-cffb2bba106f@redhat.com>
References: <20201216013857.360987-1-pobrn@protonmail.com> <YGRDwoO_mZPu_JF1FiT-FpjTx11PTttBt1TuVvH9e7lLxLsv6f0EkQZI6u_GtLGUOQzQPQTZwsYD0Rse7TiUEQiBCio2oVzXiG-OETPf9mA=@protonmail.com> <fa684b4c-4f0e-ec0e-4522-cffb2bba106f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2021. janu=C3=A1r 4., h=C3=A9tf=C5=91 15:03 keltez=C3=A9ssel, Hans de Goede=
 =C3=ADrta:

> Hi Barnab=C3=A1s,
>
> On 1/4/21 1:03 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> > 2020.  december 16., szerda 2:39 keltez=C3=A9ssel, Barnab=C3=A1s P=
=C5=91cze =C3=ADrta:
> >
> > > This series contains patches that aim to bring more consistency
> > > to the code; add keyboard backlight control support; add
> > > "always on USB charging" control support.
> > > Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683 is rever=
ted
> > > since it made it impossible to disable/enable the touchpad via the
> > > ideapad-laptop module and on some devices the method implemented in t=
he
> > > module works correctly to disable/enable the touchpad.
> > > Barnab=C3=A1s P=C5=91cze (24):
> > > platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
> > > call
> > > platform/x86: ideapad-laptop: use appropriately typed variable to
> > > store the return value of ACPI methods
> > > platform/x86: ideapad-laptop: sort includes lexicographically
> > > platform/x86: ideapad-laptop: use sysfs_emit()
> > > platform/x86: ideapad-laptop: use for_each_set_bit() helper to
> > > simplify event processing
> > > platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead o=
f
> > > hand-crafted formula
> > > platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
> > > variant to display log messages
> > > platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in
> > > case of failure
> > > platform/x86: ideapad-laptop: always propagate error codes from devic=
e
> > > attributes' show() callback
> > > platform/x86: ideapad-laptop: misc. device attribute changes
> > > platform/x86: ideapad-laptop: group and separate (un)related constant=
s
> > > into enums
> > > platform/x86: ideapad-laptop: rework and create new ACPI helpers
> > > platform/x86: ideapad-laptop: rework is_visible() logic
> > > platform/x86: ideapad-laptop: check for Fn-lock support in HALS
> > > platform/x86: ideapad-laptop: check for touchpad support in _CFG
> > > platform/x86: ideapad-laptop: change 'status' debugfs file format
> > > platform/x86: ideapad-laptop: change 'cfg' debugfs file format
> > > Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be
> > > RO"
> > > platform/x86: ideapad-laptop: fix checkpatch warnings, more consisten=
t
> > > style
> > > platform/x86: ideapad-laptop: send notification about touchpad state
> > > change to sysfs
> > > platform/x86: ideapad-laptop: add keyboard backlight control support
> > > platform/x86: ideapad-laptop: add "always on USB charging" control
> > > support
> > > Documentation/ABI: sysfs-platform-ideapad-laptop: update device
> > > attribute paths
> > > Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode
> > > and usb_charging
> > > .../ABI/testing/sysfs-platform-ideapad-laptop | 26 +-
> > > drivers/platform/x86/ideapad-laptop.c | 1047 +++++++++++------
> > > 2 files changed, 692 insertions(+), 381 deletions(-)
> > >
> > > 2.29.2
> >
> > A patch in the series a serious flaw which I have just noticed;
> > I will send a new version when the situation about a conflicting
> > patch1 becomes clear.
>
> Thank you for the headsup, I will try to make some time to review v1
> of this series, so that you can take any review-remarks which I might
> have into account when posting v2 (or add my reviewed-by for patches
> for which I have no remark).
>
> May I ask which patch is flawed and what the flaw is ? Then I can skip
> that while reviewing. I hope to get around to reviewing v1 (this version)
> of this series this Wednesday (but no promises).
>

Hi


In "platform/x86: ideapad-laptop: check for touchpad support in _CFG", the =
bit
is off by one. It should be 30, not 31.


Regards,
Barnab=C3=A1s P=C5=91cze
