Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFE3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5623864E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhBCVzD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:03 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:24015 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbhBCVzC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:02 -0500
Date:   Wed, 03 Feb 2021 21:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389259;
        bh=yT6QTzUrl3GHnd8VSZNnqn2cCk74R1GWEcNuxk4hIyI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=n8K4ufwh1NilmdqdLO/OuezTONU+efh+kzSTz2pfEiOqoUy57/FtBhyxvpc6tN/P5
         nealMRCQyx+c1qteH70qe+AWvg4bd6WPtVPKba5caekpR5nC29yBtwhm+XpHLEYiNg
         yKXCk9NVHJ/t8FGCH3FXAz2LHbk7oRd6BToQF46w=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 00/29] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changes in v3:
 -      rebase on eabe533904cbcb6c7df530fd807cf2a3c3567d35
        ("platform/x86: ideapad-laptop: DYTC Platform profile support"),
        which is referred to as "DYTC patch" in this changelog
 - {02} *new patch*
 - {03} minor formatting changes
 - {05} *new patch*
 - {07} *new patch*
 - {08} *new patch*
 - {09} minor formatting change
 - {10} use while loop
 - {11} restore log message severity
 - {12} *new patch*
 - {13} reorder variable definitions,
        apply to DYTC patch
 - {14} mention ABI breakage
 - {15} mention ABI breakage,
        use `!!` to convert to `int` and "%d" in sysfs_emit(),
        convert 'camera_power' attribute to boolean-like
 - {17} reorder varible definitions,
        apply to DYTC patch
 - {18} minor formatting changes,
        add log messages
 - {19} minor formatting change
 - {20} move `&&` to end of line
 - {21} no longer return -ENODATA due to {02},
        explicit alignment instead of tabs in output
 - {22} no longer return -ENODATA due to {02}
 - {24} reorder device attribute callbacks,
        remove some empty lines,
        apply to DYTC patch
 - {26} use `!!` to map to range [0, 1],
        add log messages
 - {27} move documentation change to this patch
 - {28} add "Fixes" tag
 - {29} add "Fixes" tag

I hope I addressed all concerns adequately, if not, do not hesistate to rem=
ind me.
=20
History:
 - v2: https://lore.kernel.org/platform-driver-x86/20210113182016.166049-1-=
pobrn@protonmail.com/
 - v1: https://lore.kernel.org/platform-driver-x86/20201216013857.360987-1-=
pobrn@protonmail.com/

Barnab=C3=A1s P=C5=91cze (29):
  platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
    call
  platform/x86: ideapad-laptop: remove unnecessary NULL checks
  platform/x86: ideapad-laptop: use appropriately typed variable to
    store the return value of ACPI methods
  platform/x86: ideapad-laptop: sort includes lexicographically
  platform/x86: ideapad-laptop: add missing call to submodule destructor
  platform/x86: ideapad-laptop: use sysfs_emit()
  platform/x86: ideapad-laptop: use device_{add,remove}_group
  platform/x86: ideapad-laptop: use kobj_to_dev()
  platform/x86: ideapad-laptop: use for_each_set_bit() helper to
    simplify event processing
  platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
    hand-crafted formula
  platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
    variant to display log messages
  platform/x86: ideapad-laptop: check return value of
    debugfs_create_dir() for errors
  platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in
    case of failure
  platform/x86: ideapad-laptop: always propagate error codes from device
    attributes' show() callback
  platform/x86: ideapad-laptop: misc. device attribute changes
  platform/x86: ideapad-laptop: group and separate (un)related constants
    into enums
  platform/x86: ideapad-laptop: rework and create new ACPI helpers
  platform/x86: ideapad-laptop: rework is_visible() logic
  platform/x86: ideapad-laptop: check for Fn-lock support in HALS
  platform/x86: ideapad-laptop: check for touchpad support in _CFG
  platform/x86: ideapad-laptop: change 'status' debugfs file format
  platform/x86: ideapad-laptop: change 'cfg' debugfs file format
  Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be
    RO"
  platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent
    style
  platform/x86: ideapad-laptop: send notification about touchpad state
    change to sysfs
  platform/x86: ideapad-laptop: add keyboard backlight control support
  platform/x86: ideapad-laptop: add "always on USB charging" control
    support
  Documentation/ABI: sysfs-platform-ideapad-laptop: update device
    attribute paths
  Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode
    attribute

 .../ABI/testing/sysfs-platform-ideapad-laptop |   26 +-
 drivers/platform/x86/ideapad-laptop.c         | 1284 ++++++++++-------
 2 files changed, 810 insertions(+), 500 deletions(-)

--=20
2.30.0

