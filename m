Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA76EC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67CD123436
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbhAMSVN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:21:13 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:21391 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbhAMSVM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:21:12 -0500
Date:   Wed, 13 Jan 2021 18:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562028;
        bh=gwc5M9fQ+hX5NqBYniw8MR3EgZLguHiWvR8DCUbXGE4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=sFuuEd4cxBFG3nhvp1YvNvHHBk6bFFKsQ9xphktaxVjnpXgTKDPMo3t78KXR6CaqD
         WFVOGDnJLZGI0kaEx7UDxYgq7k/UE4U9S9Mes86PuPlC//VRcPmgBrBmRxylB0RxjV
         Hwc6rDRjaIXWTr1/YAJaDJbanvM7I66Eh/ZVFKCo=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 00/24] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <20210113182016.166049-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This series contains patches that aim to bring more consistency
to the code; add keyboard backlight control support; add
"always on USB charging" control support.
Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683
("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")
is reverted since it made it impossible to disable/enable the touchpad via =
the
ideapad-laptop module and on some devices the method implemented in the
module works correctly to disable/enable the touchpad.

Changes in v2:
 - rebase on commit d69cd7eea93eb59a93061beeb43e4f5e19afc4ea
   ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
 - [03] change how the #include directives are grouped and sorted
 - [13] change the order of members in the `features` struct in `struct ide=
apad_private`
        to roughly match that of the `ideapad_attributes` array
 - [15] change `CFG_CAP_TOUCHPAD_BIT` to 30 as it is the correct value inst=
ead of
        31 that appeared in the previous version
 - [19] remove extra whitespaces in the ACPI device id table
 - [21] select NEW_LEDS and LEDS_CLASS in Kconfig
 - [21] check for keyboard backlight support in `ideapad_check_features()`
        not separately in `ideapad_kbd_bl_init()`
 - [24] change KernelVersion of the `usb_charging` attribute to 5.12

History:
 - v1: https://lore.kernel.org/platform-driver-x86/20201216013857.360987-1-=
pobrn@protonmail.com/

Barnab=C3=A1s P=C5=91cze (24):
  platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
    call
  platform/x86: ideapad-laptop: use appropriately typed variable to
    store the return value of ACPI methods
  platform/x86: ideapad-laptop: sort includes lexicographically
  platform/x86: ideapad-laptop: use sysfs_emit()
  platform/x86: ideapad-laptop: use for_each_set_bit() helper to
    simplify event processing
  platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
    hand-crafted formula
  platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
    variant to display log messages
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
    and usb_charging

 .../ABI/testing/sysfs-platform-ideapad-laptop |   26 +-
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/ideapad-laptop.c         | 1063 +++++++++++------
 3 files changed, 702 insertions(+), 389 deletions(-)

--=20
2.30.0

