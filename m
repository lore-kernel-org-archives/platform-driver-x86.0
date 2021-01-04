Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C912C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24A821E92
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbhADMEK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 07:04:10 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:61578 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbhADMEK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 07:04:10 -0500
Date:   Mon, 04 Jan 2021 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609761807;
        bh=wV/HHt/UgttX1dzmUxhgG0SL4nodJGvIK2gtiCWnZu4=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=Z+nRf/pDPA7Q2WtfFXYEu+CgUFWyqJs3zrq1z4Qw8D9Uf/mcTFC8/HxR/6T83i1kZ
         4GDRxKNJxR5/kkyIyiBu4A/EqWmuV66CBagXMzzssmdHeA9oDXaYMB7a1+r0hGIb7D
         sjRZksMshqVb3QzAXQvWI8dHE8DAnfW039etbdgg=
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <YGRDwoO_mZPu_JF1FiT-FpjTx11PTttBt1TuVvH9e7lLxLsv6f0EkQZI6u_GtLGUOQzQPQTZwsYD0Rse7TiUEQiBCio2oVzXiG-OETPf9mA=@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2020. december 16., szerda 2:39 keltez=C3=A9ssel, Barnab=C3=A1s P=C5=91cze =
=C3=ADrta:

> This series contains patches that aim to bring more consistency
> to the code; add keyboard backlight control support; add
> "always on USB charging" control support.
> Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683 is reverted
> since it made it impossible to disable/enable the touchpad via the
> ideapad-laptop module and on some devices the method implemented in the
> module works correctly to disable/enable the touchpad.
>
> Barnab=C3=A1s P=C5=91cze (24):
> platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
> call
> platform/x86: ideapad-laptop: use appropriately typed variable to
> store the return value of ACPI methods
> platform/x86: ideapad-laptop: sort includes lexicographically
> platform/x86: ideapad-laptop: use sysfs_emit()
> platform/x86: ideapad-laptop: use for_each_set_bit() helper to
> simplify event processing
> platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
> hand-crafted formula
> platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
> variant to display log messages
> platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in
> case of failure
> platform/x86: ideapad-laptop: always propagate error codes from device
> attributes' show() callback
> platform/x86: ideapad-laptop: misc. device attribute changes
> platform/x86: ideapad-laptop: group and separate (un)related constants
> into enums
> platform/x86: ideapad-laptop: rework and create new ACPI helpers
> platform/x86: ideapad-laptop: rework is_visible() logic
> platform/x86: ideapad-laptop: check for Fn-lock support in HALS
> platform/x86: ideapad-laptop: check for touchpad support in _CFG
> platform/x86: ideapad-laptop: change 'status' debugfs file format
> platform/x86: ideapad-laptop: change 'cfg' debugfs file format
> Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be
> RO"
> platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent
> style
> platform/x86: ideapad-laptop: send notification about touchpad state
> change to sysfs
> platform/x86: ideapad-laptop: add keyboard backlight control support
> platform/x86: ideapad-laptop: add "always on USB charging" control
> support
> Documentation/ABI: sysfs-platform-ideapad-laptop: update device
> attribute paths
> Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode
> and usb_charging
>
> .../ABI/testing/sysfs-platform-ideapad-laptop | 26 +-
> drivers/platform/x86/ideapad-laptop.c | 1047 +++++++++++------
> 2 files changed, 692 insertions(+), 381 deletions(-)
>
> ---
>
> 2.29.2

A patch in the series a serious flaw which I have just noticed;
I will send a new version when the situation about a conflicting
patch[1] becomes clear.

[1]: https://www.spinics.net/lists/platform-driver-x86/msg24007.html
